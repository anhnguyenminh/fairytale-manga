module Api
  module V1
    module Admins
      class ReadersController < AdminappController
        def index
          readers = Reader.order(id: :desc).ransack(params[:q]).result
          @pagy, @readers = pagy(readers, items: 2)
          response_list(@readers, { adapter: :json,
                                    each_serializer: ReaderSerializer })
        end

        private

        def option
          { total: @pagy.count,
            page: @pagy.page,
            from: @pagy.from,
            to: @pagy.to,
            pages: @pagy.pages }
        end
      end
    end
  end
end
