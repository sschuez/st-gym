import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stopwatch"
export default class extends Controller {
  static targets = [ "clock" ]
  
  connect() {
    this.clockTargets.forEach((clock) => {
      this.init(clock)
    })
  }

  init(clock) {
    // Declare variables to use in our functions below 
    let startTime
    let elapsedTime = 0
    let timerInterval
 
    // Convert time to a format of hours, minutes, seconds, and milliseconds
    function timeToString(time) {
      let diffInHrs = time / 3600000
      let hh = Math.floor(diffInHrs)
    
      let diffInMin = (diffInHrs - hh) * 60
      let mm = Math.floor(diffInMin)
    
      let diffInSec = (diffInMin - mm) * 60
      let ss = Math.floor(diffInSec)
    
      let diffInMs = (diffInSec - ss) * 100
      let ms = Math.floor(diffInMs)
    
      let formattedMM = mm.toString().padStart(2, "0")
      let formattedSS = ss.toString().padStart(2, "0")
      let formattedMS = ms.toString().padStart(2, "0")
    
      return `${formattedMM}:${formattedSS}:${formattedMS}`
    }
    
    // Create function to modify innerHTML
    function print(txt) {
      clock.querySelector("#display").innerHTML = txt
    }
  
    // Create "start", "pause" and "reset" functions
    function start() {
      startTime = Date.now() - elapsedTime
      timerInterval = setInterval(function printTime() {
      elapsedTime = Date.now() - startTime
      print(timeToString(elapsedTime))
      }, 10)
      showButton("PAUSE")
    }
  
    function pause() {
      clearInterval(timerInterval)
      showButton("PLAY")
    }
  
    function reset() {
      clearInterval(timerInterval)
      print("00:00:00")
      elapsedTime = 0
      showButton("PLAY")
    }
  
    // Create function to display buttons
    function showButton(buttonKey) {
    const buttonToShow = buttonKey === "PLAY" ? playButton : pauseButton
    const buttonToHide = buttonKey === "PLAY" ? pauseButton : playButton
    buttonToShow.style.display = "block"
    buttonToHide.style.display = "none"
    }
    
    // Create event listeners
    let playButton = clock.querySelector("#playButton")
    let pauseButton = clock.querySelector("#pauseButton")
    let resetButton = clock.querySelector("#resetButton")
  
    playButton.addEventListener("click", start)
    pauseButton.addEventListener("click", pause)
    resetButton.addEventListener("click", reset)
  }


}
