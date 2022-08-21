# == Schema Information
#
# Table name: persona_empresa_formularios
#
#  id               :bigint           not null, primary key
#  descripcion      :text
#  user_created_id  :integer
#  user_updated_id  :integer
#  estado           :string(10)
#  opcion_ca_id     :bigint           not null
#  personas_area_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class PersonaEmpresaFormulariosController < ApplicationController
  before_action :set_persona_empresa_formulario, only: %i[ show edit update destroy ]

  # GET /persona_empresa_formularios or /persona_empresa_formularios.json
  def index
    @persona_empresa_formularios = PersonaEmpresaFormulario.all
  end

  # GET /persona_empresa_formularios/1 or /persona_empresa_formularios/1.json
  def show
  end

  # GET /persona_empresa_formularios/new
  def new
    @persona_empresa_formulario = PersonaEmpresaFormulario.new
  end

  # GET /persona_empresa_formularios/1/edit
  def edit
  end

  # POST /persona_empresa_formularios or /persona_empresa_formularios.json
  def create
    @persona_empresa_formulario = PersonaEmpresaFormulario.new(persona_empresa_formulario_params)

    respond_to do |format|
      if @persona_empresa_formulario.save
        format.html { redirect_to persona_empresa_formulario_url(@persona_empresa_formulario), notice: "Persona empresa formulario was successfully created." }
        format.json { render :show, status: :created, location: @persona_empresa_formulario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @persona_empresa_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /persona_empresa_formularios/1 or /persona_empresa_formularios/1.json
  def update
    respond_to do |format|
      if @persona_empresa_formulario.update(persona_empresa_formulario_params)
        format.html { redirect_to persona_empresa_formulario_url(@persona_empresa_formulario), notice: "Persona empresa formulario was successfully updated." }
        format.json { render :show, status: :ok, location: @persona_empresa_formulario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @persona_empresa_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /persona_empresa_formularios/1 or /persona_empresa_formularios/1.json
  def destroy
    @persona_empresa_formulario.destroy

    respond_to do |format|
      format.html { redirect_to persona_empresa_formularios_url, notice: "Persona empresa formulario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona_empresa_formulario
      @persona_empresa_formulario = PersonaEmpresaFormulario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def persona_empresa_formulario_params
      params.require(:persona_empresa_formulario).permit(:descripcion, :user_created_id, :user_updated_id, :estado, :opcion_ca_id, :personas_area_id)
    end
end
