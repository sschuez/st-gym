import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
// import { put, get, post, patch, destroy } from "@rails/request.js"
import { put } from "@rails/request.js"

// Connects to data-controller="position"
export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      animation: 200,
      handle: ".handle-exercise-instance",
      onEnd: this.updatePosition.bind(this)
    })
  }

  async updatePosition(event) {
    const response = await put('/exercise_instance_position', {
      responseKind: "turbo-stream",
      body: JSON.stringify({
        sgid: event.item.dataset.sgid,
        position: event.newIndex // No adding 1 here because the first item is empty state
      })
    })
    if (response.ok) {
      // console.log(event.item.dataset.sgid);
    }
  }
}
