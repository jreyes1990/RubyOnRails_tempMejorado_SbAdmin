# == Schema Information
#
# Table name: empresas
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  descripcion     :text
#  codigo_empresa  :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[ show edit update destroy ]

  # GET /empresas or /empresas.json
  def index
    @empresas = Empresa.where(:estado => 'A').order("id DESC")
  end

  # GET /empresas/1 or /empresas/1.json
  def show
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas or /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)
    @empresa.estado = "A"
    @empresa.user_created_id = current_user.id

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to empresas_url(@empresa), notice: "La empresa #{@empresa.nombre} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear la empresa, verifique!!." }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1 or /empresas/1.json
  def update
    @empresa.user_updated_id = current_user.id

    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to empresas_url(@empresa), notice: "La empresa #{@empresa.nombre} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar la empresa, verifique!!." }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1 or /empresas/1.json
  def destroy
    @empresa.destroy

    respond_to do |format|
      format.html { redirect_to empresas_url, notice: "La empresa #{@empresa.nombre} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar empresa
  def inactivar_empresa
    @empresa = Empresa.find(params[:id])
    @empresa.user_updated_id = current_user.id
    @empresa.estado = "I"

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to empresas_path, notice: "La empresa #{@empresa.nombre} ha sido inactivada." }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar la empresa, verifique!!." }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:nombre, :descripcion, :codigo_empresa, :user_created_id, :user_updated_id, :estado)
    end
end
