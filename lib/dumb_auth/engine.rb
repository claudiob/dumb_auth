require 'omniauth-identity'
require 'omniauth-twitter'
# require 'omniauth-facebook'

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


# v1 = logged_in? >> change to accept *params (but not used)
# 
# v2 = logged_in?(user_id: 8)
# session.create from session[:logged_in] = true to session[:logged_in] = {user_id: 8}
# 
# logged_in?(params = true) checks whether session[:logged_in] matches params
# 
# when adding omniauth-identity and adding an Identity model
#   
# * when I open the site I have a guest User created (e.g. id=10, name=nil)
# * when I click on LOG IN, 42words has a form to submit to a URL with POST and email + password. If dumbauth finds it, 
# then logged_in? does not just return true but returns {user_id: 123}, otherwise false/nil
# * when I click on SIGN UP, 42words has a form to submit to a URL with POST and email + password and hidden user_id.
# Dumbauth creates an identity and also returns {user_id: hidden} for logged_in?
# * when I click on LOG IN OR SIGN UP, there is just one URL with POST and email/password required, user_id optional.
# If email exists and password matches, just log in (logged_in? = user_id in database)
# If email exists and password does not match, return some error (wrong password).
# If email does not exist and there is no user_id, return some error (email not found).
# If email does not exist and there is user_id, create in identity and log in (logged_in? = user_id passed/in database)
# 
# The only trick is: a User is guest (with an ID), does some actions, then logs in and his id changes: how to port the old actions to the user?
# 
# 
# SOLUTION:
# * instead of redirect_to :back, let the form pass a callback URL
# * in that URL on 42words, you can show a form to fill additional data if new user (first/last name)
# * additionally, there is where you either set guest=false if the value of logged_in? matches the current user
# * or where you take all the activities of the guest user, move them to the old logged in user and change current user (and prune guest user if you want)
# * you still need a cron to clean up guest users once in a while
# 
# ALL CASES:
# * homepage > Log in (valid) > Redirect to /after which sees that session[:user_id] is nil but logged_in? returns a user_id, so sets the session[:user_id] and goes back to the flow
# * If session[:user_id] is set, then @current_user just uses that, ignores logged_in?
# * On /after_login, if logged_in? is false, do nothing
# * On /after_login, if logged_in? is valid and session[:user_id] is nil, set session[:user_id] to logged_in? value
# * On /after_login, if logged_in? is valid and session[:user_id] is nil, set session[:user_id] to logged_in? value
# 
# * If session[:user_id] is not set, then @current_user first tries to set it from the result of logged_in?