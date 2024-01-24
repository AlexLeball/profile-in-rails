import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = [ "btn" ]

  connect() {
    this.element.style.display = "none";

    // Set a timeout to show the button after 5 seconds (5000 milliseconds)
    setTimeout(() => {
      this.showButton();
    }, 5000);
  }

  showButton() {
    // Show the button
    this.element.style.display = "block";
  }
}
