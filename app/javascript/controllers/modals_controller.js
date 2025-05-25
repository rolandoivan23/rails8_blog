import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="followers"
export default class extends Controller {
  connect() {
  }

  showModal(event) {
      const modal = document.getElementById(event.params.modalId);
      modal.classList.add('show');
  }

  closeModal(event){
      const modal = document.getElementById(event.params.modalId);
      modal.classList.remove('show');
  
  }

}
