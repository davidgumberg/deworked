import { Controller } from "@hotwired/stimulus"
import { DirectUpload } from "@rails/activestorage"

// Connects to data-controller="direct-upload"
export default class extends Controller {
  static targets = ['input', 'progress', 'preview'];

  connect() {
    this.progressTarget.setAttribute('value', '0')
    this.progressTarget.setAttribute('max', '100')
  }

  uploadEarly() {
    this.progressTarget.style['opacity'] = 1.0
    this.progressTarget.setAttribute('aria-hidden', 'false')
    Array.from(this.inputTarget.files).forEach((file) => {
      const upload = new DirectUpload(file,
                                      this.inputTarget.dataset.directUploadUrl,
                                      this)


      upload.create((error, blob) => {
        if (error) {
          console.log(error)
        } else {
          //  Add an appropriately-named hidden input to the form with a
          //  value of blob.signed_id so that the blob ids will be
          //  transmitted in the normal upload flow
          const hiddenField = document.createElement('input')
          hiddenField.setAttribute("type", "hidden")
          hiddenField.setAttribute("value", blob.signed_id)
          hiddenField.name = this.inputTarget.name
          this.inputTarget.after(hiddenField)

          if(this.hasPreviewTarget) {
            const previewURL = URL.createObjectURL(file)
            this.previewTarget.setAttribute('style',
                                            `background-image: url(${previewURL})`)
          }
        }
      })
    })
  }

  directUploadWillStoreFileWithXHR(request) {
    request.upload.addEventListener("progress",
      event => this.directUploadDidProgress(event))
  }

  directUploadDidProgress(event) {
    this.progressTarget.setAttribute('value', (event.loaded/event.total * 100))
  }
}
