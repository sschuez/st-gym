import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories"
export default class extends Controller {
  static target = [ "category" ]
  
  connect() {
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
