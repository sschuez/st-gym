// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap

import "@rails/request.js"

import LocalTime from "local-time"
LocalTime.start()
