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

    def delete_if_admin(resource)
        if User.find(session[:user_id]).email == "kraewind@gmail.com"
            button_to "Delete #{resource.class}", "/#{resource.class.name.downcase}s/#{resource.id}", method: "delete"
        end
    end
end
