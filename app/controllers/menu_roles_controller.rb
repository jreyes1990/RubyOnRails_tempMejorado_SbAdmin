class MenuRolesController < ApplicationController
  before_action :set_menu_rol, only: %i[ show edit update destroy ]

  # GET /menu_roles or /menu_roles.json
  def index
    @menu_roles = MenuRol.all
  end

  # GET /menu_roles/1 or /menu_roles/1.json
  def show
  end

  # GET /menu_roles/new
  def new
    @menu_rol = MenuRol.new
  end

  # GET /menu_roles/1/edit
  def edit
  end

  # POST /menu_roles or /menu_roles.json
  def create
    @menu_rol = MenuRol.new(menu_rol_params)

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_rol_url(@menu_rol), notice: "Menu rol was successfully created." }
        format.json { render :show, status: :created, location: @menu_rol }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_roles/1 or /menu_roles/1.json
  def update
    respond_to do |format|
      if @menu_rol.update(menu_rol_params)
        format.html { redirect_to menu_rol_url(@menu_rol), notice: "Menu rol was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_rol }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_roles/1 or /menu_roles/1.json
  def destroy
    @menu_rol.destroy

    respond_to do |format|
      format.html { redirect_to menu_roles_url, notice: "Menu rol was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_rol
      @menu_rol = MenuRol.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_rol_params
      params.require(:menu_rol).permit(:menu_padre, :user_created_id, :user_updated_id, :estado, :rol_id, :opcion_id)
    end
end
