# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  descripcion     :text
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class RolesController < ApplicationController
  before_action :set_rol, only: %i[ show edit update destroy ]

  # GET /roles or /roles.json
  def index
    @roles = Rol.where(:estado => 'A').order("id DESC")
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
    @rol.estado = "A"
    @rol.user_created_id = current_user.id

    respond_to do |format|
      if @rol.save
        format.html { redirect_to roles_url(@rol), notice: "El rol #{@rol.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el rol, verifique!!." }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1 or /roles/1.json
  def update
    @rol.user_updated_id = current_user.id

    respond_to do |format|
      if @rol.update(rol_params)
        format.html { redirect_to roles_url(@rol), notice: "El rol #{@rol.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @rol }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el rol, verifique!!." }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1 or /roles/1.json
  def destroy
    @rol.destroy

    respond_to do |format|
      format.html { redirect_to roles_url, notice: "El rol #{@rol.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar area
  def inactivar_rol
    @rol = Rol.find(params[:id])
    @rol.user_updated_id = current_user.id
    @rol.estado = "I"

    respond_to do |format|
      if @rol.save
        format.html { redirect_to roles_url, notice: "El rol #{@rol.nombre.upcase} ha sido inactivada." }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar el rol, verifique!!." }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
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
