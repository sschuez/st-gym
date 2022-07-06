import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tooltip"
export default class extends Controller {

  connect() {
    this.element.addEventListener("mouseenter", show)
    this.element.addEventListener("mouseleave", hide)
    
    function show(event) {
      var tooltip = document.createElement('div')
      tooltip.id = "tooltip"
      tooltip.role = "tooltip"
      tooltip.innerHTML = event.target.dataset.value
      
      var tooltipArrow = document.createElement('div')
      tooltipArrow.id = "arrow"
      tooltip.appendChild(tooltipArrow)
      
      var parentNode = event.target.parentNode
      event.target.classList.add("tooltip-parent")
      event.target.appendChild(tooltip)
      
      tooltip.setAttribute("data-show", "")
    }

    function hide(event) {
      var tooltip = document.getElementById('tooltip')
      tooltip.remove()
      event.target.classList.remove("tooltip-parent")
    }

  }

}
