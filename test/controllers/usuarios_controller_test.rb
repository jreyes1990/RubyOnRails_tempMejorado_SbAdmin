require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get usuarios_index_url
    assert_response :success
  end

  test "should get agregar_usuario" do
    get usuarios_agregar_usuario_url
    assert_response :success
  end

end
