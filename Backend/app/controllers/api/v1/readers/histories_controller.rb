module Api
  module V1
    module Readers
      class HistoriesController < ApplicationController
        def read_story
          @s = Story.find(params[:id])
          @story = Story.joins(:reader)
                          .select('stories.*')
                          .where('readers.id'=> current_reader.id)
                          .where('stories.id'=> params[:id])
          if @story
            current_reader.story.find(params[:id]).delete
            current_reader.story<< Story.find(params)
            render json: {
              message: "ok"
            }
          else
            current_reader.story<< Story.find(params)
            render json: {
              message: "ok"
            }
          end
        end

        def show
          @story = Story.find(params[:id])
          render json: @story
        end

        def show_chapter
          @chapter = Chapter.find(params[:id])
          render json: @chapter
        end
      end
    end
  end
end