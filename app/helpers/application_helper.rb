module ApplicationHelper
    def feedback_for?(object, attribute)
        return nil if object.errors.empty?
        if object.errors.has_key?(attribute)
            return content_tag :div, nil, { class: ['d-block', 'invalid-feedback'] } do
                resource.errors.full_messages_for(attribute).to_sentence
            end
        end
        nil
    end
end
