module Api
  module V1
    module Readers
      class Stories::LikesController < LikesController
          private 
          def set_liketable
            @liketable = Author.find(params[:id])
          end
      end
    end
  end
end