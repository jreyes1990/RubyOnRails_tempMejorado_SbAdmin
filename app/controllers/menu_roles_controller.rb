# == Schema Information
#
# Table name: menu_roles
#
#  id              :bigint           not null, primary key
#  menu_padre      :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  rol_id          :bigint           not null
#  opcion_id       :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class MenuRolesController < ApplicationController
  before_action :set_menu_rol, only: %i[ show edit update destroy ]

  # GET /menu_roles or /menu_roles.json
  def index
    @menu_roles = MenuRol.where(:estado => 'A').order("id DESC")
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
    #@menu_rol = MenuRol.new
    #@menu_rol.rol_id =  params[:menu_rol][:rol_id]
    #@menu_rol.opcion_id =  params[:menu_rol][:opcion_id]
    @menu_rol.estado = "A"
    @menu_rol.user_created_id = current_user.id

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_url(@menu_rol), notice: "La Asignación de Menú por Rol se ha creado correctamente." }
        format.json { render :show, status: :created, location: @menu_rol }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear la asignacion de menu, verifique!!." }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_roles/1 or /menu_roles/1.json
  def update
    #@menu_rol.rol_id =  params[:menu_rol][:rol_id]
    #@menu_rol.opcion_id =  params[:menu_rol][:opcion_id]
    @menu_rol.user_updated_id = current_user.id

    respond_to do |format|
      if @menu_rol.update(menu_rol_params)
        format.html { redirect_to menu_roles_url(@menu_rol), notice: "La Asignación de Menú por Rol se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @menu_rol }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar la asignacion de menu, verifique!!." }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_roles/1 or /menu_roles/1.json
  def destroy
    @menu_rol.destroy

    respond_to do |format|
      format.html { redirect_to menu_roles_url, notice: "La Asignación de Menú por Rol se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar Menu por Rol
  def inactivar_menurol
    @menu_rol = MenuRol.find(params[:id])
    @menu_rol.user_updated_id = current_user.id
    @menu_rol.estado = "I"

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_roles_url, notice: "Asignación de Menú por Rol ha sido Inactivado" }
        format.json { render :show, status: :created, location: @menu_rol }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar el Menu por Rol, verifique!!." }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
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
