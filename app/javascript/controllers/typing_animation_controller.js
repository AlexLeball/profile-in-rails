import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="typing-animation"
export default class extends Controller {
  static targets = ["text"];

  connect() {
    this.startTyping();
  }

  startTyping() {
    const text = this.textTarget.textContent;
    this.textTarget.textContent = ""; // Clear the existing text

    this.typeWriter(text, 0);
  }

  typeWriter(text, index) {
    if (index < text.length) {
      const char = text.charAt(index);

      // Skip spaces
      if (char === ' ') {
        this.textTarget.textContent += char;
        this.typeWriter(text, index + 1);
      } else {
        this.textTarget.textContent += char;
        setTimeout(() => this.typeWriter(text, index + 1), 100); // Adjust the delay for typing speed
      }
    }
  }
}
