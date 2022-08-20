# == Schema Information
#
# Table name: opcion_cas
#
#  id              :bigint           not null, primary key
#  descripcion     :text
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  componente_id   :bigint           not null
#  atributo_id     :bigint           not null
#  opcion_id       :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class OpcionCasController < ApplicationController
  before_action :set_opcion_ca, only: %i[ show edit update destroy ]

  # GET /opcion_cas or /opcion_cas.json
  def index
    @opcion_cas = OpcionCa.where(:estado => 'A').order("id DESC")
  end

  # GET /opcion_cas/1 or /opcion_cas/1.json
  def show
  end

  # GET /opcion_cas/new
  def new
    @opcion_ca = OpcionCa.new
  end

  # GET /opcion_cas/1/edit
  def edit
  end

  # POST /opcion_cas or /opcion_cas.json
  def create
    @opcion_ca = OpcionCa.new(opcion_ca_params)
    @opcion_ca.estado = "A"
    @opcion_ca.user_created_id = current_user.id

    respond_to do |format|
      if @opcion_ca.save
        format.html { redirect_to opcion_cas_url(@opcion_ca), notice: "La asignacion de componentes y atributos a formulario se ha creado correctamente." }
        format.json { render :show, status: :created, location: @opcion_ca }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear la asignacion, verifique!!." }
        format.json { render json: @opcion_ca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opcion_cas/1 or /opcion_cas/1.json
  def update
    @opcion_ca.user_updated_id = current_user.id

    respond_to do |format|
      if @opcion_ca.update(opcion_ca_params)
        format.html { redirect_to opcion_cas_url(@opcion_ca), notice: "La asignacion de componentes y atributos a formulario se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @opcion_ca }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar la asignacion, verifique!!." }
        format.json { render json: @opcion_ca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opcion_cas/1 or /opcion_cas/1.json
  def destroy
    @opcion_ca.destroy

    respond_to do |format|
      format.html { redirect_to opcion_cas_url, notice: "La asignacion de componentes y atributos a formulario se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar permiso formulario
  def inactivar_opcion_ca
    @opcion_ca = OpcionCa.find(params[:id])
    @opcion_ca.user_updated_id = current_user.id
    @opcion_ca.estado = "I"

    respond_to do |format|
      if @opcion_ca.save
        format.html { redirect_to opcion_cas_url, notice: "La asignacion de componentes y atributos a formulario ha sido inactivada." }
        format.json { render :show, status: :created, location: @opcion_ca }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar la asignacion, verifique!!." }
        format.json { render json: @opcion_ca.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opcion_ca
      @opcion_ca = OpcionCa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opcion_ca_params
      params.require(:opcion_ca).permit(:descripcion, :user_created_id, :user_updated_id, :estado, :componente_id, :atributo_id, :opcion_id)
    end
end
