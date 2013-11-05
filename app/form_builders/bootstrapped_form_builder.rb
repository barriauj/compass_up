class BootstrappedFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :submit_tag, :tag, to: :@template
  
  def error_messages
    if object.errors.full_messages.any?
      content_tag(:div, class: "form-group") do
        content_tag(:div, class: "col-sm-offset-2 col-sm-10") do
          content_tag(:div, class: "panel panel-default panel-danger") do
            content_tag(:div, class: "panel-heading") do
              content_tag(:h2, class: "panel-title") do
                "#{object.errors.count} #{"error".pluralize(object.errors.count)} prohibited this record from being saved:"
              end
            end +
            content_tag(:div, class: "panel-body") do
              content_tag(:ul) do
                object.errors.full_messages.map do |msg|
                  content_tag(:li, msg)
                end.join.html_safe
              end
            end
          end
        end
      end
    end
  end

  def bs_text_area(method, options = {})
    options[:label] ||= method.to_s.humanize
    options[:class] ||= "form-control"
    content_tag(:div, class: "form-group") do
      label(method, options[:label], class: "col-sm-2 control-label") +
      content_tag(:div, class: has_error(method)) do
        text_area(method, options) +
        (content_tag(:p, options[:help_text], class: "help-block") if options[:help_text])
      end
    end
  end
  
  def bs_text_field(method, options = {})
    options[:label] ||= method.to_s.humanize
    options[:class] ||= "form-control"
    content_tag(:div, class: "form-group") do
      label(method, options[:label], class: "col-sm-2 control-label") +
      content_tag(:div, class: has_error(method)) do
        text_field(method, options) +
        (content_tag(:p, options[:help_text], class: "help-block") if options[:help_text])
      end
    end
  end
  
  def bs_submit(value=nil, options={})
    value ||= submit_default_value
    options[:class] ||= "btn btn-default"
    content_tag(:div, class: "form-group") do
      content_tag(:div, class: "col-sm-offset-2 col-sm-10") do
        submit(value, options)
      end
    end
  end
  
private

  def objectify_options(options)
    super.except(:label, :help_text)
  end
  
  def has_error(method)
    if object.errors.any? && object.errors.include?(method)
      "col-sm-10 has-error"
    else
      "col-sm-10"
    end
  end
end