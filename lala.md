<% if !@show%>
            <div class="form-control">
                <%= f.label :show_id, class: "form-label"  %>
                <%= f.collection_select :show_id, Show.all, :id, :title, prompt: true, class: "form-label" %>
            </div>



<h2>Optionally create a Show for this Character!</h2>
    <br>
        <%= f.fields_for :show do |s| %>
            <div class="form-control">
            <%= s.label :title, class: "form-label" %>
            <%= s.text_field :title, class: "form-input" %>
        </div>
        <div class="form-control">
            <%= s.label :air_time, class: "form-label" %>
            <%= s.number_field :air_time, class: "form-input" %>
        </div>
        <div class="form-control">
            <%= s.label :rating, class: "form-label" %>
            <%= s.number_field :rating, class: "form-input" %>
        </div>
        <% end %>


            
        <% else %>
            <%=f.hidden_field :show_id, value: @show.id %>
        <% end %>