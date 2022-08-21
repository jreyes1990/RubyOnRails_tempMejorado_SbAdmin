# == Schema Information
#
# Table name: personas_areas
#
#  id              :bigint           not null, primary key
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  area_id         :bigint           not null
#  persona_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class PersonasAreasController < ApplicationController
  before_action :set_personas_area, only: %i[ show edit update destroy ]

  # GET /personas_areas or /personas_areas.json
  def index
    @personas_areas = PersonasArea.all
  end

  # GET /personas_areas/1 or /personas_areas/1.json
  def show
  end

  # GET /personas_areas/new
  def new
    @personas_area = PersonasArea.new
  end

  # GET /personas_areas/1/edit
  def edit
  end

  # POST /personas_areas or /personas_areas.json
  def create
    @personas_area = PersonasArea.new(personas_area_params)

    respond_to do |format|
      if @personas_area.save
        format.html { redirect_to personas_area_url(@personas_area), notice: "Personas area was successfully created." }
        format.json { render :show, status: :created, location: @personas_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personas_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas_areas/1 or /personas_areas/1.json
  def update
    respond_to do |format|
      if @personas_area.update(personas_area_params)
        format.html { redirect_to personas_area_url(@personas_area), notice: "Personas area was successfully updated." }
        format.json { render :show, status: :ok, location: @personas_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personas_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas_areas/1 or /personas_areas/1.json
  def destroy
    @personas_area.destroy

    respond_to do |format|
      format.html { redirect_to personas_areas_url, notice: "Personas area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personas_area
      @personas_area = PersonasArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personas_area_params
      params.require(:personas_area).permit(:user_created_id, :user_updated_id, :estado, :area_id, :persona_id)
    end
end
