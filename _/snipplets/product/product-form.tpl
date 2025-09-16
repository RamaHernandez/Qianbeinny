{# Product name and breadcrumbs for product page #}

{% if not home_main_product %}
    {% embed "snipplets/page-header.tpl" %}
        {% block page_header_text %}{{ product.name }}{% endblock page_header_text %}
    {% endembed %}
{% endif %}

<div class="px-3 {% if home_main_product %}py-4{% else %}pb-3{% endif %} bottom-line">
    {% if home_main_product %}
        {# Product name #}
        <h2 class="mb-3">{{ product.name }}</h2>
    {% endif %}

    {# Product price #}

    {% if product.display_price %}
        <div class="price-container" data-store="product-price-{{ product.id }}">
            <div class="{% if home_main_product %}mb-2{% else %}mb-3{% endif %}">
                <span class="d-inline-block">
                	<div class="js-price-display h4" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %} data-product-price="{{ product.price }}">{% if product.display_price %}{{ product.price | money }}{% endif %}</div>
                </span>
                <span class="d-inline-block h4 font-weight-normal">
                   <div id="compare_price_display" class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</div>
                </span>
                {{ component('payment-discount-price', {
                        visibility_condition: settings.payment_discount_price,
                        location: 'product',
                        container_classes:  "text-accent h6 font-small mt-1",
                        text_classes: {
                            price: 'font-big',
                        },
                    }) 
                }}
            </div>

            {% set installments_info = product.installments_info_from_any_variant %}
            {% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
            {% set show_payments_info = settings.product_detail_installments and product.show_installments and product.display_price and installments_info %}

            {% if not home_main_product and (show_payments_info or hasDiscount) %}
                <div {% if installments_info %}data-toggle="#installments-modal" data-modal-url="modal-fullscreen-payments"{% endif %} class="{% if installments_info %}js-modal-open js-fullscreen-modal-open{% endif %} js-product-payments-container mb-3" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
            {% endif %}
                {% if hasDiscount %}
                    <div class="font-small mb-1">
                        <span class="text-accent">{{ product.maxPaymentDiscount.value }}% {{'de descuento' | translate }}</span> {{'pagando con' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}
                    </div>
                {% endif %}
                {% if show_payments_info %}
                    {{ component('installments', {'short_wording' : true, 'location' : 'product_detail', container_classes: { installment: "font-small mb-1"}}) }}
                {% endif %}
            {% if not home_main_product and (show_payments_info or hasDiscount) %}
                    <a id="btn-installments" class="btn-link font-small" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                      {% if not hasDiscount and not settings.product_detail_installments %}
                        {{ "Ver medios de pago" | translate }}
                      {% else %}
                        {{ "Ver más detalles" | translate }}
                      {% endif %}
                    </a>
                </div>
            {% endif %}

        </div>
    {% endif %}

    {# Promotional text #}

    {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
        <div class="js-product-promo-container" data-store="product-promotion-info">
            {% if product.promotional_offer.script.is_discount_for_quantity %}
                {% for threshold in product.promotional_offer.parameters %}
                    <h4 class="mb-3 h6 text-accent">{{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</h4>
                {% endfor %}
            {% else %}
                <h4 class="mb-3 h6 text-accent">{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</h4>
            {% endif %}
            {% if product.promotional_offer.scope_type == 'categories' %}
                <p class="font-small">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
                {% for scope_value in product.promotional_offer.scope_value_info %}
                   {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
                {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
            {% elseif product.promotional_offer.scope_type == 'all'  %}
                <p class="font-small">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
            {% endif %}
        </div>
    {% endif %}

    {# Product SKU #}

    {% if settings.product_sku and product.sku %}
        <div class="font-smallest opacity-60 mb-3">
            {{ "SKU" | translate }}: <span class="js-product-sku">{{ product.sku }}</span>
        </div>
    {% endif %}

</div>

{# Product form, includes: Variants, CTA and Shipping calculator #}

 <form id="product_form" class="js-product-form overflow-none mb-neg-1" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
    {% if template == "product" %}
        {% set show_size_guide = true %}
    {% endif %}
    {% if product.variations %}
        {% include "snipplets/product/product-variants.tpl" with {show_size_guide: show_size_guide} %}
    {% endif %}

    {% set show_product_quantity = product.available and product.display_price %}

    {% if settings.last_product and show_product_quantity %}
        <div class="{% if product.variations %}js-last-product {% if show_size_guide and settings.size_guide_url %}top-line {% endif %}{% endif %}text-accent font-weight-bold p-3"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
            {{ settings.last_product_text }}
        </div>
    {% endif %}

    <div class="row no-gutters my-neg-1{% if show_product_quantity and settings.product_stock %} bottom-line{% endif %}">
        {% if show_product_quantity %}
            {% include "snipplets/product/product-quantity.tpl" %}
        {% endif %}
        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
        <div class="{% if show_product_quantity %}col-7{% else %}col-12{% endif %}">

            {# Add to cart CTA #}

            <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big btn-block btn-line {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

            {# Fake add to cart CTA visible during add to cart event #}

            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-big"} %}

        </div>

        {% if settings.ajax_cart %}
            <div class="col-12">
                <div class="js-added-to-cart-product-message font-small p-3{% if settings.product_stock %} top-line{% else %} bottom-line{% endif %}" style="display: none;">
                    {% include "snipplets/svg/check.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text mr-2 d-table float-left"} %}
                    <span>
                        {{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-open-cart js-fullscreen-modal-open btn-link float-right ml-1" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                    </span>
                </div>
            </div>
        {% endif %}
    </div>

    {% if template == 'product' %}

        {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

        {% if show_product_fulfillment %}

            {# Shipping calculator and branch link #}

            <div id="product-shipping-container" class="product-shipping-calculator list" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
                {% if store.has_shipping %}
                    {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                {% endif %}
            </div>

            {% if store.branches %} 
                {# Link for branches #}
                {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
            {% endif %}

        {% endif %}
    {% endif %}

    {% if not home_main_product %}
        {# Product share #}
        {% include 'snipplets/social/social-share.tpl' %}
    {% endif %}

 </form>

{# Product payments details #}
{% include 'snipplets/product/product-payment-details.tpl' %}



