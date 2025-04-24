class FollowingUsersController < ApplicationController
  before_action :set_following_user, only: %i[ show edit update destroy ]

  # GET /following_users or /following_users.json
  def index
    @following_users = FollowingUser.all
  end

  # GET /following_users/1 or /following_users/1.json
  def show
  end

  # GET /following_users/new
  def new
    @following_user = FollowingUser.new
  end

  # GET /following_users/1/edit
  def edit
  end

  # POST /following_users or /following_users.json
  def create
    @following_user = FollowingUser.new(following_user_params)

    respond_to do |format|
      if @following_user.save
        format.html { redirect_to @following_user, notice: "Following user was successfully created." }
        format.json { render :show, status: :created, location: @following_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @following_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /following_users/1 or /following_users/1.json
  def update
    respond_to do |format|
      if @following_user.update(following_user_params)
        format.html { redirect_to @following_user, notice: "Following user was successfully updated." }
        format.json { render :show, status: :ok, location: @following_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @following_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /following_users/1 or /following_users/1.json
  def destroy
    @following_user.destroy!

    respond_to do |format|
      format.html { redirect_to following_users_path, status: :see_other, notice: "Following user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_following_user
      @following_user = FollowingUser.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def following_user_params
      params.expect(following_user: [ :user_id, :following_user_id ])
    end
end
