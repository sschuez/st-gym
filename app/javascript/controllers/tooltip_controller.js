import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tooltip"
export default class extends Controller {
  // static targets = [ 'element', 'tooltip' ]
  // static values = {
  //   placement: { type: String, default: "top" },
  //   offset: { type: Array, default: [0, 8] },
  // }

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
      // event.target.insertAdjacentElement("beforbegin", tooltip)
      // parentNode.insertBefore(tooltip, event.target)
      
      tooltip.setAttribute("data-show", "")
  
      console.log(event.target)
    }

    function hide(event) {
      var tooltip = document.getElementById('tooltip')
      tooltip.remove()
      event.target.classList.remove("tooltip-parent")
  
      console.log(event.target)
    }

  }

}
