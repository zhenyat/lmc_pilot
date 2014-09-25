module ApplicationHelper
  ##############################################################################
  # Get Application name (used by page_title)
  #   Alternatives:
  #       Rails.application.class.to_s.split("::").first
  #       Rails.application.config.session_options[:key].sub(/^_/,'').sub(/_session/,'')
  #       Rails.application.engine_name.gsub(/_application/,'')
  #
  # 15.12.2013  Created
  ##############################################################################
  def app_name
    Rails.application.class.parent_name
  end

  ##############################################################################
  # HTML element to switch language among available ones
  #
  # Source:  http://dhampik.ru/blog/rails-routes-tricks-with-locales
  #
  # 17.11.2013  The `alternative version` in the source is used
  ##############################################################################
  def language_switch
    content_tag(:ul, id: 'switch') do
      I18n.available_locales.each do |loc|
        locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc)
        concat content_tag(:li, (link_to I18n.t(:language, locale: loc), locale_param), class: (I18n.locale == loc ? "active" : ""))
      end
    end
  end

  ##############################################################################
  # Return a title on a per-page basis with localization
  # Source:  Michael Hartl
  #
  # 15.12.2013  Created
  # 19.12.2013  Approach modified
  # 28.12.2003  Updated
  ##############################################################################
  def page_title
    if controller_name == 'pages'
      title = t "#{action_name}_page"
      "#{app_name} | #{title}"                                # e.g.: 'Ror4 | Home'
    else
      if @page_title.nil?
        "#{app_name} | #{t controller_name}-#{t action_name}" # e.g.: 'Ror4 | groups-index'
      else
        "#{app_name} | #{t @page_title}"                      # e.g.: 'Ror4 | Show group Manager'
      end
    end
  end

end

