require 'test_helper'

class ComponentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @componente = componentes(:one)
  end

  test "should get index" do
    get componentes_url
    assert_response :success
  end

  test "should get new" do
    get new_componente_url
    assert_response :success
  end

  test "should create componente" do
    assert_difference('Componente.count') do
      post componentes_url, params: { componente: { descripcion: @componente.descripcion, estado: @componente.estado, nombre: @componente.nombre, user_created_id: @componente.user_created_id, user_updated_id: @componente.user_updated_id } }
    end

    assert_redirected_to componente_url(Componente.last)
  end

  test "should show componente" do
    get componente_url(@componente)
    assert_response :success
  end

  test "should get edit" do
    get edit_componente_url(@componente)
    assert_response :success
  end

  test "should update componente" do
    patch componente_url(@componente), params: { componente: { descripcion: @componente.descripcion, estado: @componente.estado, nombre: @componente.nombre, user_created_id: @componente.user_created_id, user_updated_id: @componente.user_updated_id } }
    assert_redirected_to componente_url(@componente)
  end

  test "should destroy componente" do
    assert_difference('Componente.count', -1) do
      delete componente_url(@componente)
    end

    assert_redirected_to componentes_url
  end
end
