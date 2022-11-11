import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="document-uploader"
export default class extends Controller {
  static targets = [
    'indicator',
    'delete',
    'input',
    'uploader'
  ]

  static values = {
    src: String
  }

  static classes = ['hidden']

  connect() {
    this.showUploader(!this.srcValue)
  }

  clearInput() {
    this.inputTarget.value = null
  }

  setDelete(del) {
    this.deleteTarget.checked = !!del
  }

  viewDocument(){
    const file = this.inputTarget.files[0]
    const url = file ? URL.createObjectURL(file) : this.srcValue
    window.open(url, '_blank')
  }

  showUploader(show) {
    this.uploaderTarget.classList.toggle(this.hiddenClass, !show)
    this.indicatorTarget.classList.toggle(this.hiddenClass, !!show)
  }

  updateDocument(event) {
    if (event.params.reset) {
      this.clearInput()
      this.setDelete(false)
      this.showUploader(!this.srcValue)
    } else if (event.params.delete) {
      this.clearInput()
      this.setDelete(true)
      this.showUploader(true)
    } else {
      this.setDelete(false)
      this.showUploader(false)
    }
  }
}
