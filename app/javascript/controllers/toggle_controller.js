import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "toggleButton"]

  connect() {
      console.log("hi");
  }

  toggleVisibility() {
    this.togglableElementTarget.classList.toggle("hidden");
    this.toggleButtonTarget.classList.toggle("show");
    this.toggleButtonVisibility();
  }

  toggleButtonVisibility() {
    this.toggleButtonTarget.innerHTML = "See More";
      if (this.toggleButtonTarget.classList.contains("show")) {
        this.toggleButtonTarget.innerHTML = "See Less";
      }
  }

}
