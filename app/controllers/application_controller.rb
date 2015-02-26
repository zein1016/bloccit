class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :flash_attack, if: :posts_controller?

  def im_public
    puts "hi"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
  
  def flash_attack
    flash.now[:notice] = "Hey there"
  end

  private


  def posts_controller?
    is_a? ::PostsController
  end
end
