module Api
  module V1
    module Readers
      class RecommendsController < ApplicationController
        def recommend_story
          @stories = Story.joins(:chapter).distinct.order("stories.created_at DESC").limit(10)
          # render json: @stories, each_serializer: nil
          response_success(@stories, each_serializer: ::Reader::StorySerializer)
        end

        # Stories suggested for a gender group: a story qualifies when at least one of
        # its categories is untargeted (suggested to everyone) or targets that gender.
        def for_gender
          return recommend_story unless Category::GENDERS.include?(params[:gender])

          @stories = Story.joins(:category, :chapter)
                          .where(categories: { target_gender: [nil, params[:gender]] })
                          .distinct
                          .order("stories.created_at DESC")
                          .limit(10)
          response_success(@stories, each_serializer: ::Reader::StorySerializer)
        end

        def get_story_by_category
          @stories = Story.joins(:category)
                          .where("category_story.category_id= ?", params[:id])
                          .joins(:chapter).uniq
          response_success(@stories, each_serializer: ::Reader::StorySerializer)
        end
      end
    end
  end
end
