//import { Controller } from "@hotwired/stimulus"
import { ApplicationController, useThrottle } from "stimulus-use"
import { get } from "@rails/request.js"

// Connects to data-controller="author-search"
export default class extends ApplicationController {
  static targets = [ "nameField", "results", "birthField", "deathField" ]
  static throttles = [ {name: 'autocomplete', wait: 30 } ]

  autocomplete() {
    if(this.hasNameFieldTarget && this.hasResultsTarget &&
       this.nameFieldTarget.checkValidity()) {
      get("/authors/search", {
        headers: {"Turbo-Frame": this.resultsTarget.getAttribute("id")},
        query: {"query": this.nameFieldTarget.value},
        responseKind: 'turbo-stream'
      })
    }
  }

  select(event) {
    if (this.hasNameFieldTarget && event.params.name) {
      this.nameFieldTarget.value = event.params.name
    }

    if (event.params.id) {
      this.birthFieldTarget.value = event.params.birth
    }

    if (this.hasDeathFieldTarget && event.params.death) {
      this.deathFieldTarget.value = event.params.death
    }

    this.nameFieldTarget.blur()
  }

  connect() {
    useThrottle(this)
  }

  hideValidationMessage(event) {
    event.stopPropagation()
    event.preventDefault()
  }
}
