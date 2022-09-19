class BootstrapBuilder < ActionView::Helpers::FormBuilder

  def text_field(method, options={})
    super(method, options.merge(class: 'form-control', autocomplete: "off"))
  end
  def email_field(method, options={})
    super(method, options.merge(class: 'form-control', autocomplete: "off"))
  end
  def password_field(method, options={})
    super(method, options.merge(class: 'form-control', autocomplete: "off"))
  end
  def submit(value, options={})
    super(value, options.merge(class: 'btn btn-light rounded-pill py-2 px-4'))
  end

  def label(method, text = nil, options = {})
    super(method, options.merge(class: 'form-label', autocomplete: "off"))
  end

  def form_container
    @template.content_tag :div, nil, class: "form-group mb-2" do

    end
  end
end
