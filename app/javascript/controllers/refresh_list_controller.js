import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"

// Connects to data-controller="refresh-list"
export default class extends Controller {
  static targets = [ "form", "list", "searchInput" ]

  connect() {
    this.mainCategory = "reset_main_category_list"
    this.category = "reset_category_list"
  }

  update() {
    if (event.currentTarget.classList.contains("main-category")) {
      this.mainCategory = event.currentTarget.value
      this.category = "reset_category_list"
    } else if (event.currentTarget.classList.contains("category")) {
      this.category = event.currentTarget.value
    } else if (event.currentTarget.value === "reset_main_category_list") {
      this.mainCategory = 0
    } else if (event.currentTarget.value === "reset_category_list") {
      this.category = 0
    }

    const mainCategoriesFilterChanged = event.currentTarget.dataset.previousMainCategory !== this.mainCategory
    const url = `${this.formTarget.action}?main_category_filter_changed=${mainCategoriesFilterChanged}&query=${this.searchInputTarget.value}&main_category=${this.mainCategory}&category=${this.category}`

    fetch(url, { 
      headers: { 
        // Accept: 'text/plain'
        Accept: "text/vnd.turbo-stream.html" 
      } 
    })
      .then(response => response.text())
      // .then((data) => {
        // this.listTarget.outerHTML = data
      .then(html => Turbo.renderStreamMessage(html))
      
  }

}
