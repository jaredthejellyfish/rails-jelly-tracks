import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["graph", "match"];

  matchTargetConnected(element) {
    VanillaTilt.init(element, {
      max: 10,
      axis: "y",
      reverse: true,
      glare: true,
      easing: "cubic-bezier(.8,.25,.32,.94)",
      "max-glare": 0.025,
      "glare-prerender": false,
    });
  }

  graphTargetConnected(element) {
    VanillaTilt.init(element, {
      max: 10,
      reverse: true,
      glare: true,
      "max-glare": 0.025,
      "glare-prerender": false,
    });
  }

  connect() {}
}
