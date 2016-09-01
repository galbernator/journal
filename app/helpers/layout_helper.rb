module LayoutHelper

  def nav_li(tab, options = {})
    options[:class] ||= []
    options[:class] = [options[:class]] if options[:class].is_a?(String)
    options[:class] << 'nav-item'
    if tab == (@current_tab || controller.controller_name).to_sym
      options[:class] << 'active' unless options[:class].include?('active')
    end
    content_tag(:li, options) do
      yield if block_given?
    end
  end

end
