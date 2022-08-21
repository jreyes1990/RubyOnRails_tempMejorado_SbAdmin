# == Schema Information
#
# Table name: personas
#
#  id              :bigint           not null, primary key
#  nombre          :string(100)
#  apellido        :string(100)
#  foto            :string
#  telefono        :integer
#  direccion       :text
#  token           :string(1000)
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class PersonasController < ApplicationController
  def show
  end

  def edit
  end

  #Proceso para actualizar una persona
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Persona modficada' }
        format.json { render :show, status: :ok, location: @persona }

      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }

      end
    end
  end

  #Proceso para inactivar una persona
  def inactivar
    @persona = Persona.find(params[:id])
    @persona.user_updated_id = current_user.id
    @persona.estado = "I"

    respond_to do |format|
      if @persona.save
        @usuario = User.find(@persona.user_id)
        @usuario.estado = "I"
        @usuario.user_updated_id = current_user.id

        if @usuario.save
          format.html { redirect_to usuarios_index_path, notice: "Persona y Usuario Inctivado" }
          format.json { render :show, status: :created, location: @persona }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_cambiar_contrasena
    @persona_id = params[:persona_id]

    respond_to do |format|
      format.html
      format.js
    end
  end

  def registrar_cambio_contrasena
    contrasena_nueva = params[:cambio_contrasena_form][:password_nueva]
    confirma_contrasena = params[:cambio_contrasena_form][:password_confirmada]
    @user = User.find(current_user.id)

    respond_to do |format|
      if contrasena_nueva == confirma_contrasena
        contrasena_nueva_encriptada = BCrypt::Password.create(contrasena_nueva)
        @user.encrypted_password = contrasena_nueva_encriptada

        if @user.save
          format.html { redirect_to persona_path(current_user.persona), notice: "Contraseña actualizada correctamente." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { redirect_to persona_path(current_user.persona), alert: "Error al actualizar la contraseña." }
          format.json { render :show, status: :created, location: @user }
        end
      else
        format.html { redirect_to persona_path(current_user.persona), alert: "Las nueva contraseña y la confirmación no coinciden, intente de nuevo." }
        format.json { render :show, status: :created, location: @user }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_persona
    @persona = Persona.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def persona_params
    params.require(:persona).permit(:foto, :nombre, :apellido, :direccion, :telefono, :user_updated_id)
  end
end
