require 'json_web_token'

class ApplicationController < ActionController::API
  # before_action :authenticate_request
  def show_categories
    @categories = Category.all
    render json: @categories
  end


  private
    # def authenticate_request
    #   header = request.headers["Authorization"]
    #   if header
    #     header = header.split(" ").last 
    #     decode = JsonWebToken.decode(header)
    #     @current_admin= Admin.find_by(id: decode[:admin_id])
    #   else
    #     render json: {
    #       message: "You need to login"
    #     }
    #   end
    # end
end
