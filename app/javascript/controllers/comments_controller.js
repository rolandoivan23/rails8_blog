import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["count"];

  connect() {
    // Lógica al conectar el controlador, si es necesario
  }

  updateCommentsCount(event) {
    const countElement = document.getElementById(`post_${event.params.postId}_comments_count`);
    if (countElement) {
      let current = parseInt(countElement.textContent, 10) || 0;
      countElement.textContent = current + 1;
      console.log("Updating comments count to:" + (current + 1));
    }
    // Limpiar el textarea del comentario
    const form = event.target.closest("form");
    if (form) {
      const textarea = form.querySelector("textarea");
      if (textarea) textarea.value = "";
    }
  }

  // ...existing code...
}