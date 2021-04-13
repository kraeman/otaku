module ApplicationHelper
    def display_error_messages_if_any(resource)
        # byebug
        if resource.errors.any?
            resource.errors.each do |error|
                # byebug
                error.full_message
            end
        end
    end
end
