{% embed "snipplets/page-header.tpl" with {container: true} %}
    {% block page_header_text %}{{ "Mi cuenta" | translate }}{% endblock page_header_text %}
{% endembed %}

<section class="account-page top-line bottom-line">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <div class="col-md-4 right-line-md">
                <div class="bottom-line"> 
                    <div class="p-3 bottom-line row no-gutters align-items-center">
                        <h4 class="d-inline-block m-0 col">{{ 'Datos Personales' | translate }}</h4>
                        {{ 'Editar' | translate | a_tag(store.customer_info_url, '', 'btn-link font-small col-auto') }}
                    </div>
                    <p class="font-small p-3 mb-0">
                        <strong>
                            {{customer.name}}
                        </strong>
                        <span class="d-block">
                            {{customer.email}}
                        </span>
                        {% if customer.cpf_cnpj %}
                            <span class="d-block">
                                {{ 'DNI' | translate }}: {{ customer.cpf_cnpj | format_cpf_cnpj }}
                            </span>
                        {% endif %}

                        {% if customer.business_name %}
                            <span class="d-block">
                                {{ 'Razón social' | translate }}: {{ customer.business_name }}
                            </span>
                        {% endif %}
                        {% if customer.trade_name %}
                            <span class="d-block">
                                {{ 'Nombre comercial' | translate }}: {{ customer.trade_name }}
                            </span>
                        {% endif %}
                        {% if customer.state_registration %}
                            <span class="d-block">
                                {{ 'Inscripción estatal' | translate }}: {{ customer.state_registration }}
                            </span>
                        {% endif %}

                        {% if customer.phone %}
                            <span class="d-block">
                               <strong>{{ 'Teléfono' | translate }}</strong>: {{ customer.phone }}
                            </span>
                        {% endif %}
                    </p>
                </div>
                {% if customer.default_address %}
                    <div class="p-3 bottom-line row no-gutters align-items-center">
                        <h4 class="d-inline-block m-0 col">{{ 'Mis direcciones' | translate }}</h4>
                        {{ 'Editar' | translate | a_tag(store.customer_address_url(customer.default_address), '', 'btn-link font-small col-auto') }}
                    </div>

                    <p class="p-3 m-0">
                        <span class="d-block font-small">
                            {{ customer.default_address | format_address_short }}
                        </span>
                        {{ 'Otras direcciones' | translate | a_tag(store.customer_addresses_url, '', 'btn-link font-small') }}
                    </p>
                {% endif %}
            </div>
            <div class="col-md-8 top-line top-no-line-md">
                <div class="row no-gutters" data-store="account-orders">
                    {% if customer.orders %}
                        {% if customer.ordersCount > 50 %}
                            <div class="col-12 h4 p-3 bottom-line">
                                {{ 'Últimas 50 órdenes' | translate }}
                            </div>
                        {% endif %}
                        {% for order in customer.orders %}
                            {% set add_checkout_link = order.pending %}
                            <div class="col-md-6" data-store="account-order-item-{{ order.id }}">
                                {% set odd_card_class = '' %}
                                {% if loop.index is odd %}
                                    {% set odd_card_class = ' right-line-md' %}
                                {% endif %} 
                                {% if loop.last %}
                                    {% set last_card_class = ' mb-neg-1' %}
                                {% endif %} 
                                {% embed "snipplets/card.tpl" with{card_footer: true, card_custom_class: 'card-collapse bottom-line ' ~ odd_card_class ~ last_card_class, card_custom_body_class: 'top-line p-0', card_custom_footer_class: 'p-0 top-line', card_collapse: true} %}
                                    {% block card_head %}
                                        <div class="row">
                                            <div class="col">
                                                <h4 class="m-0">
                                                     <a class="btn-link" href="{{ store.customer_order_url(order) }}"><strong>{{'Orden:' | translate}} #{{order.number}}</strong></a>
                                                </h4>
                                            </div>
                                            <div class="js-card-collapse-toggle col text-right">
                                                <p class="m-0"><small>{{ order.date | i18n_date('%d/%m/%Y') }}</small></p>
                                            </div>
                                        </div>
                                    {% endblock %}
                                    {% block card_body %}
                                    <div class="container container-fluid p-0">
                                        <div class="row no-gutters">
                                            <div class="col-7 right-line-md">
                                                <p class="font-small m-0 p-2 bottom-line">
                                                    {% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Pago' | translate}}: <span class="{{ order.payment_status }}"> <strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong></span>
                                                </p>
                                                <p class="font-small m-0 p-2 bottom-line">
                                                    {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Envío' | translate}}: <strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }} </strong>
                                                </p>
                                                <div class="p-2">
                                                    <h4 class="mb-1">
                                                        <strong>{{'Total' | translate}}</strong> {{ order.total | money }}
                                                    </h4>
                                                    <a class="btn-link font-small d-block" href="{{ store.customer_order_url(order) }}">{{'Ver detalle >' | translate}}</a>
                                                </div>
                                            </div>

                                            <div class="col-5 p-0">
                                                <div class="card-img-square-container">
                                                    {% for item in order.items %}
                                                        {% if loop.first %} 
                                                            {% if loop.length > 1 %} 
                                                                <span class="card-img-pill">{{ loop.length }} {{'Productos' | translate }}</span>
                                                            {% endif %}
                                                            {{ item.featured_image | product_image_url("") | img_tag(item.featured_image.alt, {class: 'card-img-square'}) }}
                                                        {% endif %}
                                                    {% endfor %}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {% endblock %}
                                    {% block card_foot %}
                                        {% if add_checkout_link %}
                                            <a class="btn btn-primary btn-medium d-block" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago' | translate}}</a>
                                        {% elseif order.order_status_url != null %}
                                            <a class="btn btn-primary btn-medium d-block" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                        {% endif %}
                                    {% endblock %}
                                {% endembed %}
                            </div>
                        {% endfor %}
                    {% else %}
                    <div class="col text-center">
                        {% include "snipplets/svg/cart.tpl" with {svg_custom_class: "icon-inline mr-1 icon-lg svg-icon-primary"} %}
                        <p class="mt-2">{{ '¡Hacé tu primera compra!' | translate }}</p>
                        {{ 'Ir a la tienda' | translate | a_tag(store.url, '', 'btn btn-primary btn-block mt-2') }}
                    </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
</section>
