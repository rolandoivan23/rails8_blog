class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def index
    @users = User.all
  end

    # GET /users/1 or /users/1.json
    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # USER /users or /users.json
    def create
      @user = User.new(user_params)

        if @user.save
          start_new_session_for @user
          redirect_to after_authentication_url
        end
    end

    # PATCH/PUT /users/1 or /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /users/1 or /users/1.json
    def destroy
      @user.destroy!

      respond_to do |format|
        format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def follow_user
      user_id = params[:user_id]
      Rails.logger.debug "Received parameterssss: #{params.inspect}"
      FollowingUser.create! user_id: user_id, following_user_id: current_user.id
      Follower.create! user_id: current_user.id, follower_id: user_id
      respond_to do
        it.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.expect(user: [ :id, :email_address, :password ])
      end
end
