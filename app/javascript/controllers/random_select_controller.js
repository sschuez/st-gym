import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random-select"
export default class extends Controller {
  static targets = [ "tag" ]

  selectRandomExercises() {
    event.preventDefault()

    this.tagTargets.forEach((tag) => {
      tag.querySelector('input').checked = false
    })

    const shuffled = this.tagTargets.sort(() => 0.5 - Math.random())
    const num = this.tagTargets.length > 5 ? 5 : this.tagTargets.length
    const selected = shuffled.slice(0, num)

    selected.forEach((tag) => {
      tag.querySelector('input').checked = true
    })
  }
}
