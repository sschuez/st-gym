import { Controller } from "@hotwired/stimulus"
import { put } from "@rails/request.js"

// Connects to data-controller="repetitions"
export default class extends Controller {
  connect() {   
  }

  async more() {
    const response = await put('/repetitions', {
      responseKind: "turbo-stream",
      body: JSON.stringify({
        sgid: this.element.dataset.sgid,
        change_repetitions: +2
      })
    })
    if (response.ok) {
      console.log(this.element.dataset.sgid)
    }
  }

  async less() {
    const response = await put('/repetitions', {
      responseKind: "turbo-stream",
      body: JSON.stringify({
        sgid: this.element.dataset.sgid,
        change_repetitions: -2
      })
    })
    if (response.ok) {
      console.log(this.element.dataset.sgid)
    }
  }

}
