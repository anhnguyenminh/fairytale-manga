module Api
  module V1
    module Admins
      class ReadersController < ApplicationController
        def index
          @readers = Reader.where('activated'=> true)
          render json: @readers
        end

        # private
        #   params 
      end
    end
  end
end