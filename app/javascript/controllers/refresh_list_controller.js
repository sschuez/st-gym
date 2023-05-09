import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"

// Connects to data-controller="refresh-list"
export default class extends Controller {
  static targets = [ "form", "list", "searchInput", "category" ]

  connect() {
    // console.log(this.element);
    // console.log(this.formTarget);
    // console.log(this.listTarget);
    // console.log(this.searchInputTarget);
  }

  update() {
    const categoryPresent = event.currentTarget.classList.contains("category")
    const url = `${this.formTarget.action}?query=${categoryPresent ? event.currentTarget.value : this.searchInputTarget.value}`
    fetch(url, { 
      headers: { 
        Accept: 'text/plain'
        // Accept: "text/vnd.turbo-stream.html" 
      } 
    })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }

}
