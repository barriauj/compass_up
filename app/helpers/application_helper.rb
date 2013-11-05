module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end
  
  def bootstrap_form_for(object, options = {}, &block)
    options[:builder] = BootstrappedFormBuilder
    options[:html] = options[:html] || { class: "form-horizontal", role: "form" } 
    form_for(object, options, &block)
  end
  
  def nav_tab_link_to(path, label, icon, options = {})
    content_tag(:li, options) do
      link_to(path) do
        content_tag(:span, nil, class: "glyphicon #{icon}") + " #{label}"
      end
    end
  end
end
