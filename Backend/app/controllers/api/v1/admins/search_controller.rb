module Api
  module V1
    module Admins
      # Global search behind the admin top bar. Moderators only get stories (RBAC),
      # owners and admins also get authors and categories.
      class SearchController < AdminappController
        MIN_LENGTH = 2
        LIMIT = 5

        def index
          term = params[:q].to_s.strip
          return response_success(empty_results) if term.length < MIN_LENGTH

          pattern = "%#{ActiveRecord::Base.sanitize_sql_like(term)}%"
          response_success(
            stories: matches(Story, pattern),
            authors: @current_admin.management? ? matches(Author, pattern) : [],
            categories: @current_admin.management? ? matches(Category, pattern) : [],
          )
        end

        private

        def matches(model, pattern)
          model.where("#{model.table_name}.name LIKE ?", pattern).order(id: :desc).limit(LIMIT).map do |record|
            { id: record.id, name: record.name }
          end
        end

        def empty_results
          { stories: [], authors: [], categories: [] }
        end
      end
    end
  end
end
