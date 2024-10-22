import { Controller } from "@hotwired/stimulus"
import {Chart} from '@stimulus-components/chartjs'

// Connects to data-controller="chart"
export default class extends Controller {
  static values = { dates: Array, values: Array }

  connect() {
    console.log(this.element)
  }
}
