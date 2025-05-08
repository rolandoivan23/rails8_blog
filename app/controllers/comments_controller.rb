class CommentsController < ApplicationController
    before_action :set_post, only: [ :create ]
    before_action :set_comment, only: [ :update, :destroy ]

    def create
        @post.comments.create! params.expect(comment: [ :content ])
        redirect_to @post
    end

    def update
        if @comment.update(comment_params)
          respond_to do |format|
            format.json { render json: @comment } # Responde con el comentario actualizado en JSON
          end
        else
          respond_to do |format|
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @comment.destroy
        respond_to do |format|
            format.html { redirect_to @post, notice: "Comment was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
        def set_post
            @post = Post.find(params[:post_id])
        end


    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :likes)
    end
end
