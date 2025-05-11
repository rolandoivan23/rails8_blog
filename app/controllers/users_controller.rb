class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create index ]
  rescue_from ActiveRecord::RecordNotUnique, with: :handle_record_not_unique

  def index
    @users = User.all
  end

    # GET /users/1 or /users/1.json
    def show
      @user = current_user
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
        else
          flash.now[:alert] = t(".failure", default: "No se pudo crear la cuenta. Por favor, revisa los errores.")
          render :new, status: :unprocessable_entity
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
      if FollowingUser.where(user_id: user_id, following_user_id: current_user.id).count == 0
        FollowingUser.create! user_id: user_id, following_user_id: current_user.id
        Follower.create! user_id: current_user.id, follower_id: user_id
      end
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
        params.expect(user: [ :id, :email_address, :password, :password_confirmation, :presentation, :avatar ])
      end

      def handle_record_not_unique(exception)
        # Rails.logger.error("Excepción de unicidad de Base de Datos: #{exception.message}")

        # Preparamos el objeto @user para el formulario, si no está ya definido
        # o si el error ocurrió fuera del flujo normal de @user.save
        @user ||= User.new(user_params) # Re-construye el usuario con los params si es necesario

        # Añadimos un error específico al campo que causó el problema si es posible,
        # o un error base. La excepción de DB es menos informativa que la validación de AR.
        # Para este caso específico, sabemos que es email_address.
        @user.errors.add(:email_address, :taken, message: t("activerecord.errors.messages.taken_db", default: "ya está registrado."))
        render :new, status: :unprocessable_entity
      end
end
