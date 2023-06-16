import { Controller } from "@hotwired/stimulus"
// import { useClickOutside } from 'stimulus-use'

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = [ "button", "menu", "caret", "languageLink" ]

  connect() {
    this.buttonTarget.setAttribute("data-action", "dropdown#toggleMenu")
    
    this.arrowDown = `<i class="bi bi-caret-down-fill" data-dropdown-target="caret"></i>`
    this.arrowLeft = `<i class="bi bi-caret-left-fill" data-dropdown-target="caret"></i>`
    this.getArrowIcon()
  }

  getArrowIcon() {
    this.buttonTarget.insertAdjacentHTML("beforeend", this.arrowDown)
  }

  toggleMenu(event) {
    event.preventDefault()
    this.buttonTarget.classList.toggle("open")
    this.menuTarget.classList.toggle("visually-hidden") 
    this.toggleArrow()
  }

  toggleArrow() {
    if (this.buttonTarget.classList.contains("open")) {
      this.caretTarget.remove()
      this.buttonTarget.insertAdjacentHTML("beforeend", this.arrowLeft)
    } else {
      this.caretTarget.remove()
      this.buttonTarget.insertAdjacentHTML("beforeend", this.arrowDown)
    }
  }

}
