import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "btn" ]

  connect() {
    this.theme = this.getCookie("theme")

    if (this.theme == "light-mode") {
      this.btnTarget.innerHTML = "🌘"
      this.btnTarget.nextElementSibling.innerHTML = "Dark Mode"
    } else {
      this.btnTarget.innerHTML = "🌞"
      this.btnTarget.nextElementSibling.innerHTML = "Light Mode"
    }  
  }

  getCookie(cname) {
    this.name = cname + "="
    this.ca = document.cookie.split(';')

    for(let i = 0; i < this.ca.length; i++) {
      let c = this.ca[i]
      while (c.charAt(0) == ' ') {
        c = c.substring(1)
      }
      if (c.indexOf(this.name) == 0) {
        return c.substring(this.name.length, c.length)
      }
    }
    return ""
  }

  darkMode() {
    document.body.classList.toggle("dark-mode")
    this.currentTheme = document.body.classList.contains("dark-mode") ? "dark-mode" : "light-mode"

    if (this.currentTheme == "dark-mode") {
      document.body.classList.remove("light-mode")
      document.cookie = "theme=dark-mode"
      this.btnTarget.innerHTML = "🌞"
      this.btnTarget.nextElementSibling.innerHTML = "Light Mode"
    } else {
      document.cookie = "theme=light-mode"
      this.btnTarget.innerHTML = "🌘"
      this.btnTarget.nextElementSibling.innerHTML = "Dark Mode"
    }
  }
}
