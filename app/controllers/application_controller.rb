class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


    def current_cart
      @current_cart ||= Cart.find(session[:cart_id])
    end
    helper_method :current_cart
end
