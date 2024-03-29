import { Controller } from "@hotwired/stimulus"
import { put } from "@rails/request.js"

// Connects to data-controller="repetitions"
export default class extends Controller {
  static targets = [ "repetitions", "time", "toggle" ] 

  connect() {   
  }

  async updateQuantity(e) {
    const response = await put('/repetitions', {
      responseKind: "turbo-stream",
      body: JSON.stringify({
        sgid: this.element.dataset.sgid,
        request_type: "update_quantity"
      })
    })
    if (response.ok) {
      // console.log("Updated quantity type")
    }
  }

  async more(e) {
    // console.log(e.target.dataset.kind)
    const response = await put('/repetitions', {
      responseKind: "turbo-stream",
      body: JSON.stringify({
        sgid: this.element.dataset.sgid,
        increment: + e.target.dataset.increment,
        kind: e.target.dataset.kind
      })
    })
    if (response.ok) {
      // console.log(this.element.dataset.sgid)
    }
  }
  
  async less(e) {
    const response = await put('/repetitions', {
      responseKind: "turbo-stream",
      body: JSON.stringify({
        sgid: this.element.dataset.sgid,
        increment: - e.target.dataset.increment,
        kind: e.target.dataset.kind
      })
    })
    if (response.ok) {
      // console.log(this.element.dataset.sgid)
    }
  }

}
