module Response
  DEFAULT_PER_PAGE = 20
  DEFAULT_PAGE = 1
  include Pagy::Backend

  def response_success(data = {}, options = {})
    render({ json: data, status: :ok, **options })
  end

  def response_list(data, options = {})
    default_options = { adapter: :json, meta: meta_data }
    response_success(data, options.merge(default_options))
  end

  def meta_data
    {
      total: @pagy.count,
      page: @pagy.page,
      from: @pagy.from,
      to: @pagy.to,
      pages: @pagy.pages,
    }
  end
end
