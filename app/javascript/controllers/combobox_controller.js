import { Controller } from "@hotwired/stimulus"
import Combobox from "https://cdn.skypack.dev/@github/combobox-nav"

// Connects to data-controller="combobox"
export default class extends Controller {
  static get targets() { return [ "input", "list"] }

  listTargetConnected() {
    this.start()
  }

  start() {
    if (this.hasListTarget) {
      this.combobox?.destroy()
      this.combobox = new Combobox(this.inputTarget, this.listTarget)
      this.combobox.start()
    }
  }

  stop() {
    this.combobox?.stop()
  }

  connect() {
  }

  disconnect() {
    this.combobox?.destroy()
  }
}
