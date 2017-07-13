class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end
  
  def after_sign_in_path_for(resource)
    if (URI(request.referer).path == '/login') || (URI(request.referer).path == '/sign_up')
      root_path
    else
      request.referer
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
      request.referer
  end

end
