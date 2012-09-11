<table class="table table-striped">
  <tr>
    <th>Ticket #</th>
    <th>Company Name</th>
    <th>Contact</th>
    <th>Email</th>
    <th>Paid</th>
    <th>Approved</th>
    <% if session[:username] == 'superadmin' %>
        <th></th>
        <th></th>
        <th></th>
    <% end %>   
  </tr>
<% @lbas.each do |lba| %>
  <tr id='<%= dom_id lba %>'>
    <td><%= lba.ticket_num %></td>
    <td><%= lba.company_name %></td>
    <td><%= lba.company_contact %></td>
    <td><%= lba.company_email %></td>
    <% if lba.paid == 'no' %>
        <td><%= image_tag('cross.png') %></td>
    <% else %>
        <td><%= image_tag('check.png') %></td>
    <% end %>

    <% if lba.approved == 'no' %>
        <td><%= image_tag('cross.png') %></td>
    <% else %>
        <td><%= image_tag('check.png') %></td>
    <% end %>
        
    
    <% if session[:username] == 'superadmin' %>
        <td><%= link_to 'Show', lba %></td>
        <td><%= link_to 'Edit', edit_lba_path(lba) %></td>
        <td><%= link_to 'Destroy', lba, confirm: 'Are you sure?', method: :delete, remote: true %></td>
    <% end %>
  </tr>
<% end %>
</table>