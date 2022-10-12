module Api
  module V1
    module Readers
      class StoriesController < ApplicationController
        before_action :authenticate_request_reader

        def index
          @stories = Story.all.order("created_at DESC").limit(5)
          render json: @stories
        end

        def search_stories
          @q = Story.ransack(params[:q])
          @stories = @q.result(distinct: true)
          render json: @stories
        end

        def read_story
          @story = ReaderStory.where("reader_stories.reader_id" => @current_reader.id)
            .where("reader_stories.story_id" => params[:story_id])
          if !@story
            @readerstory = ReaderStory.new(story_params)
            if @readerstory.save
              render json: {
                message: "ok",
              }
            else
              render json: {
                message: "failed"
              }
            end
          else
           @readerstory = ReaderStory.update_atribute(chap: params[:chap])
          end
        end

        def show
          @story = Story.find(params[:id])
          render json: @story, each_serializer: StorySerializer
        end

        def show_chapter
          @story = Story.find_by(name: params[:name_story])
          @chapter = Chapter.find_by(story_id: @story.id, name: params[:name_chapter])
          render json: @chapter
        end

        private

        def story_params
          params.permit(:reader_id, :story_id, :chap)
        end
      end
    end
  end
end
