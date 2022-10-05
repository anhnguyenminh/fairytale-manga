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
      if header
        header = header.split(" ").last 
        decode = JsonWebToken.decode(header)
        @current_admin= Admin.find_by(id: decode[:admin_id])
        if !@current_admin 
          @message = "You aren't admin"
        end
      else
        @message = "You need login"
      end
      render json: {
        message: @message
      }
    end

    def authenticate_request_reader
      header = request.headers["Authorization"]
      if header
        header = header.split(" ").last 
        decode = JsonWebToken.decode(header)
        @current_reader= Admin.find_by(id: decode[:reader_id])
        if !@current_reader 
          @message = "You aren't reader"
        end
      else
        @message = "You need login"
      end
      render json: {
        message: @message
      }
    end
    
end
