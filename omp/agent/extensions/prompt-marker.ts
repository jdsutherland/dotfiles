import type { ExtensionAPI } from "@oh-my-pi/pi-coding-agent";

const MARKER = "❯ ";
const COMMAND_PREFIXES = ["/", "!", "$", "->", "=>"];

function stripMarker(text: string): string {
  return text.startsWith(MARKER) ? text.slice(MARKER.length) : text;
}

/**
 * Keep a visible marker on persisted user prompts so tmux can search through
 * them. OMP has no display-only Markdown transformer like Pi, so the context
 * hook removes the marker again before messages are sent to the model.
 */
export default function (pi: ExtensionAPI) {
  pi.on("input", (event) => {
    if (event.source !== "interactive" || event.text.startsWith(MARKER)) return;
    if (COMMAND_PREFIXES.some((prefix) => event.text.startsWith(prefix))) return;
    return { text: `${MARKER}${event.text}` };
  });

  pi.on("context", (event) => ({
    messages: event.messages.map((message) => {
      if (message.role !== "user") return message;
      if (typeof message.content === "string") {
        return { ...message, content: stripMarker(message.content) };
      }
      return {
        ...message,
        content: message.content.map((part) =>
          part.type === "text" ? { ...part, text: stripMarker(part.text) } : part,
        ),
      };
    }),
  }));
}
