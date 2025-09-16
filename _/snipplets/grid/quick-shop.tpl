{% if settings.quick_shop %}
    {% embed "snipplets/modal.tpl" with{modal_id: 'quickshop-modal', modal_class: 'quickshop bottom', modal_position: 'bottom', modal_transition: 'slide', modal_mobile_full_screen: true, modal_width: 'centered-md modal-centered-medium', modal_header_class: 'd-none', modal_body_class: 'p-0 modal-scrollable'} %}
        {% block modal_body %}
            <div class="js-item-product modal-scrollable modal-scrollable-area" data-product-id="">
                <div class="js-product-container js-quickshop-container js-quickshop-modal js-quickshop-modal-shell" data-variants="" data-quickshop-id="">
                    <div class="row no-gutters">
                        <div class="col-12 col-md-6 bottom-line bottom-no-line-md">
                            <div class="quickshop-image-container">
                                <div class="js-quickshop-image-padding">
                                    <img srcset="" class="js-item-image js-quickshop-img quickshop-image img-absolute-centered"/>
                                </div>
                            </div>
                        </div>
                        <div class="js-item-variants col-12 col-md-6 left-line-md">
                            <div class="js-modal-close js-fullscreen-modal-close modal-header">
                                <div class="row no-gutters align-items-center">
                                    <div class="col pl-3">
                                        <div class="js-item-name" data-store="product-item-price-{{ product.id }}"></div>
                                    </div>
                                    <div class="col-auto">
                                        <a class="js-modal-close modal-close left-line">
                                            {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="p-3 bottom-line">
                                <div class="item-price-container" data-store="product-item-price-{{ product.id }}">
                                    <span class="js-price-display h4"></span>
                                    <span class="js-compare-price-display h4 price-compare font-weight-normal"></span>
                                   {{ component('payment-discount-price', {
                                            visibility_condition: settings.payment_discount_price,
                                            location: 'product',
                                            container_classes:  "text-accent font-small mt-1",
                                            text_classes: {
                                                price: 'font-big',
                                            },
                                        }) 
                                    }}
                                </div>
                            </div>
                            {# Image is hidden but present so it can be used on cart notifiaction #}
                            
                            <div id="quickshop-form"></div>
                        </div>
                    </div>
                </div>
            </div>
        {% endblock %}
    {% endembed %}
{% endif %}