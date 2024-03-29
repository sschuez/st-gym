import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
// import { put, get, post, patch, destroy } from "@rails/request.js"
import { put } from "@rails/request.js"

// Connects to data-controller="block_position"
export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      animation: 200,
      handle: ".handle-block",
      onEnd: this.updatePosition.bind(this)
    })
  }

  async updatePosition(event) {
    const response = await put('/block_position', {
      responseKind: "turbo-stream",
      body: JSON.stringify({
        sgid: event.item.dataset.sgid,
        position: event.newIndex + 1
      })
    })
    if (response.ok) {
      // console.log(event.item.dataset.sgid);
    }
  }
}
