module Api
  module V1
    module Admins
      class ReadersController < ApplicationController
        def index
          @readers = Reader.all
          render json: @readers
        end
      end
    end
  end
end