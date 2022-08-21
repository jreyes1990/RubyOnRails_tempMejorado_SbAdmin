# == Schema Information
#
# Table name: areas
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  descripcion     :text
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  empresa_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class AreasController < ApplicationController
  before_action :set_area, only: %i[ show edit update destroy ]

  # GET /areas or /areas.json
  def index
    @areas = Area.where(:estado => 'A').order("id DESC")
  end

  # GET /areas/1 or /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas or /areas.json
  def create
    @area = Area.new(area_params)
    @area.estado = "A"
    @area.user_created_id = current_user.id

    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_url(@area), notice: "El area #{@area.nombre.upcase} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el area, verifique!!." }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1 or /areas/1.json
  def update
    @area.user_updated_id = current_user.id

    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to areas_url(@area), notice: "El area #{@area.nombre.upcase} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el area, verifique!!." }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1 or /areas/1.json
  def destroy
    @area.destroy

    respond_to do |format|
      format.html { redirect_to areas_url, notice: "El area #{@area.nombre.upcase} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar area
  def inactivar_area
    @area = Area.find(params[:id])
    @area.user_updated_id = current_user.id
    @area.estado = "I"

    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_url, notice: "El area #{@area.nombre} ha sido inactivada." }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar el area, verifique!!." }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_params
      params.require(:area).permit(:nombre, :descripcion, :user_created_id, :user_updated_id, :estado, :empresa_id)
    end
end
