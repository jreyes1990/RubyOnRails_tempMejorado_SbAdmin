# == Schema Information
#
# Table name: menus
#
#  id              :bigint           not null, primary key
#  nombre          :string(200)
#  icono           :text
#  descripcion     :text
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  # GET /menus or /menus.json
  def index
    @menus = Menu.where(:estado => 'A').order("id DESC")
  end

  # GET /menus/1 or /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)
    @menu.estado = "A"
    @menu.user_created_id = current_user.id

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_url(@menu), notice: "El menu #{@menu.nombre} se ha creado correctamente." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al crear el menu, verifique!!." }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    @menu.user_updated_id = current_user.id

    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menus_url(@menu), notice: "El menu #{@menu.nombre} se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Ocurrio un error al actualizar el menu, verifique!!." }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1 or /menus/1.json
  def destroy
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url, notice: "El menu #{@menu.nombre} se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # Inactivar menu
  def inactivar_menu
    @menu = Menu.find(params[:id])
    @menu.user_updated_id = current_user.id
    @menu.estado = "I"

    respond_to do |format|
      if @menu.save
        format.html { redirect_to empresas_path, notice: "El menu #{@menu.nombre} ha sido inactivada." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Ocurrio un error al inactivar el menu, verifique!!." }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:nombre, :icono, :descripcion, :user_created_id, :user_updated_id, :estado)
    end
end
