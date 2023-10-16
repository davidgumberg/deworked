import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-on-change"
export default class extends Controller {
  static targets = [ "form" ]
  change() {
    this.formTarget.requestSubmit()
  }
  connect() {
  }
}
