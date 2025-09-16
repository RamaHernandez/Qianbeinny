<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container" data-variants="{{product.variants_object | json_encode }}" data-store="product-detail">
    <div class="container-fluid p-0">
        <div class="row no-gutters bottom-line">
            <div class="col-md-auto product-image-column right-line-md bottom-line bottom-no-line-md">
                <div class="mb-neg-1">
                    <div class="product-image-container position-relative bottom-line">
                        <div class="js-swiper-product swiper-container">
                            <div class="labels labels-product-slider">
                                <div class="label label-accent">{{ "35% OFF" | translate }}</div>
                            </div>
                            <div class="swiper-wrapper">
                                 <div class="js-product-slide swiper-slide product-slide slider-slide right-line" data-image="0" data-image-position="0">
                                    <a href="{{ image | product_image_url('huge') }}" data-fancybox="product-gallery" class="d-block p-relative">
                                        {% include "snipplets/svg/help/help-product-3.tpl" with {svg_custom_class:'product-slider-image'} %}
                                    </a>
                                 </div>
                                 <div class="js-product-slide swiper-slide product-slide slider-slide right-line" data-image="1" data-image-position="1">
                                    <a href="{{ image | product_image_url('huge') }}" data-fancybox="product-gallery" class="d-block p-relative">
                                        {% include "snipplets/svg/help/help-product-3-green.tpl" with {svg_custom_class:'product-slider-image'} %}
                                    </a>
                                 </div>
                                 <div class="js-product-slide swiper-slide product-slide slider-slide right-transparent-line" data-image="2" data-image-position="2">
                                    <a href="{{ image | product_image_url('huge') }}" data-fancybox="product-gallery" class="d-block p-relative">
                                        {% include "snipplets/svg/help/help-product-3-red.tpl" with {svg_custom_class:'product-slider-image'} %}
                                    </a>
                                 </div>
                            </div>
                        </div>
                        <div class="swiper-arrows d-none d-md-block mx-neg-1 mb-neg-1">
                            <div class="js-swiper-product-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                            <div class="js-swiper-product-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                        </div>
                    </div>
                </div>
                {% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
            </div>
            <div class="col-md-auto product-info-column">
                {# Product name and breadcrumbs #}

                <section class="page-header">
                    <div class="breadcrumbs px-3 py-2 bottom-line">
                        <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
                        <span class="divider mr-1">|</span>
                        <a class="crumb" href="{{ store.products_url }}" title="{{ "Productos" | translate }}">{{ "Productos" | translate }}</a>
                        <span class="divider mr-1">|</span>
                        <span class="crumb active">{{ "Producto de ejemplo" | translate }}</span>
                    </div>
                    <h1 class="h2 p-3 text-uppercase">{{ "Producto de ejemplo" | translate }}</h1>
                </section>

                <div class="px-3 pb-3 bottom-line">
                    {# Product price #}

                    {% set product_can_show_installments = product.show_installments and product.display_price %}

                    {% if store.country == 'BR' %}
                        <div class="price-container mb-3">
                            <span class="d-inline-block mr-1">
                                <div class="js-price-display h4" id="price_display">{{"18200" | money }}</div>
                            </span>
                            <span class="d-inline-block">
                               <h4 id="compare_price_display" class="js-compare-price-display price-compare h4 mb-0 font-weight-normal" style="display:block;">{{"28000" | money }}</h4>
                            </span>
                        </div>
                    {% else %}
                        <div class="price-container mb-3">
                            <span class="d-inline-block mr-1">
                                <div class="js-price-display h4" id="price_display">{{"182000" | money }}</div>
                            </span>
                            <span class="d-inline-block">
                               <h4 id="compare_price_display" class="js-compare-price-display price-compare h4 mb-0 font-weight-normal" style="display:block;">{{"280000" | money }}</h4>
                            </span>
                        </div>
                    {% endif %}

                    {# Product installments #}

                    <div href="#installments-modal" class="js-product-payments-container row mb-3">
                        <span class="js-max-installments-container js-max-installments col">
                            <span class="float-left mr-2">
                                {% include "snipplets/svg/credit-card.tpl" with {svg_icon_underline: true, svg_custom_class : "icon-inline svg-icon-text icon-lg"} %}
                            </span>
                            <span class="d-table text-inline">
                                <span>{{ "Hasta 12 cuotas" | translate }}</span>
                            </span>
                        </span>
                    </div>
                </div>

                {# Product form, includes: Variants, CTA and Shipping calculator #}

                <form id="product_form" class="js-product-form overflow-none mb-neg-1" method="post" action="">
                    <input type="hidden" name="add_to_cart" value="2243561" />

                    <div class="js-product-variants row no-gutters left-line mx-neg-1">
                        <div class="col-12">
                            <div class="form-group ">
                                <label class="form-label d-block px-3 py-2" for="variation_1">{{ "Color" | translate }}</label>
                                <select id="variation_1" class="form-select js-variation-option js-refresh-installment-data  " name="variation[0]">
                                    <option value="{{ "Verde" | translate }}">{{ "Verde" | translate }}</option>
                                    <option value="{{ "Rojo" | translate }}">{{ "Rojo" | translate }}</option>
                                </select>
                                <div class="form-select-icon">
                                    {% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row no-gutters my-neg-1 bottom-line">
                        <div class="col-5">
                            {% embed "snipplets/forms/form-input.tpl" with{
                            type_number: true, input_value: '1', 
                            input_name: 'quantity' ~ item.id, 
                            input_custom_class: 'js-quantity-input', 
                            input_label: false, 
                            input_append_content: true, 
                            input_group_custom_class: 'js-quantity form-quantity', 
                            form_control_container_custom_class: 'col', 
                            form_control_quantity: true,
                            input_min: '1'} %}
                                {% block input_prepend_content %}
                                <div class="form-row m-0 align-items-center">
                                    <span class="js-quantity-down form-quantity-icon icon-48px right-line my-neg-1">
                                        {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline"} %}
                                    </span>
                                {% endblock input_prepend_content %}
                                {% block input_append_content %}
                                    <span class="js-quantity-up form-quantity-icon icon-48px left-line my-neg-1">
                                        {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline"} %}
                                    </span>
                                </div>
                                {% endblock input_append_content %}
                            {% endembed %}
                        </div>
                        <div class="col-7">
                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-big btn-block cart" value="{{ 'Agregar al carrito' | translate }}" />
                        </div>
                    </div>

                </form>

                {# Product share #}

                {% include 'snipplets/social/social-share.tpl' %}

                {# Product description #}

                <h5 class="font-small text-uppercase m-0 p-3 bottom-line">{{ "Descripción" | translate }}</h5>

                <div class="user-content font-small p-3">
                    <p>{{ "¡Este es un producto de ejemplo! Para poder probar el proceso de compra, debes" | translate }}
                        <a href="/admin/products" target="_top">{{ "agregar tus propios productos." | translate }}</a>
                    </p>
                </div>

                <div id="reviewsapp"></div>
            </div>
            
        </div>
    </div>  
</div>
<section id="related-products" class="section-products-related position-relative overflow-none" data-store="related-products">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <div class="col-12 bottom-line">
                <div class="row no-gutters justify-content-between mx-neg-1">
                    <div class="col-auto d-none d-md-block">
                        <div class="js-swiper-related-prev swiper-button-prev d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                    </div>
                    <div class="col">
                        <h3 class="h6 m-0 p-3 text-center">{{ "Productos relacionados" | translate }}</h3>
                    </div>
                    <div class="col-auto d-none d-md-block">
                        <div class="js-swiper-related-next swiper-button-next d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="js-swiper-related swiper-container">
                    <div class="swiper-wrapper">
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_1': true}  %}
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_2': true}  %}
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_4': true}  %}
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true}  %}
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_7': true}  %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>