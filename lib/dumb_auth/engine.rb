module DumbAuth
  module ApplicationControllerExtensions
    def logged_in?
      session[:logged_in]
    end
  end

  class Engine < ::Rails::Engine
    initializer 'dumb_auth.app_controller' do
      ActiveSupport.on_load(:action_controller) do
        include ApplicationControllerExtensions
        helper_method 'logged_in?'
      end
    end
  end
end