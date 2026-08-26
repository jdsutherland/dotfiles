(() => {
  const isChatGPT = location.hostname === "chatgpt.com";
  const isGemini = location.hostname === "gemini.google.com";

  const isVisible = (element) => {
    const rect = element.getBoundingClientRect();
    const style = getComputedStyle(element);
    return rect.width > 0 && rect.height > 0 && style.visibility !== "hidden" && style.display !== "none";
  };

  const description = (element) => [
    element.getAttribute("aria-label"),
    element.getAttribute("title"),
    element.getAttribute("data-testid"),
    element.getAttribute("data-test-id"),
    element.textContent,
  ].filter(Boolean).join(" ").replace(/\s+/g, " ").trim();

  const actionableElements = () => [
    ...document.querySelectorAll("button, a, [role='button'], [role='menuitem']"),
  ].filter(isVisible);

  const clickFirst = (patterns, filter = () => true) => {
    const element = actionableElements().find((candidate) => {
      const label = description(candidate);
      return filter(candidate) && patterns.some((pattern) => pattern.test(label));
    });

    if (!element) return false;
    element.click();
    return true;
  };

  const toggleSidebar = () => {
    if (isChatGPT) {
      return clickFirst([
        /open[-_ ]sidebar/i,
        /close[-_ ]sidebar/i,
        /toggle[-_ ]sidebar/i,
        /expand[-_ ]sidebar/i,
        /collapse[-_ ]sidebar/i,
      ]);
    }

    if (isGemini) {
      return clickFirst([
        /side[-_ ]nav[-_ ]menu/i,
        /expand (?:the )?menu/i,
        /collapse (?:the )?menu/i,
        /open (?:the )?menu/i,
        /close (?:the )?menu/i,
        /toggle (?:the )?menu/i,
        /navigation menu/i,
      ], (element) => {
        const rect = element.getBoundingClientRect();
        return rect.top < 120 && rect.left < 500;
      });
    }

    return false;
  };

  const searchChats = () => clickFirst([
    /^search chats$/i,
    /search[-_ ]chats/i,
  ]);

  document.addEventListener("keydown", (event) => {
    if (!event.ctrlKey || event.altKey || event.metaKey || event.shiftKey) return;

    if (event.code === "Backslash") {
      if (toggleSidebar()) {
        event.preventDefault();
        event.stopImmediatePropagation();
      }
      return;
    }

    // ChatGPT already implements Ctrl+K itself. Gemini currently focuses the
    // composer, so replace that behavior with its Search chats control.
    if (event.code === "KeyK" && isGemini && searchChats()) {
      event.preventDefault();
      event.stopImmediatePropagation();
    }
  }, true);
})();
