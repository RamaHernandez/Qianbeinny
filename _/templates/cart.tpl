<div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}" data-store="cart-page">
    {% embed "snipplets/page-header.tpl" with {'breadcrumbs': true} %}
        {% block page_header_text %}{{ "Carrito de compras" | translate }}{% endblock page_header_text %}
    {% endembed %}
    
    <form action="{{ store.cart_url }}" method="post" class="visible-when-content-ready top-line bottom-line" data-store="cart-form" data-component="cart">

        {# Cart alerts #}

        {% if error.add %}
            {{ component('alert', {
                'type': 'warning',
                'message': 'our_components.cart.error_messages.' ~ error.add,
                'class': 'bottom-line top-no-line',
            }) }}
        {% endif %}
        {% for error in error.update %}
            <div class="alert alert-warning bottom-line top-no-line">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
        {% endfor %}
        {% if cart.items %}

            {# Cart header #}
            
            <div class="cart-row subtitle bottom-line d-none d-md-block">
                <div class="row no-gutters">
                    <div class="cart-img-col-title p-3">
                        <span class="js-cart-products-heading-plural" {% if cart.items_count == 1 %}style="display: none;"{% endif %}>{{ 'Productos' | translate }}</span>
                        <span class="js-cart-products-heading-singular" {% if cart.items_count > 1 %}style="display: none;"{% endif %}>{{ 'Producto' | translate }}</span>
                    </div>
                    <div class="col">
                        <div class="row no-gutters">
                            <div class="col-4 py-3 right-line"></div>
                            <div class="cart-qty-col-title text-center py-3">{{ 'Cantidad' | translate }}</div>
                            <div class="col-3 text-center py-3 left-line right-line">{{ 'Precio' | translate }}</div>
                            <div class="col-3 text-center py-3 right-line">{{ 'Subtotal' | translate }}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="js-ajax-cart-list">

                {# Cart items #}

                {% if cart.items %}
                  {% for item in cart.items %}
                    {% include "snipplets/cart-item-ajax.tpl" with {'cart_page': true} %}
                  {% endfor %}
                {% endif %}
            </div>
            <div class="row justify-content-between no-gutters">
                <div class="col-md-3">
                    {% include "snipplets/shipping/cart-fulfillment.tpl" with {'cart_page': true} %}
                </div>
                <div class="col-md-3 left-line-md">
                    {% include "snipplets/cart-totals.tpl" with {'cart_page': true} %}
                </div>
            </div>
        {% else %}

            {#  Empty cart  #}

            {% if not error %}
                {{ component('alert', {
                    'type': 'info',
                    'message': ('El carrito de compras está vacío.' | translate),
                    'class': 'top-no-line text-center p-4',
                }) }}
            {% endif %}
        {% endif %}
        <div id="error-ajax-stock" class="alert alert-warning bottom-line top-no-line" style="display: none;"> 
            {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
        </div>
    </form>
    <div id="store-curr" class="hidden">{{ cart.currency }}</div>
</div>

