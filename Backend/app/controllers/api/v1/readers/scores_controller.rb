module Api
  module V1
    module Readers
      class ScoresController < ReaderappController
        def increase_score
          @gift = Gift.find_by(name: params[:gift_name])
          current_reader.update_attribute(:score, current_reader.score+ score)
          render json: {
            message: "Chuc mung ban da hoan thanh nhiem vu"
          }
        end

        def decrease_score
          @gift = Gift.find(params[:id])
          if current_reader.score < @gift.score
            render json: {
              message: "Ban ko du diem de doi qua. Tich cuc hoan thanh nhiem vu nha"
            }
          else
            current_reader.update_attribute(:score, current_reader.score- gift.score)
            render json: {
              message: "Chuc mung ban da doi qua thanh cong"
            }
        end
      end
    end
  end
end