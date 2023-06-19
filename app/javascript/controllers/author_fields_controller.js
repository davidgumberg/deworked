import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="author-fields"
export default class extends Controller {
  static get targets() { return [ "submit", "nameField", "birthField", "deathField"] }

  autocomplete() {
    if(this.hasNameFieldTarget) { 
      post("/authors/search", {
        headers: {"Turbo-Frame": "search_authors_results"},
        query: {"query": this.nameFieldTarget.value},
        responseKind: 'turbo-stream'
      })
    }
  }

  submit() {
    this.submitTarget.click()
  }

  select(event) {
    console.log(event.type)
    console.log(event.params)
    console.log(event.params.name)
    console.log("has name field target?")
    console.log(this.hasNameFieldTarget)

    if (this.hasNameFieldTarget && event.params.name) {
      this.nameFieldTarget.value = event.params.name
    }

    console.log("Birth field target?")
    console.log(this.hasBirthFieldTarget)
    if (this.hasBirthFieldTarget && event.params.birth) {
      this.birthFieldTarget.value = event.params.birth
    }

    if (this.hasDeathFieldTarget && event.params.death) {
      this.deathFieldTarget.value = event.params.death
    }

    this.nameFieldTarget.blur()
  }

  connect() {
    if (this.hasSubmitTarget) {
      this.submitTarget.style.display = "none"
    }
  }

  hideValidationMessage(event) {
    event.stopPropagation()
    event.preventDefault()
  }
}
