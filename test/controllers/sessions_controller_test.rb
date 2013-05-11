require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @controller = SessionsController.new
    @request.env['HTTP_REFERER'] = '/'
  end

  test "a POST to sessions#create makes logged_in? true" do
    post :create

    assert @controller.send(:logged_in?)
  end

  test "a DELETE to sessions#destroy makes logged_in? false" do
    delete :destroy

    assert !@controller.send(:logged_in?)
  end
end