module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end
  
  def bootstrap_form_for(object, options = {}, &block)
    options[:builder] = BootstrappedFormBuilder
    options[:html] = options[:html] || { class: "form-horizontal", role: "form" } 
    form_for(object, options, &block)
  end
end
