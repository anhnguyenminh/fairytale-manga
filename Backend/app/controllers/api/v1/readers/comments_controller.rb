module Api
  module V1
    module Readers
      class HistoriesController < ApplicationController
        def create
          @chapter = Chapter.find(params[:id])
          render json: @chapter
        end
      end
    end
  end
end