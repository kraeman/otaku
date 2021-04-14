module ActorsHelper
    def iterate_through_actor(actors)
        actorz = ""
        if actors.any?
            actors.each do |a|
                actorz << (link_to a.name, actor_path(a)) + content_tag(:br)
            end
            actorz.html_safe
        else
            "No actors yet!!!"
        end
    end


end
