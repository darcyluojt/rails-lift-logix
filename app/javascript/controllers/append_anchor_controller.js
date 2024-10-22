import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="append-anchor"
export default class extends Controller {
  connect() {
    const current_url = window.location.href;
    const current_path = window.location.pathname
    const current_origin = window.location.origin

    /* These come from
      path = data-append-anchor-path-value
      anchor = data-append-anchor-anchor-value
      inside the file app/views/splits/show.html.erb where the form linked to
      the 'append-anchor' data controller is linked (currently line 40)
    */
    const anchor = this.data.get('anchor-value');
    const path = this.data.get('path-value');

    if (current_path == path && !current_url.includes('#')) {
      window.location.href = current_origin + current_path + "#" + anchor
    }
  }
}
