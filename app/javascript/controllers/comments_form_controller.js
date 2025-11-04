import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
  static targets = [ "content" ]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "CommentChannel", post_id: this.data.get("postIdValue") },
      {
        received: data => {
          const comments = document.getElementById("comments")
          const newComment = document.createElement("div")
          newComment.innerHTML = this.commentTemplate(data)
          comments.prepend(newComment)
        }
      }
    )
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  submit(event) {
    event.preventDefault()

    const postId = this.data.get("postIdValue")
    const content = this.contentTarget.value

    fetch(`/posts/${postId}/comments`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ comment: { content: content } })
    })
    .then(() => {
      this.contentTarget.value = ""
    })
  }

  commentTemplate(comment) {
    return `
      <div id="comment_${comment.id}" class="comment">
        <div class="comment-body">
          <div class="comment-header">
            <h4 class="comment-author">${comment.user.email_address}</h4>
            <span class="comment-time">${comment.created_at}</span>
          </div>
          <p class="comment-text">${comment.content}</p>
        </div>
      </div>
    `
  }
}
