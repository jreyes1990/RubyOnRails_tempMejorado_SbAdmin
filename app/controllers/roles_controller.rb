class RolesController < ApplicationController
  before_action :set_rol, only: %i[ show edit update destroy ]

  # GET /roles or /roles.json
  def index
    @roles = Rol.all
  end

  # GET /roles/1 or /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @rol = Rol.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles or /roles.json
  def create
    @rol = Rol.new(rol_params)

    respond_to do |format|
      if @rol.save
        format.html { redirect_to rol_url(@rol), notice: "Rol was successfully created." }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1 or /roles/1.json
  def update
    respond_to do |format|
      if @rol.update(rol_params)
        format.html { redirect_to rol_url(@rol), notice: "Rol was successfully updated." }
        format.json { render :show, status: :ok, location: @rol }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1 or /roles/1.json
  def destroy
    @rol.destroy

    respond_to do |format|
      format.html { redirect_to roles_url, notice: "Rol was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol
      @rol = Rol.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rol_params
      params.require(:rol).permit(:nombre, :descripcion, :user_created_id, :user_updated_id, :estado)
    end
end
