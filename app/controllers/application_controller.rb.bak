# encoding: utf-8
class ApplicationController < ActionController::Base


#  before_filter :configure_permitted_parameters, if: :devise_controller? protected
#  def configure_permitted_parameters
#    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :first_name, :last_name, :profile_name, :password_confirmation, :password, :email )$
#    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit( :profile_name, :password, :email ) }
#  end

  protect_from_forgery with: :exception
#  before_action :authenticate_user!  
#  if we want to force people to login first

  helper_method :current_order
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end 
