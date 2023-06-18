import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-select"
export default class extends Controller {
  static targets = [ "inputField" ]

  addCategory(event) {
    event.target.classList.add("visually-hidden")
    this.inputFieldTarget.insertAdjacentHTML('beforeend', this.categoryPill(event.target.id, event.target.innerText, event.target.dataset.mainCategory))
    this.checkIfMainCategoryPresent()
  }

  removeCategory(event) {
    event.target.closest(".pill").remove()
    const parentElement = event.target.parentElement.parentElement
    this.element.querySelector(`#${parentElement.id}`).classList.remove("visually-hidden")
    this.checkIfMainCategoryPresent()
  }

  checkIfMainCategoryPresent() {
    const mainCategoryPresent = this.inputFieldTarget.querySelector(".main-category") != null
    const warningMessagePresent = this.element.querySelector(".categories__warning") != null
    
    if (mainCategoryPresent && warningMessagePresent) {
      document.querySelector(".categories__warning").remove()
    } else if (!mainCategoryPresent && !warningMessagePresent) {
      this.element.insertAdjacentHTML("beforeend", this.warningMessage())
    }
  }
  
  categoryPill(id, name, main_category) {
    return `<div id="${id}" class="mx-1 pill pill--categories__input ${main_category == "true" ? 'main-category' : ''}">      
      ${name}
      <span class="pill__close-pill" data-action="click->category-select#removeCategory">
        <i class="fas fa-times" aria-hidden="true"></i>
      </span>
    </div>`
  }

  warningMessage() {
    return `<div class="categories__warning">
      <i class="fas fa-exclamation-triangle" aria-hidden="true"></i>
      <span class="categories__warning--text">Please select at least one main category</span>
    </div>`
  }
}
