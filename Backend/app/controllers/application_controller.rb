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
    def authenticate_request_admin
      header = request.headers["Authorization"]
      header = header.split(" ").last 
      decode = JsonWebToken.decode(header)
      @current_admin= Admin.find_by(id: decode[:user_id])
      if !@current_admin
        render json: {
          message: "You need to login"
        }
      end
    end

    def authenticate_request_reader
      header = request.headers["Authorization"]     
      header = header.split(" ").last 
      decode = JsonWebToken.decode(header)
      @current_reader = Reader.find_by(id: decode[:reader_id])
      if !@current_reader
        render json: {
          message: "You need to login"
        }
      end
    end
    
end
