// dcg-guard.ts — block destructive shell commands with dcg
// https://github.com/Dicklesworthstone/destructive_command_guard
import { spawn } from "node:child_process";

const DCG_BIN = process.env.DCG_BIN ?? `${process.env.HOME ?? ""}/.local/bin/dcg`;

function dcgDecision(command: string): Promise<{ deny: boolean; reason: string }> {
  return new Promise((resolve) => {
    const child = spawn(DCG_BIN, ["--robot", "test", command], {
      stdio: ["ignore", "pipe", "ignore"],
    });

    let stdout = "";
    child.stdout.on("data", (chunk) => {
      stdout += chunk.toString();
    });

    // Fail closed if dcg cannot be found or spawned. An agent must not lose
    // destructive-command protection because its guard is unavailable.
    child.on("error", () => resolve({
      deny: true,
      reason: `dcg unavailable at ${DCG_BIN}; refusing to run the command.`,
    }));

    child.on("close", (code) => {
      if (code === 1) {
        // Denied. The reason lives in the robot-mode JSON.
        let reason = "Blocked by dcg (destructive command).";
        try {
          const parsed = JSON.parse(stdout);
          if (parsed?.reason) reason = parsed.reason;
          if (parsed?.rule_id) reason += ` [${parsed.rule_id}]`;
        } catch {
          /* keep the default reason */
        }
        resolve({ deny: true, reason });
      } else if (code === 0) {
        resolve({ deny: false, reason: "" });
      } else {
        resolve({
          deny: true,
          reason: `dcg failed with exit code ${code ?? "unknown"}; refusing to run the command.`,
        });
      }
    });
  });
}

export default function (pi: ExtensionAPI) {
  pi.on("tool_call", async (event) => {
    if (event.toolName !== "bash") return;
    const command = String(event.input?.command ?? "");
    if (!command.trim()) return;

    const { deny, reason } = await dcgDecision(command);
    if (deny) {
      return { block: true, reason };
    }
  });
}
