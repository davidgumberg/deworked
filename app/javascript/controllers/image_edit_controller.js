import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-edit"
export default class extends Controller {
  static targets = [ "fileField", "fileButton" ]

  connect() {
  }

}
