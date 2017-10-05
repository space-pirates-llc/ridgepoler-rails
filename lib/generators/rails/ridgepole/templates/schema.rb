# frozen_string_literal: true

create_table :<%= table_name %><%= primary_key_type %>, force: :cascade do |t|
<% attributes.each do |attribute| -%>
<% if attribute.password_digest? -%>
  t.string :password_digest<%= attribute.inject_options %>
<% elsif attribute.token? -%>
  t.string :<%= attribute.name %><%= attribute.inject_options %>
<% else -%>
  t.<%= attribute.type %> :<%= attribute.name %><%= options_for_attribute(attribute) %>
<% end -%>
<% end -%>
<% if options[:timestamps] %>
  t.datetime :created_at, null: false
  t.datetime :updated_at, null: false
<% end -%>
end

<% attributes.select(&:token?).each do |attribute| -%>
add_index :<%= table_name %>, :<%= attribute.index_name %><%= attribute.inject_index_options %>, unique: true
<% end -%>
<% attributes_with_index.each do |attribute| -%>
add_index :<%= table_name %>, :<%= attribute.index_name %><%= attribute.inject_index_options %>
<% end -%>
