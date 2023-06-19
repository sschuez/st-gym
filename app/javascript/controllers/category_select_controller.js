import { Controller } from "@hotwired/stimulus"
import { destroy } from "@rails/request.js"

// Connects to data-controller="category-select"
export default class extends Controller {
  static targets = [ "inputField", "hiddenField" ]
  connect() {
    this.adjustHiddenField()
    this.checkIfMainCategoryPresent()
  }

  addCategory(event) {
    event.target.classList.add("visually-hidden")
    this.inputFieldTarget.insertAdjacentHTML('beforeend', this.categoryPill(event.target.id, event.target.innerText, event.target.dataset.mainCategory))
    this.checkIfMainCategoryPresent()
    this.adjustHiddenField()
  }

  removeCategory(event) {
    const categoryPill = event.target.closest(".pill") 
    if (categoryPill.dataset.exerciseId != "nil") {
      this.deleteExerciseCategory(categoryPill.dataset.exerciseId, categoryPill.id.replace("category_", ""))
    }
    categoryPill.remove()
    const parentElement = event.target.parentElement.parentElement
    this.element.querySelector(`#${parentElement.id}`).classList.remove("visually-hidden")
    this.checkIfMainCategoryPresent()
    this.adjustHiddenField()
  }

  async deleteExerciseCategory(exerciseId, categoryId) {
    const response = await destroy(`/exercise_categories`, {
      responseKind: "turbo-stream",
      body: JSON.stringify({
        exercise_id: exerciseId,
        category_id: categoryId
      })
    })
    if (response.ok) {
      console.log("Yai, deleted!")
    }
  }

  adjustHiddenField() {
    const categoryIdsString = [...this.inputFieldTarget.querySelectorAll(".pill")].map(pill => pill.id.replace("category_", ""))
    const idsArray = categoryIdsString.map(id => parseInt(id))
    this.hiddenFieldTarget.value = JSON.stringify(idsArray)
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
    return `<div id="${id}" data-main-category="${main_category}" data-exercise-id="nil" class="mx-1 pill pill--categories__input ${main_category == "true" ? 'main-category' : ''}">      
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
