Deface::Override.new(
  :virtual_path => 'spree/admin/products/_form',
  :name => 'replace_price_on_product_edit',
  :replace => "[data-hook = 'admin_product_form_price']",
  :text => "
    <div data-hook='admin_product_form_price'>
      <%= f.field_container :original_price, class: ['form-group'] do %>
        <%= f.label :original_price, raw(Spree.t(:master_original_price)) %>
        <%= f.text_field :original_price, :value => number_to_currency(@product.original_price, :unit => ''), class: 'form-control', :required => true %>
        <%#= f.error_message_on :price %>
      <% end %>
    </div>
  ")

Deface::Override.new(:virtual_path => 'spree/admin/products/_form',
  :name => 'add_sale_price_to_product_edit',
  :insert_after => "[data-hook = 'admin_product_form_price']",
  :text => "
    <%= f.field_container :sale_price, class: ['form-group'] do %>
      <%= f.label :sale_price, Spree.t(:sale_price) %>
      <%= f.text_field :sale_price, :value => number_to_currency(@product.sale_price, :unit => ''), class: 'form-control' %>
      <%#= f.error_message_on :sale_price %>
    <% end %>
  ")
