module Api
  module V1
    module Readers
      class StoriesController < ApplicationController
        before_action :authenticate_request_reader

        def index
          @stories = Story.all.order("created_at DESC").limit(5)
          render json: @stories, each_serializer: StorySerializer
        end

        def search_stories
          @q = Story.ransack(params[:q])
          @stories = @q.result(distinct: true)
          render json: @stories
        end

        def read_story
          story = ReaderStory.find_by(reader_id: @current_reader.id, story_id: params[:id])
           
          if !story
            @readerstory = ReaderStory.new(reader_id: @current_reader.id, story_id: params[:id], chap: params[:chap])
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
            story.update(chap: params[:chap])
            render json: {
              message: "Success"
            }
          end
          # render json: story
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
