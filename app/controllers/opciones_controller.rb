# == Schema Information
#
# Table name: opciones
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  icono           :text
#  path            :text
#  descripcion     :text
#  controlador     :string(300)
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  menu_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class OpcionesController < ApplicationController
  before_action :set_opcion, only: %i[ show edit update destroy ]

  # GET /opciones or /opciones.json
  def index
    @opciones = Opcion.where(:estado => 'A').order("id DESC")
  end

  # GET /opciones/1 or /opciones/1.json
  def show
  end

  # GET /opciones/new
  def new
    @opcion = Opcion.new
  end

  # GET /opciones/1/edit
  def edit
  end

  # POST /opciones or /opciones.json
  def create
    @opcion = Opcion.new(opcion_params)
    @opcion.estado = "A"
    @opcion.user_created_id = current_user.id

    respond_to do |format|
      if @opcion.save
        format.html { redirect_to opciones_url(@opcion), notice: "La opcion #{@opcion.nombre} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @opcion }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear la opcion, verifique!!." }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opciones/1 or /opciones/1.json
  def update
    @opcion.user_updated_id = current_user.id

    respond_to do |format|
      if @opcion.update(opcion_params)
        format.html { redirect_to opciones_url(@opcion), notice: "La opcion #{@opcion.nombre} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @opcion }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar la opcion, verifique!!." }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opciones/1 or /opciones/1.json
  def destroy
    @opcion.destroy

    respond_to do |format|
      format.html { redirect_to opciones_url, notice: "La opcion #{@opcion.nombre} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar opciones
  def inactivar_opcion
    @opcion = Opcion.find(params[:id])
    @opcion.user_updated_id = current_user.id
    @opcion.estado = "I"
    respond_to do |format|
      if @opcion.save
        format.html { redirect_to opciones_url, notice: "La opcion #{@opcion.nombre} ha sido inactivada." }
        format.json { render :show, status: :created, location: @opcion }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar la opcion, verifique!!." }
        format.json { render json: @opcion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opcion
      @opcion = Opcion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opcion_params
      params.require(:opcion).permit(:nombre, :icono, :path, :descripcion, :controlador, :user_created_id, :user_updated_id, :estado, :menu_id)
    end
end
