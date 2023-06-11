import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="tom-select"
export default class extends Controller {
  // static values = { options: Object }

  connect() {
    this.mainCategoriesCount = this.element.dataset.mainCategoriesCount
    this.changeMainCategoriesAppearance()
    // new TomSelect(this.element, this.optionsValue) 
    new TomSelect(this.element, {
      
      maxItems: 3,
      plugins: {
        remove_button:{
          title:'Remove this item',
        }
      },
      persist: false,
      create: true,
      
    }) 
  }
  
  changeMainCategoriesAppearance() {
    const options = this.element.querySelectorAll('option')
    let i = 0
    options.forEach((option) => {
      i += 1
      if (i <= this.mainCategoriesCount) {
        option.classList.add('main-category')
        option.innerText = option.innerText + ' (main)'
      }
    })    
  }
    
}


