class CommentsController < ApplicationController
    before_action :set_post, only: [ :create ]
    before_action :set_comment, only: [ :update, :destroy ]
    before_action :authorize_comment_owner!, only: [ :destroy ]

    def create
        @post.comments.create! params.expect(comment: [ :content ]).merge(user: current_user)
        respond_to do |format|
            format.html { head :created }
            format.json { render json: @post.comments.last, status: :created }
        end
    end

    def update
        if params[:comment][:likes] != nil and @comment.likes != params[:comment][:likes].to_i
            if CommentsLike.where(comment_id: params[:id], user_id: current_user.id).size > 0
              render json: { error: "El usuario ya había dado like a este comentario." }, status: :conflict
              return
            end
        end
        if @comment.update(comment_params)
            CommentsLike.create!(comment: @comment, user_id: current_user.id)
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

    def authorize_comment_owner!
        unless @comment.user_id == current_user.id
            respond_to do |format|
                format.html { redirect_to @post, alert: "You are not authorized to delete this comment." }
                format.json { render json: { error: "Not authorized" }, status: :forbidden }
            end
        end
    end

    def comment_params
        params.require(:comment).permit(:content, :likes)
    end
end
