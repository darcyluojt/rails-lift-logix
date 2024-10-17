import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sets"
export default class extends Controller {
  static targets = [
    "form"
  ]
  connect() {
  }

  add(event) {
    event.preventDefault()
    // POST request to create log
    this.formTarget.insertAdjacentHTML("afterend", this.formTarget.innerHTML)
    event.currentTarget.style.display = 'none';
  }
}
