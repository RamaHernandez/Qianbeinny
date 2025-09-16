{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}

{% set featured_products = featured_products | default(false) %}
{% set new_products = new_products | default(false) %}
{% set sale_products = sale_products | default(false) %}

{# Check if slider is used #}

{% set has_featured_products_and_slider = featured_products and settings.featured_products_format == 'slider' %}
{% set has_new_products_and_slider = new_products and settings.new_products_format == 'slider' %}
{% set has_sale_products_and_slider = sale_products and settings.sale_products_format == 'slider' %}
{% set use_slider = has_featured_products_and_slider or has_new_products_and_slider or has_sale_products_and_slider %}

{% if featured_products %}
    {% set sections_products = sections.primary.products %}
    {% set section_name = 'primary' %}
    {% set section_columns_desktop = settings.featured_products_desktop %}
    {% set section_columns_mobile = settings.featured_products_mobile %}
    {% set section_slider = settings.featured_products_format == 'slider' %}
    {% set section_title = settings.featured_products_title %}
{% endif %}
{% if new_products %}
    {% set sections_products = sections.new.products %}
    {% set section_name = 'new' %}
    {% set section_columns_desktop = settings.new_products_desktop %}
    {% set section_columns_mobile = settings.new_products_mobile %}
    {% set section_slider = settings.new_products_format == 'slider' %}
    {% set section_title = settings.new_products_title %}
{% endif %}
{% if sale_products %}
    {% set sections_products = sections.sale.products %}
    {% set section_name = 'sale' %}
    {% set section_columns_desktop = settings.sale_products_desktop %}
    {% set section_columns_mobile = settings.sale_products_mobile %}
    {% set section_slider = settings.sale_products_format == 'slider' %}
    {% set section_title = settings.sale_products_title %}
{% endif %}

<div class="container-fluid p-0 mb-neg-1">
    <div class="row no-gutters">
        {% if section_slider or section_title %}
            <div class="col-12 bottom-line{% if section_slider and not section_title %}-md{% endif %}">
                <div class="row no-gutters justify-content-between{% if use_slider %} mx-neg-1{% endif %}">
                    {% if use_slider %}
                        <div class="col-auto d-none d-md-block">
                            <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %}-prev swiper-button-prev d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                        </div>
                    {% endif %}
                    {% if section_title %}
                        <div class="col">
                            <h2 class="h6 m-0 p-3 text-center">{{ section_title }}</h2>
                        </div>
                    {% endif %}
                    {% if use_slider %}
                        <div class="col-auto d-none d-md-block">
                            <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %}-next swiper-button-next d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                        </div>
                    {% endif %}
                </div>
            </div>
        {% endif %}
        <div class="col-12">
            {% if use_slider %}
                <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %} swiper-container mx-neg-1">
                    <div class="swiper-wrapper left-line">
            {% else %}
                <div class="row no-gutters mx-neg-1">
            {% endif %}

            {% for product in sections_products %}
                {% if use_slider %}
                    {% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'section_name': section_name, 'section_columns_desktop': section_columns_desktop, 'section_columns_mobile': section_columns_mobile } %}
                {% else %}
                    {% include 'snipplets/grid/item.tpl' %}
                {% endif %}
            {% endfor %}

            {% if use_slider %}
                    </div>
                </div>
            {% else %}
                </div>
            {% endif %}
        </div>

        {% if show_help %}
            {% for i in 1..4 %}
                {% if loop.index % 4 == 1 %}
                    <div class="grid-row">
                {% endif %}

                <div class="span3">
                    <div class="item">
                        <div class="item-image-container">
                            <a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                        </div>
                        <div class="item-info-container">
                            <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                            <div class="price">{{"$0.00" | translate}}</div>
                        </div>
                    </div>
                </div>

                {% if loop.index % 4 == 0 or loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
</div>
