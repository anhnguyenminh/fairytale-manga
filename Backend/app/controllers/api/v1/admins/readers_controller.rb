module Api
  module V1
    module Admins
      class ReadersController < AdminappController
        def index
          @pagy, @readers = pagy(Reader.where("activated" => true), items: 2)
          render json: {data: @readers, 
                        option: {total: @pagy.count,
                          page: @pagy.page,
                          from: @pagy.from,
                          to: @pagy.to,
                          pages: @pagy.pages,}
          }     
        end
      end
    end
  end
end
