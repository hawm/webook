import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-uploader"
export default class extends Controller {
  static targets = ['img', 'input', 'resetBtn', 'delete', 'deleteBtn']

  connect() {
    this.defaumtImgSrc = this.imgTarget.src
  }


  setImg(src) {
    this.imgTarget.src = src || this.imgTarget.getAttribute('placeholder')
  }

  clearInput() {
    this.inputTarget.value = null
  }

  canDelete(disabled) {
    this.deleteTarget.checked = !disabled
    this.deleteBtnTarget.disabled = !disabled
  }

  openFileSelector(event){
    this.inputTarget.click()
  }

  updateImage(event) {
    if (event.params.reset) {
      this.clearInput()
      this.setImg(this.defaumtImgSrc)
      this.canDelete(true)
    } else if (event.params.delete) {
      this.clearInput()
      this.setImg()
      this.canDelete(false)
    } else {
      const file = this.inputTarget.files[0]
      this.setImg(URL.createObjectURL(file))
      this.canDelete(true)
    }

  }
}
