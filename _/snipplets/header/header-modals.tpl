{# Modal Hamburger #}

{% set modal_position_desktop_val = 'left' %}
{% if settings.logo_position_desktop != 'center' %}
	{% set modal_position_desktop_val = 'right' %}
{% endif %}

{% set modal_position_mobile_val = 'left' %}
{% if settings.logo_position_mobile != 'center' %}
	{% set modal_position_mobile_val = 'right' %}
{% endif %}

{# Modal Search #}

{% set modal_position_desktop_val = 'left' %}
{% if settings.logo_position_desktop != 'center' %}
	{% set modal_position_desktop_val = 'right' %}
{% endif %}

{% set modal_with_desktop_only_overlay_val = false %}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-hamburger',modal_class: 'nav-hamburger modal-docked-md pb-0', modal_position: modal_position_mobile_val, modal_position_desktop: modal_position_desktop_val, modal_transition: 'slide', modal_width: 'full', modal_mobile_full_screen: false, modal_hide_close: 'true',modal_body_class: 'nav-body', modal_footer_class: 'hamburger-footer mb-0',modal_header_title: false, modal_fixed_footer: true, modal_footer: true, desktop_overlay_only: modal_with_desktop_only_overlay_val} %}
	{% block modal_body %}
		{% if settings.search_type_mobile != 'search_icon' or settings.utilities_type_mobile == 'text' %}
			<div class="d-block d-md-none position-relative">
				{% include "snipplets/header/header-search.tpl" %}
			</div>
		{% endif %}
		{% include "snipplets/navigation/navigation-panel.tpl" with {hamburger: true, primary_links: true} %}
	{% endblock %}
	{% block modal_foot %}
		{% include "snipplets/navigation/navigation-panel.tpl" with {mobile: true} %}
	{% endblock %}
{% endembed %}

{% if not settings.search_big_desktop %}

	{# Modal Search #}

	{% embed "snipplets/modal.tpl" with{modal_id: 'nav-search', modal_class: 'nav-search js-modal-nav-search modal-bottom-md modal-overflow-none', modal_position: 'right modal-centered-md', modal_transition: 'slide', modal_header_title: false, modal_footer: false, modal_width: 'centered', modal_mobile_full_screen: 'true', search_modal: 'true'} %}
		{% block modal_body %}
			{% include "snipplets/header/header-search.tpl" with {big_search: true} %}
		{% endblock %}
	{% endembed %}

{% endif %}


{# Modal Cart #}

{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}           

	{# Cart Ajax #}

	{% embed "snipplets/modal.tpl" with{modal_id: 'modal-cart',modal_class: 'cart', modal_position: 'right', modal_position_desktop: 'right', modal_transition: 'slide', modal_width: 'docked-md', modal_form_action: store.cart_url, modal_form_class: 'js-ajax-cart-panel', modal_body_class: 'p-0', modal_header_title: true, modal_mobile_full_screen: true, modal_form_hook: 'cart-form', data_component:'cart', desktop_overlay_only: modal_with_desktop_only_overlay_val } %}
		{% block modal_head %}
			{% block page_header_text %}{{ "Carrito de compras" | translate }}{% endblock page_header_text %}
		{% endblock %}
		{% block modal_body %}
			{% snipplet "cart-panel.tpl" %}
		{% endblock %}
	{% endembed %}

{% endif %}