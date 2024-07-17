module ApplicationHelper
  include Pagy::Frontend

  def pagination(object)
    raw(pagy_bootstrap_nav(object)) if object.pages > 1
  end

  def nav_tab(title, url, options = {})
    current_page = options.delete(:current_page)
    active_style = current_page == url ? 'color: #666666;' : 'color: #ffffff;'
    options[:style] = "#{options[:style]} #{active_style}".strip

    link_to title, url, options
  end

  def currently_at(current_page = '')
    render partial: 'shared/menu', locals: { current_page: current_page }
  end

  def full_title(page_title = '')
    base_title = "Expenses"
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end
