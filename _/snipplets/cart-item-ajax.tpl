<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} item cart-item row no-gutters {% if cart_page %}align-items-md-center{% endif %} bottom-line" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}" data-component="cart.line-item">

  {% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}

  {# Cart item image #}
  <div class="cart-item-image-col col-auto {% if cart_page%}cart-item-image-col-md{% endif %} right-line">
    <a href="{{ item.url }}">
      <img src="{{ item.featured_image | product_image_url('medium') }}" class="img-fluid cart-item-image {% if cart_page %}cart-item-image-md{% endif %}" />
    </a>
  </div>
  <div class="col {% if cart_page %}align-self-stretch{% else %}align-items-center{% endif %}">
    <div class="row no-gutters align-items-center {% if cart_page %}h-100{% endif %}">
      
      <div class="col-12 {% if cart_page %}col-md-4 right-line-md bottom-no-line-md d-md-flex align-self-stretch{% endif %} bottom-line">

        {# Cart item name #}

        <div class="row no-gutters w-100 {% if cart_page %}align-items-center{% endif %}">

          <div class="cart-item-name-container col py-2 px-3 right-line {% if cart_page %}col-md-8 font-md-body right-no-line-md d-md-block{% endif %}" data-component="line-item.name">
            <a href="{{ item.url }}" data-component="name.short-name" class="cart-item-name mr-1">
              {{ item.short_name }}
            </a>
            <div class="font-small" data-component="name.short-variant-name">{{ item.short_variant_name }}</div>
            {% if show_free_shipping_label %}
              <div class="text-accent font-small w-100">{{ "Envío gratis" | translate }}</div>
            {% endif %}
          </div>
          {# Cart item delete #}
          <div class="cart-item-delete col-auto {% if cart_page %}d-md-none{% endif %} text-center align-self-center" >
            <button type="button" class="btn btn-link" onclick="LS.removeItem({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="line-item.remove">
              {% include "snipplets/svg/trash-alt.tpl" with {svg_custom_class: "icon-inline icon-w-12 icon-lg"} %}
            </button>
          </div>
        </div>
      </div>

      {# Cart item quantity controls #}

      {% set cart_quantity_class = '' %}
      {% if cart_page %}
        {% set cart_quantity_class = 'float-md-none m-auto ' %}
      {% endif %}

      <div class="cart-item-quantity col-auto" data-component="line-item.subtotal">
        {% set cart_qty_margin = '' %}
        {% if cart_page %}
          {% set cart_qty_margin = 'm-md-auto' %}
        {% endif %}
        {% embed "snipplets/forms/form-input.tpl" with{
          type_number: true, 
          input_value: item.quantity, 
          input_name: 'quantity[' ~ item.id ~ ']', 
          input_data_attr: 'item-id',
          input_data_val: item.id,
          input_group_custom_class: cart_quantity_class ~ ' float-left form-quantity cart-item-quantity small p-0 top-no-line bottom-no-line mb-0 ' ~ cart_qty_margin, 
          input_custom_class: 'js-cart-quantity-input text-center', 
          input_label: false, input_append_content: true, 
          data_component: 'quantity.value',
          form_control_container_custom_class: 'js-cart-quantity-container col'} %}
            {% block input_prepend_content %}
            <div class="row no-gutters align-items-center {% if cart_page %}top-line-md bottom-line-md{% endif %}">
              <span class="js-cart-quantity-btn form-quantity-icon icon-40px right-line" onclick="LS.minusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="quantity.minus">
                {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline"} %}
              </span>
            {% endblock input_prepend_content %}
            {% block input_append_content %}
              
              {# Always place this spinner before the quantity input #}
        
              <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                {% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-spin svg-icon-text"} %}
              </span>

              <span class="js-cart-quantity-btn form-quantity-icon icon-40px left-line right-line {% if cart_page %}right-no-line-md{% endif %}" onclick="LS.plusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="quantity.plus">
                {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline"} %}
              </span>
            </div>
            {% endblock input_append_content %}
        {% endembed %}
      </div>

      {% if cart_page %}
        {# Cart item unit price #}
        <span class="col-3 d-none d-md-flex right-line left-line-md align-self-stretch justify-content-center">
          <span class="d-flex align-self-center" data-line-item-id="{{ item.id }}">{{ item.unit_price | money }}</span>
        </span>
      {% endif %}

      {# Cart item subtotal #}

      <span class="col {% if cart_page %}col-md-3 d-flex right-line-md align-self-stretch justify-content-end justify-content-md-center pr-md-0{% else %} cart-item-subtotal{% endif %} text-right">
        <span class="js-cart-item-subtotal {% if cart_page %}d-md-flex align-self-center{% endif %} pr-3" data-line-item-id="{{ item.id }}" data-component="subtotal.value" data-component-value={{ item.subtotal | money }}'>{{ item.subtotal | money }}</span>
      </span>

      {% if cart_page %}
        {# Cart item delete #}
        <div class="cart-item-delete col d-none d-md-block text-center" >
          <button type="button" class="btn btn-link" onclick="LS.removeItem({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="line-item.remove">
            {% include "snipplets/svg/trash-alt.tpl" with {svg_custom_class: "icon-inline icon-w-12 h2"} %}
          </button>
        </div>
      {% endif %}
    </div>
  </div>
</div>