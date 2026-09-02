import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

/** Add a searchable marker to the displayed start of every user prompt. */
export default function (pi: ExtensionAPI) {
  pi.registerMarkdownTransformer((markdown, { messageType }) => {
    if (messageType !== "user") return markdown;
    return `❯ ${markdown}`;
  });
}
