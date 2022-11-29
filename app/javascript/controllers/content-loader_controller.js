// src/controllers/content_loader_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  connect() {
    console.log(window.location.search)
    this.load()
  }

  load() {
    fetch(this.urlValue + window.location.search)
      .then(response => response.text())
      .then(html => this.element.innerHTML = html)
  }
}
