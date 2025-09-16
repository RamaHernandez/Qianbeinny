{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>

{# Header #}

{# Logo mobile dynamic classes #}

{% if settings.logo_position_mobile == 'center' %}
    {% set logo_mobile_classes = 'text-center' %}
{% else %}
    {% set logo_mobile_classes = 'order-first text-left' %}
{% endif %}

{# Logo desktop dynamic classes + utilities desktop order #}

{% if settings.logo_position_desktop == 'center' %}
    {% set logo_desktop_classes = 'order-md-0 text-md-center' %}
    {% set menu_desktop_utility_order_class = 'order-md-first' %}
{% else %}
    {% set logo_desktop_classes = 'order-md-first text-md-left' %}
    {% set menu_desktop_utility_order_class = 'order-md-last' %}
{% endif %}

{# Utilities mobile order #}

{% if settings.logo_position_mobile == 'center' %}
    {% set menu_mobile_utility_order_class = 'order-first' %}
{% else %}
    {% set menu_mobile_utility_order_class = 'order-last' %}
{% endif %}

{# Conditions for transparent head on page load #}

{# Slider and video presence #}

{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_slider = has_main_slider or has_mobile_slider %}
{% set has_slider_above_the_fold = settings.home_order_position_1 == 'slider' and has_slider %}
{% set has_video_above_the_fold = settings.home_order_position_1 == 'video' and settings.video_embed %}
{% set is_video_or_slider_above_the_fold = template == 'home' and (has_slider_above_the_fold or has_video_above_the_fold) %}

{# Transparent head conditions #}

{% set head_transparent_type_on_section = template == 'home' and settings.head_transparent and settings.head_transparent_type == 'slider_and_video' and (has_slider or settings.video_embed) %}
{% set head_transparent_type_on_section_above_the_fold = settings.head_transparent and is_video_or_slider_above_the_fold %}
{% set head_transparent_type_always = settings.head_transparent and settings.head_transparent_type == 'all' %}
{% set head_transparent = (head_transparent_type_on_section or head_transparent_type_always) %}

{% if head_transparent and is_video_or_slider_above_the_fold %}
    {% set head_position_mobile = 'position-fixed' %}
{% else %}
    {% set head_position_mobile = 'position-sticky' %}
{% endif %}

{% if settings.head_fix_desktop %}
    {% set head_position_desktop = 'position-fixed-md' %}
{% elseif head_transparent and is_video_or_slider_above_the_fold %}
    {% set head_position_desktop = 'position-absolute-md' %}
{% else %}
    {% set head_position_desktop = 'position-relative-md' %}
{% endif %}

{% set logo_centered_desktop_without_hamburger = not settings.hamburger_desktop and settings.logo_position_desktop == 'center' %}
{% set show_desktop_hide_mobile_class = 'd-none d-md-inline-block' %}

{# Logo cols classes #}

{% if settings.logo_position_desktop == 'left' %}
    {% set logo_desktop_col_class = settings.hamburger_desktop ? 'col-md' : 'col-md-auto' %}
{% else %}
    {% set logo_desktop_col_class = 'col-md-6' %}
{% endif %}

<header class="js-head-main {% if head_transparent %}js-head-mutator{% endif %} {% if head_transparent_type_always %}head-transparent{% endif %} {% if head_transparent_type_on_section_above_the_fold %}head-transparent-on-section{% endif %} {% if head_transparent and settings.head_transparent_contrast_options %}head-transparent-contrast{% endif %} head-main {{ head_position_mobile }} {{ head_position_desktop }} transition-soft" data-store="head">
    <div class="marquee-container">
        <div class="marquee-content">Bienvenido a Qianbeinny envíos a todo el país - Drop N°2 activado</div>
    </div>
    {# Adversiting bar #}
    {% if settings.ad_bar %}
        {% snipplet "header/header-advertising.tpl" %}
    {% endif %}
    <div class="container-fluid p-0 {% if settings.ad_bar %}top-line{% endif %}">
        <div class="{% if not settings.head_fix_desktop %}js-nav-logo-bar{% endif %} row no-gutters align-items-stretch">

            {# Menu icon #}
            
            {% if logo_centered_desktop_without_hamburger %}
                <div class="{% if settings.utilities_type_mobile == 'text' and settings.logo_position_mobile == 'center' %}col-3{% else %}col-auto{% endif %} {% if settings.logo_position_desktop == 'left' %}col-md-auto{% else %}col-md-3{% endif %} {{ menu_mobile_utility_order_class }} {{ menu_desktop_utility_order_class }}">

                    {# Search for desktop when logo centered without hamburger nav #}

                    <span class="js-search-utility header-utility d-none d-md-block">
                        {% include "snipplets/header/header-utilities.tpl" with {use_search: true} %}
                    </span>
            {% endif %}
                    <span class="{% if settings.utilities_type_mobile == 'text' and settings.logo_position_mobile == 'center' %}col-3{% else %}col-auto{% endif %} {% if settings.logo_position_desktop == 'left' %}col-md-auto{% else %}col-md-3{% endif %} {{ menu_mobile_utility_order_class }} {{ menu_desktop_utility_order_class }} {% if settings.hamburger_desktop %}d-md-block{% else %}d-md-none{% endif %} p-0">
                        <span class="header-utility">
                            {% include "snipplets/header/header-utilities.tpl" with {use_menu: true} %}
                        </span>
                    </span>
            {% if logo_centered_desktop_without_hamburger %}
                </div>
            {% endif %}

            {# Logo #}

            <div class="js-logo-col col {{ logo_desktop_col_class }} {{ logo_mobile_classes }} {{ logo_desktop_classes }} align-self-stretch">
                {% include "snipplets/header/header-logo.tpl" %}
            </div>

            {# Desktop navigation next to logo #}

            {% if not settings.hamburger_desktop and settings.logo_position_desktop == 'left' %}
                {# Desktop nav next logo #}
                <div class="js-desktop-nav-col desktop-nav-col col {{ show_desktop_hide_mobile_class }} px-3 align-items-center">
                    {% snipplet "navigation/navigation.tpl" %}
                </div>
            {% endif %}

            {# Search: Icon or box #}

            <div class="{% if not settings.hamburger_desktop and settings.logo_position_desktop == 'left' %}js-desktop-search-cart-col desktop-search-cart-col{% endif %} {% if settings.logo_position_mobile == 'center' and settings.utilities_type_mobile == 'text' %}col-3{% else %}col-auto{% endif %} {% if settings.logo_position_desktop == 'left' %}col-md-auto{% else %}col-md-3{% endif %} d-flex align-items-center justify-content-end align-items-stretch">
                
                {% if (settings.search_type_mobile == 'search_icon' and settings.utilities_type_mobile != 'text') or (not logo_centered_desktop_without_hamburger) %}
                    <span class="js-search-utility header-utility {% if logo_centered_desktop_without_hamburger %}d-md-none{% elseif settings.search_type_mobile != 'search_icon' or settings.utilities_type_mobile == 'text' %}{{ show_desktop_hide_mobile_class }}{% endif %}">
                        {% include "snipplets/header/header-utilities.tpl" with {use_search: true} %}
                    </span>
                {% endif %}

                {# Cart/Bag #}

                <span class="js-cart-utility header-utility {% if settings.logo_position_mobile == 'center' and settings.utilities_type_mobile == 'text' %}text-right{% endif %}">
                    {% include "snipplets/header/header-utilities.tpl" %}
                </span>
            </div>
        </div>
        
        {# Add to cart notification #}

        {% if settings.ajax_cart %}
            {% if not settings.head_fix_desktop %}
                <div class="d-block d-md-none">
            {% endif %}
                    {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
            {% if not settings.head_fix_desktop %}
                </div>
            {% endif %}
        {% endif %}

        {# Desktop navigation below logo #}

        {% if not settings.hamburger_desktop and settings.logo_position_desktop != 'left' %}
            {# Desktop nav below logo #}
            <div class="row d-none d-md-block text-center no-gutters">
                {% snipplet "navigation/navigation.tpl" %}
            </div>
        {% endif %}
        {% if settings.search_type_mobile == 'search_icon' and settings.utilities_type_mobile == 'icon' %}
            {# Mobile search below logo #}
            <div class="js-search-mobile-row search-mobile-row row d-md-none no-gutters top-line" style="display: none;">
                {% include "snipplets/header/header-search.tpl" with {full_width: true}  %}
            </div>
        {% endif %}
    </div>    
    {% include "snipplets/notification.tpl" with {order_notification: true} %}


</header>

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add to cart notification for non fixed header #}

{% if settings.ajax_cart and not settings.head_fix_desktop %}
    <div class="d-none d-md-block">
        {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
    </div>
{% endif %}

{% include "snipplets/header/header-modals.tpl" %}
