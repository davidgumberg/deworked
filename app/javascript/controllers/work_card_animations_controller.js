import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="work-card-animations"
export default class extends Controller {
  static targets = [ "workCard" ]

  editClicked() {
    console.log('bofa')
    if(this.hasWorkCardTarget){
      this.workCardTarget.classList.add("work-card-form-loading")
    }
  }

  connect() {
    console.log('bofacheez')
  }
}
