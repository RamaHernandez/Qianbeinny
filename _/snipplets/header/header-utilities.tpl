{% set text_utilities = settings.utilities_type_mobile == 'text' or settings.utilities_type_desktop == 'text' %}
{% set icon_utilities = settings.utilities_type_mobile == 'icon' or settings.utilities_type_desktop == 'icon' %}
{% set text_utilities_only_mobile = settings.utilities_type_mobile == 'text' and settings.utilities_type_desktop == 'icon' %}
{% set text_utilities_only_desktop = settings.utilities_type_mobile == 'icon' and settings.utilities_type_desktop == 'text' %}
{% set merged_search_menu_icon = settings.utilities_type_mobile == 'icon' and settings.search_type_mobile == 'menu_and_search_icon' %}
{% set search_icon_only_desktop = not settings.search_big_desktop and settings.utilities_type_desktop == 'icon' and settings.utilities_type_mobile != 'icon' %}
{% set search_icon_only_mobile = (settings.search_big_desktop or (not settings.search_big_desktop and settings.utilities_type_desktop != 'icon')) and settings.utilities_type_mobile == 'icon' and settings.search_type_mobile == 'search_icon' %}

{% set show_mobile_hide_desktop_class = 'd-inline-flex d-md-none' %}
{% set show_desktop_hide_mobile_class = 'd-none d-md-inline-flex' %}

{% if use_menu %}
	<a href="#" class="js-modal-open utilities-container" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
		{% if text_utilities %}
			<span class="utilities-text {% if text_utilities_only_mobile %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if text_utilities_only_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %}">{{ 'Menú' | translate }}</span>
		{% endif %}
		{% if icon_utilities %}
			{% if not (text_utilities_only_desktop and merged_search_menu_icon) %}
				<span class="{% if text_utilities_only_mobile or merged_search_menu_icon %}{{ show_desktop_hide_mobile_class }}{% endif %} {% if text_utilities_only_desktop  %}{{ show_mobile_hide_desktop_class }}{% endif %}">
					{% include "snipplets/svg/bars.tpl" with {svg_custom_class: "icon-inline utilities-icon" }%}
				</span>
			{% endif %}
			{% if merged_search_menu_icon %}
				<span class="{{ show_mobile_hide_desktop_class }}">
					{% include "snipplets/svg/bars-search.tpl" with {svg_custom_class: "icon-inline utilities-icon" }%}
				</span>
			{% endif %}
		{% endif %}
	</a>
{% elseif use_account %}
	{% if not customer %}
		{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'mr-2 btn-link font-small') }}
		{% if 'mandatory' not in store.customer_accounts %}
			-
			{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'ml-2 btn-link font-small') }}
		{% endif %}
	{% else %}
		{% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
		{{ "¡Hola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, '', 'mr-2 btn-link font-small') }}
		-
		{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'ml-2 btn-link font-small') }}
	{% endif %}
{% elseif use_search %}
	{% if not settings.search_big_desktop or settings.search_type_mobile == 'search_icon' %}
		<a href="#" class="js-search-button js-modal-open utilities-container {% if settings.search_type_mobile == 'search_icon' and settings.search_big_desktop %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if settings.search_type_mobile != 'search_icon' and not settings.search_big_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %} left-line {% if not settings.hamburger_desktop and settings.logo_position_desktop == 'center' %}left-no-line-md right-line-md{% endif %}" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
			{% if settings.utilities_type_desktop == 'text' %}
				<span class="utilities-text {{ show_desktop_hide_mobile_class }}">{{ 'Buscar' | translate }}</span>
			{% endif %}
			{% if (not settings.search_big_desktop and settings.utilities_type_desktop == 'icon') or (settings.utilities_type_mobile == 'icon' and settings.search_type_mobile == 'search_icon') %} 
				<span class="{% if search_icon_only_mobile %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if search_icon_only_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %}">
					
					{% set utility_icon_search_classes = '' %}
					{% if settings.search_type_mobile == 'search_icon' and settings.utilities_type_mobile == 'icon' %}
						{% set utility_icon_search_classes = 'js-search-open-icon utility-icon-absolute' %}
					{% endif %}
					{% include "snipplets/svg/search.tpl" with {svg_custom_class: utility_icon_search_classes ~ " icon-inline utilities-icon"} %}

					{% if settings.search_type_mobile == 'search_icon' and settings.utilities_type_mobile == 'icon' %}
						{% include "snipplets/svg/times.tpl" with {svg_custom_class: utility_icon_search_classes ~ " icon-inline utilities-icon utility-icon-hidden"} %}
					{% endif %}
				</span>
			{% endif %}
		</a>
	{% endif %}
	{% if settings.search_big_desktop %}
		<span class="d-none d-md-flex h-100">
			{% include "snipplets/header/header-search.tpl" %}
		</span>
	{% endif %}
{% else %}
	<div id="ajax-cart" class="cart-summary" data-component='cart-button'>
		<a 
			{% if settings.ajax_cart and template != 'cart' %}
				href="#"
				data-toggle="#modal-cart" 
				data-modal-url="modal-fullscreen-cart"
			{% else %}
				href="{{ store.cart_url }}" 
			{% endif %}
			class="{% if settings.ajax_cart and template != 'cart' %}js-modal-open js-fullscreen-modal-open{% endif %} position-relative utilities-container"
			>
			{% if text_utilities %}
				<span class="{% if text_utilities_only_mobile %}{{ show_mobile_hide_desktop_class }}{% endif %} {% if text_utilities_only_desktop %}{{ show_desktop_hide_mobile_class }}{% endif %}">
					<span class="js-cart-widget-amount utilities-text mr-1">{{ "{1}" | translate(cart.items_count ) }}</span>
					<span class="js-amount-many-items utilities-text" {% if cart.items_count == '1' %}style="display: none;"{% endif %}>{{ 'Items' | translate }}</span>
					<span class="js-amount-one-item utilities-text" {% if cart.items_count != '1' %}style="display: none;"{% endif %}>{{ 'Item' | translate }}</span>
				</span>
			{% endif %}
			{% if icon_utilities %}
				<span class="position-relative {% if text_utilities_only_mobile %}{{ show_desktop_hide_mobile_class }}{% endif %} {% if text_utilities_only_desktop %}{{ show_mobile_hide_desktop_class }}{% endif %}">
					{% include "snipplets/svg/bag.tpl" with {svg_custom_class: "icon-inline utilities-icon cart-icon"} %}
					<span class="js-cart-widget-amount badge {% if cart.items_count == '0' %}d-none{% endif %}">{{ "{1}" | translate(cart.items_count ) }}</span>
				</span>
			{% endif %}
		</a>	
	</div>
{% endif %}