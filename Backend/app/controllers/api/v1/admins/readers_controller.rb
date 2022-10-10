module Api
  module V1
    module Admins
      class ReadersController < AdminappController
        def index
          readers = Reader.order(id: :desc).ransack(params[:q]).result
          @pagy, @readers = pagy(readers, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)
          # render json: {read: @readers, each_serializer: ReaderSerializer ,option: option }
            # ,
            #             option: {total: @pagy.count,
            #               page: @pagy.page,
            #               from: @pagy.from,
            #               to: @pagy.to,
            #               pages: @pagy.pages}
              
          # @r = @readers, each_serializer: ReaderSerializer
          # render json: @r
          response_list(@user, { adapter: :json,
            each_serializer: ReaderSerializer })
        end

        private
        def option

          {total: @pagy.count,
                          page: @pagy.page,
                          from: @pagy.from,
                          to: @pagy.to,
                          pages: @pagy.pages}
        end
      end
    end
  end
end
