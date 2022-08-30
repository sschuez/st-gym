import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="seconds"
export default class extends Controller {
  static targets = [ "time" ]
  
  connect() {
    // Time from DOM
    let time = this.timeTarget.innerHTML
    
    // (E1) CALCULATE HOURS, MINS, SECONDS
    let hours = 0, mins = 0, secs = 0
    hours = Math.floor(time / 3600)
    time -= hours * 3600
    mins = Math.floor(time / 60)
    time -= mins * 60
    secs = time

    // (E2) UPDATE THE DISPLAY TIMER
    if (hours<10) { hours = "0" + hours }
    if (mins<10) { mins = "0" + mins }
    if (secs<10) { secs = "0" + secs }
    
    // Set convert time in DOM
    if (hours < 1 && mins < 1) {
      this.timeTarget.innerHTML = secs + "s"
    } else if (hours < 1) {
      this.timeTarget.innerHTML = mins + "m " + secs + "s"
    } else {
      this.timeTarget.innerHTML = hours + "h " + mins + "m " + secs + "s"
    }
  }
}
