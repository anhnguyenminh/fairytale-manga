require 'json_web_token'

class ApplicationController < ActionController::API
  # before_action :authenticate_request
  def show_categories
    @categories = Category.all
    render json: @categories
  end

  # def current_admin
  #   header = request.headers["Authorization"]
  #   header = header.split(" ").last 
  #   decode = JsonWebToken.decode(header)
  #   @current_admin = Admin.find_by(id: decode[:admin_id])
  #   render json: {admin: @current_admin}
  # end

  private
    def authenticate_request
      header = request.headers["Authorization"]
      if header
        header = header.split(" ").last 
        decode = JsonWebToken.decode(header)
        @current_admin= Admin.find_by(id: decode[:sub])
      else
        render json: {
          message: "You need to login"
        }
      end
    end

    
end
