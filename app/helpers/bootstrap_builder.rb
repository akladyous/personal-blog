class BootstrapBuilder < ActionView::Helpers::FormBuilder
  # include ActionView::Helpers::TagHelper
  delegate :content_tag, :tag, to: :@template

  def submit(value, options={})
    super(value, options.merge(class: 'btn btn-light rounded-pill py-2 px-4'))
  end

  def label(method, options = {})
    super(method, options.merge(class: 'form-label'))
  end

  def form_container
    @template.content_tag :div, nil, class: "form-group mb-2" do
    end
  end

  %i[text_field text_area email_field password_field].each do |method_name|
    define_method(method_name) do |method, options = {}|
      super(method, options.merge(class: 'form-control', autocomplete: 'off'))
      # content_tag :div, class: 'form-group mb-2' do
      #   label method, class: 'form-label'
      #   super(method, options.merge(class: 'form-control', autocomplete: 'off'))
      # end
    end
  end

end
