module ApplicationHelper
    def display_error_messages_if_any(resource)
        errors = ""
        i = 1
            if resource.errors.any?
                resource.errors.each do |error|
                    errors += " #{i}.#{error.full_message}"
                    i += 1
                end
                errors.html_safe
            end
    end

    def delete_if_admin(resource)
        if User.find(session[:user_id]).email == "kraewind@gmail.com"
            button_to "Delete #{resource.class}", "/#{resource.class.name.downcase}s/#{resource.id}", method: "delete"
        end
    end

end
