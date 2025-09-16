{% embed "snipplets/page-header.tpl" with {container: true} %}
    {% block page_header_text %}{{ 'Orden #{1}' | translate(order.number) }}{% endblock page_header_text %}
{% endembed %}

<section class="account-page top-line bottom-line">
    <div class="container-fluid p-0" data-store="account-order-detail-{{ order.id }}">
    	<div class="row no-gutters">
            <div class="col-md-4 right-line-md">
                {% if log_entry %}
                    <h4>{{ 'Estado actual del envío' | translate }}:</h4>{{ log_entry }}
                {% endif %}
                <h5 class="px-3 py-2 bottom-line m-0">{{ 'Detalles' | translate }}</h5>
                <div class="font-small px-3 py-2 bottom-line">
                    {% include "snipplets/svg/calendar.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Fecha' | translate}}: <strong>{{ order.date | i18n_date('%d/%m/%Y') }}</strong> 
                </div>
                <div class="font-small px-3 py-2 bottom-line">
                    {% include "snipplets/svg/info-circle.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Estado' | translate}}: <strong>{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</strong>
                </div>
                <div class="font-small px-3 py-2 bottom-line">
                    {% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Pago' | translate}}: <strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }} </strong>
                </div>
                <div class="font-small px-3 py-2 {% if order.address %}bottom-line{% endif %}">
                    {% include "snipplets/svg/usd-circle.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Medio de pago' | translate}}: <strong>{{ order.payment_name }}</strong>
                </div>

                {% if order.address %}
                    <div class="font-small px-3 py-2 bottom-line">
                        {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} {{'Envío' | translate}}: <strong>{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</strong>
                    </div>
                    <div class="font-small px-3 py-2"> 
                        {% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: "icon-inline mr-1 icon-w svg-icon-text"} %} <strong>{{ 'Dirección de envío' | translate }}:</strong>
                        <span class="d-block d-block mt-1 pl-4">
                            {{ order.address | format_address }}
                        </span>
                    </div>
                {% endif %}
            </div>
            <div class="col-md-8 top-line top-no-line-md">
                <h5 class="px-3 py-2 bottom-line m-0">{{ 'Productos' | translate }}</h5>
                <div class="d-none d-md-block bottom-line">
                    <div class="row no-gutters">
                        <div class="col-6 px-3 py-2 right-line font-small">
                            {{ 'Producto' | translate }}
                        </div>
                        <div class="col-2 text-center px-3 py-2 right-line font-small">
                            {{ 'Precio' | translate }}
                        </div>
                        <div class="col-2 text-center px-3 py-2 right-line font-small">
                            {{ 'Cantidad' | translate }}
                        </div>
                        <div class="col-2 text-center px-3 py-2 font-small">
                            {{ 'Total' | translate }}
                        </div>
                    </div>
                </div>
                <div class="order-detail">
                    {% for item in order.items %}
                        <div class="order-item bottom-line">
                            <div class="row no-gutters align-items-center">
                                <div class="col-7 col-md-6 right-line-md">
                                    <div class="row align-items-center">
                                        <div class="col-4 col-md-2 pr-0">
                                            <div class="card-img-square-container">
                                                {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: 'd-block card-img-square'}) }} 
                                            </div>
                                        </div>
                                        <div class="col-8 col-md-9">
                                            {{ item.name }} <span class="d-inline-block d-md-none text-center">x{{ item.quantity }}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2 d-none d-md-flex align-self-stretch justify-content-center right-line">
                                    <span class="d-flex align-self-center">
                                        {{ item.unit_price | money }}
                                    </span>
                                </div>
                                <div class="col-2 d-none d-md-flex align-self-stretch justify-content-center right-line">
                                    <span class="d-flex align-self-center">
                                        {{ item.quantity }}
                                    </span>
                                </div>
                                <div class="col-5 col-md-2 d-flex px-3 align-self-stretch justify-content-end justify-content-center-md">
                                    <span class="d-flex align-self-center">
                                        {{ item.subtotal | money }}
                                    </span>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                    {% if order.show_shipping_price %}
                        <div class="px-3 py-2 bottom-line text-right">
                            <strong class="font-small">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</strong>
                            {% if order.shipping == 0  %}
                                {{ 'Gratis' | translate }}
                            {% else %}
                                {{ order.shipping | money_long }}
                            {% endif %}
                        </div>
                    {% else %}
                        <div class="px-3 py-2 bottom-line text-right">
                            <strong class="font-small">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</strong>
                            {{ 'A convenir' | translate }}
                        </div>
                    {% endif %}
                    {% if order.discount %}
                        <div class="px-3 py-2 bottom-line text-right">
                           <strong class="font-small">{{ 'Descuento ({1})' | translate(order.coupon) }}:</strong>
                            - {{ order.discount | money }}
                        </div>
                    {% endif %}
                    {% if order.shipping or order.discount %}
                        <div class="px-3 py-2 bottom-line text-right">
                            <strong class="font-small">{{ 'Subtotal' | translate }}:</strong>
                            {{ order.subtotal | money }}
                        </div>
                    {% endif %}  
                    <h3 class="px-3 py-2 bottom-line text-right mb-neg-1">{{ 'Total' | translate }}: {{ order.total | money }}</h3>
                    {% if order.pending %}
                        <div class="bottom-line mb-neg-1 text-right">
                            <a class="btn btn-primary btn-big d-inline-block col col-md-4" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{ 'Realizar el pago' | translate }}</a>
                        </div>
                    {% endif %}
                </div>
            </div>
    	</div>
    </div>
</section>