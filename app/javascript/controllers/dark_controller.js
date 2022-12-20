import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "btn" ]

  connect() {
    var theme = getCookie("theme")
    if (theme == "light-mode") {
      this.btnTarget.innerHTML = "🌘"
      this.btnTarget.nextElementSibling.innerHTML = "Dark Mode"
    } else {
      this.btnTarget.innerHTML = "🌞"
      this.btnTarget.nextElementSibling.innerHTML = "Light Mode"
    }

  

    // Get cookie - for reference only (cosole.log())
    function getCookie(cname) {
      let name = cname + "=";
      let ca = document.cookie.split(';');
      for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
          c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
          return c.substring(name.length, c.length);
        }
      }
      return "";
    }

  }

  darkMode() {
    var element = document.body
    element.classList.toggle("dark-mode")

    // Cookies toggle
    let currentTheme = element.classList.contains("dark-mode") ? "dark-mode" : "light-mode"
    if (currentTheme == "dark-mode") {
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
