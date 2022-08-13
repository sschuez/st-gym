import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="meta"
export default class extends Controller {
  static targets = [ "admin", "user", "published" ]

  connect() {
    // Data from meta tags
    const admin = document.querySelector('meta[name="current-person-admin"]').content
    const user = document.querySelector('meta[name="current-person-user"]').content
    const id = document.querySelector('meta[name="current-person-id"]').content
    const published = document.querySelector('meta[name="current-record-published"]').content
    const recordId = document.querySelector('meta[name="current-record-id"]').content
    
    checkAuthorisation(this.userTargets, user)
    checkAuthorisation(this.adminTargets, admin)
    checkAuthorisationPublished(this.publishedTargets, user)

    // Check if user owns record or if user is admin
    function checkAuthorisation(elements, subject) {
      elements.forEach((element) => {
        if (subject === "true" || admin === "true") {
          // Do nothing
        } else {
          element.classList.add("hidden")
        }
      })
    }

    // Check if record is published, user owns record or if user is admin
    function checkAuthorisationPublished(elements, subject) {
      elements.forEach((element) => {
        if (subject === "true" || admin === "true" || published === "true") {
          // Do nothing
        } else {
          element.classList.add("hidden")
        }
      })
    }
    
  }
}
