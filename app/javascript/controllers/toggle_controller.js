import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement"];

  connect() {
      console.log("hi");
  }

  toggleVisibility() {
      this.togglableElementTarget.classList.toggle("hidden");
      this.toggleButtonTarget.classList.toggle("active");
  }

  toggleButtonVisibility() {
    this.toggleButtonTarget.classList.toggle("active");
  }
}
