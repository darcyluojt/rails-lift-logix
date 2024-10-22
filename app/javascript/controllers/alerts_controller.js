import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="alerts"
export default class extends Controller {
  static targets = ["button"]

  connect() {

    this.buttonTarget.addEventListener("click", this.showAlert.bind(this));
  }

  showAlert(event) {

    Swal.fire({
      title: "Well done!",
      text: "Workout complete.",
      icon: "success",
      showCancelButton: false,
      confirmButtonColor: "#00ADB5",
      cancelButtonColor: "#1E1E1E",
      confirmButtonText: "View my Progress",
      cancelButtonText: "Exit"
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = "/account";
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        window.location.href = "/";
      }
    });
  }
}
