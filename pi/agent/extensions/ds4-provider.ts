import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

/** Register the private DwarfStar server without committing its address. */
export default function (pi: ExtensionAPI) {
  const baseUrl = process.env.DS4_BASE_URL?.replace(/\/$/, "");
  if (!baseUrl) return;

  pi.registerProvider("ds4", {
    name: "DwarfStar",
    baseUrl,
    api: "openai-completions",
    apiKey: "dsv4-local",
    compat: {
      supportsStore: false,
      supportsDeveloperRole: false,
      supportsReasoningEffort: true,
      supportsUsageInStreaming: true,
      maxTokensField: "max_tokens",
      supportsStrictMode: false,
      thinkingFormat: "deepseek",
      requiresReasoningContentOnAssistantMessages: true,
    },
    models: [
      {
        id: "deepseek-v4-flash",
        name: "DwarfStar Flash",
        reasoning: true,
        thinkingLevelMap: {
          off: null,
          minimal: "low",
          low: "low",
          medium: "medium",
          high: "high",
          xhigh: "xhigh",
        },
        input: ["text"],
        contextWindow: 32768,
        maxTokens: 16384,
        cost: { input: 0, output: 0, cacheRead: 0, cacheWrite: 0 },
      },
    ],
  });
}
