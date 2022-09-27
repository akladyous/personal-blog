module ApplicationHelper
  def object_errors_for?(object, attribute)
    return nil if object.errors.empty?

    if object.errors.has_key?(attribute)
      return content_tag :div, nil, { class: %w[d-block invalid-feedback] } do
        object.errors.full_messages_for(attribute).to_sentence
      end
    end
    nil
  end
end
