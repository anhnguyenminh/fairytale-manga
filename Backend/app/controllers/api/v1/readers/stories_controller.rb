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
          @story = Story.joins(:reader)
            .select("stories.*")
            .where("readers.id" => @current_reader.id)
            .where("stories.id" => params[:id])
          if !@story
            @current_reader.story.find(params[:id]).delete
            @current_reader.story << Story.find(params[:id])
            render json: {
              message: "ok",
            }
          else
            @current_reader.story << Story.find(params[:id])
            render json: {
              message: "ok",
            }
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
      end
    end
  end
end
