{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_desktop_navigation = not settings.hamburger_desktop %}
{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_languages = languages | length > 1 %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}
<footer class="js-footer js-hide-footer-while-scrolling display-when-content-ready overflow-none" data-store="footer">
	<div class="container-fluid p-0">
		<div class="row no-gutters {% if template == 'password' %}justify-content-md-center top-line{% else %}bottom-line-md mr-md-neg-1{% endif %}">

			{% if has_social_network %}
				<div class="col-md{% if settings.news_show and template != 'password' %}-6{% endif %} right-line-md">
					<div class="font-small text-uppercase p-3 bottom-line {% if template == 'password' %}text-center{% endif %}">{{ 'Seguinos en' | translate }}</div>
					{% include "snipplets/social/social-links.tpl" %}
				</div>
			{% endif %}

			{% if settings.news_show and template != 'password' %}
				<div class="col-md{% if has_social_network %}-6{% endif %} right-line-md">
					{% include 'snipplets/newsletter.tpl' %}
				</div>
			{% endif %}
			
			{% if template != 'password' %}

				{# Foot Nav #}
				{% if has_footer_menu %}
					<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-md right-line-md">
						{% if settings.footer_menus_toggle %}
							<a href="#" class="js-accordion-toggle-mobile row no-gutters bottom-line">
						{% endif %}
							{% if settings.footer_menu_title %}
								<div class="font-small text-uppercase p-3 {% if settings.footer_menus_toggle %}col{% else %}bottom-line{% endif %}">{{ settings.footer_menu_title }}</div>
							{% endif %}
						{% if settings.footer_menus_toggle %}
								<div class="d-md-none col-auto icon-48px left-line">
									<span class="js-accordion-toggle-inactive">
										{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
									</span>
									<span class="js-accordion-toggle-inactive" style="display: none;">
										{% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
									</span>
								</div>
							</a>
							<div class="js-accordion-content js-accordion-content-mobile">
						{% endif %}
								{% include "snipplets/navigation/navigation-foot.tpl" %}
						{% if settings.footer_menus_toggle %}
							</div>
						{% endif %}
					</div>
				{% endif %}

				{# Foot Nav Secondary #}
				{% if has_footer_menu_secondary %}
					<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-md right-line-md">
						{% if settings.footer_menus_toggle %}
							<a href="#" class="js-accordion-toggle-mobile row no-gutters bottom-line">
						{% endif %}
							{% if settings.footer_menu_secondary_title %}
								<div class="font-small text-uppercase p-3 {% if settings.footer_menus_toggle %}col{% else %}bottom-line{% endif %}">{{ settings.footer_menu_secondary_title }}</div>
							{% endif %}
						{% if settings.footer_menus_toggle %}
								<div class="d-md-none col-auto icon-48px left-line">
									<span class="js-accordion-toggle-inactive">
										{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
									</span>
									<span class="js-accordion-toggle-inactive" style="display: none;">
										{% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
									</span>
								</div>
							</a>
							<div class="js-accordion-content js-accordion-content-mobile">
						{% endif %}
								{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
						{% if settings.footer_menus_toggle  %}
							</div>
						{% endif %}
					</div>
				{% endif %}

				{# Contact info #}
				{% if has_footer_contact_info %}
					<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-md right-line-md">
						{% if settings.footer_menus_toggle %}
							<a href="#" class="js-accordion-toggle-mobile row no-gutters bottom-line">
						{% endif %}
							{% if settings.footer_contact_title %}
								<div class="font-small text-uppercase p-3 {% if settings.footer_menus_toggle %}col{% else %}bottom-line{% endif %}">{{ settings.footer_contact_title }}</div>
							{% endif %}
						{% if settings.footer_menus_toggle %}
								<div class="d-md-none col-auto icon-48px left-line">
									<span class="js-accordion-toggle-inactive">
										{% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
									</span>
									<span class="js-accordion-toggle-inactive" style="display: none;">
										{% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-w-14 icon-lg"} %}
									</span>
								</div>
							</a>
							<div class="js-accordion-content js-accordion-content-mobile">
						{% endif %}
								{% include "snipplets/contact-links.tpl" with {footer: true} %}
						{% if settings.footer_menus_toggle %}
							</div>
						{% endif %}
					</div>
				{% endif %}

			{% endif %}

		</div>

		{% if (has_shipping_payment_logos or has_languages or has_desktop_navigation) and template != 'password' %}
			<div class="row no-gutters bottom-line text-center text-md-left">
				{# Logos Payments and Shipping #}

				{% if has_shipping_payment_logos %}
					<div class="col-md footer-payments-shipping-logos right-line-md p-2">
						{% if has_payment_logos %}
							<span class="mr-2-md">{% include "snipplets/logos-icons.tpl" with {'payments': true} %}</span>
						{% endif %}
						{% if has_shipping_logos %}
							<span>{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}</span>
						{% endif %}
					</div>
				{% endif %}

				{# Account links #}

				<div class="col-auto d-none d-md-flex right-line-md p-3">
					{% include "snipplets/header/header-utilities.tpl" with {use_account: true} %}
				</div>

				{# Language selector #}

				{% if has_languages %}
					<div class="col-md-auto {% if has_shipping_payment_logos %}p-md-3 px-3 pb-3{% else %}p-3{% endif %}">
						<a href="#" data-toggle="#languages" class="js-modal-open btn-link font-small">
							{{ "Idiomas y monedas" | translate }}
						</a>
						{% embed "snipplets/modal.tpl" with{modal_id: 'languages', modal_class: 'bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header_title: true, modal_footer: false, modal_width: 'centered', modal_zindex_top: true} %}
							{% block modal_head %}
								{{ 'Idiomas y monedas' | translate }}
							{% endblock %}
							{% block modal_body %}
								{% include "snipplets/navigation/navigation-lang.tpl" %}
							{% endblock %}
						{% endembed %}
					</div>
				{% endif %}
			</div>
		{% endif %}

		{# AFIP - EBIT - Custom Seal #}
		{% if has_seal_logos and template != 'password' %}
			<div class="row no-gutters text-center bottom-line">
				<div class="col p-3">
					{% if store.afip or ebit %}
						{% if store.afip %}
							<div class="footer-logo afip seal-afip">
								{{ store.afip | raw }}
							</div>
						{% endif %}
						{% if ebit %}
							<div class="footer-logo ebit seal-ebit">
								{{ ebit }}
							</div>
						{% endif %}
					{% endif %}
					{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
						{% if "seal_img.jpg" | has_custom_image %}
							<div class="footer-logo custom-seal">
								{% if settings.seal_url != '' %}
									<a href="{{ settings.seal_url | setting_url }}" target="_blank">
								{% endif %}
									<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
								{% if settings.seal_url != '' %}
									</a>
								{% endif %}
							</div>
						{% endif %}
						{% if settings.custom_seal_code %}
							<div class="custom-seal custom-seal-code">
								{{ settings.custom_seal_code | raw }}
							</div>
						{% endif %}
					{% endif %}
				</div>
			</div>
		{% endif %}

		<div class="row no-gutters text-center text-md-left">
			<div class="js-footer-copyright col-md font-small p-3 right-line-md">
				<div class="d-inline-block mr-md-2">
					{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
				</div>
				{{ component('claim-info', {
						container_classes: "d-md-inline-block mt-md-0 mt-3",
						divider_classes: "mx-1 d-none d-md-inline-block",
						text_classes: {text_consumer_defense: 'd-inline-block'},
						link_classes: {
							link_consumer_defense: "btn-link font-small",
							link_order_cancellation: "btn-link font-small d-md-inline-block d-block mt-3 mt-md-0 mb-2 mb-md-0 w-100 w-md-auto",
						},
					}) 
				}}
			</div>
			<div class="js-footer-powered-by col-md-auto p-md-3 px-3 pb-3">
				{#
				La leyenda que aparece debajo de esta linea de código debe mantenerse
				con las mismas palabras y con su apropiado link a Tienda Nube;
				como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
				Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
				tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
				Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
				palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
				http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
				e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
				manter visivél e com um link funcionando.
				#}
				{{ new_powered_by_link }}
			</div>
		</div>

	</div>
</footer>