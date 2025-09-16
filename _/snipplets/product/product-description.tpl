{% if product.description is not empty or settings.show_product_fb_comment_box %}
    <div class="{% if settings.full_width_description %}container-fluid p-0 top-line{% endif %}" data-store="product-description-{{ product.id }}">

        {% if settings.full_width_description %}
            <div class="row no-gutters justify-content-center">
                <div class="col-md-10 right-line-md left-line-md">
        {% endif %}

        {# Product description #}

        {% if product.description is not empty %}
            <h5 class="font-small text-uppercase m-0 p-3 bottom-line">{{ "Descripción" | translate }}</h5>
            <div class="user-content font-small p-3">
                {{ product.description }}
            </div>
        {% endif %}

        {% if settings.show_product_fb_comment_box %}
            <div class="fb-comments section-fb-comments mb-3 {% if not settings.full_width_description %}px-md-3{% endif %}" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
        {% endif %}
        <div id="reviewsapp"></div>

        {# SKU #}

        {% if settings.full_width_description %}
                </div>
            </div>
        {% endif %}

    </div>
{% endif %}
