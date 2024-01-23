import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = [ "blog-card" ]

  connect() {
    console.log("Hello from our first Stimulus controller");
  }
  cardClick(event) {
    blogCard = event.currentTarget
    blogCard.classList.toggle
  }
}
