class SearchController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @limit ||= 15
    @query = params[:query]
    @pgsearch = PgSearch.multisearch(@query).includes(:searchable).map(&:searchable)
    # @results = @pgsearch.page(params[:page]).per(@limit)
  end

  def show
  end

  # def self.multisearch(query)
  #   PgSearch.multisearch(query).includes(:searchable).map(&:searchable)
  # end

end
