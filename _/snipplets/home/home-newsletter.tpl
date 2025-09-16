{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

<section class="section-newsletter-home position-relative bottom-line overflow-none" data-store="home-newsletter">
	<div class="container-fluid p-0">
		<div class="row no-gutters">
			<div class="col-md-6{% if settings.home_news_align == 'right' %} offset-md-6{% endif %}">
				<div class="js-newsletter newsletter top-line {% if settings.home_news_align == 'left' %}right-line-md{% else %}left-line-md{% endif %}">
					{% if settings.home_news_title or settings.home_news_text %}
						<div class="p-3">
							{% if settings.home_news_title %}
								<h2 class="h6">{{ settings.home_news_title }}</h2>
							{% endif %}
							{% if settings.home_news_text %}
								<p class="mb-0">{{ settings.home_news_text }}</p>
							{% endif %}
						</div>
					{% endif %}
					{% if contact and contact.type == 'newsletter' %}
						{% if contact.success %}
							<div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
						{% else %}
							<div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
						{% endif %}
					{% endif %}
					<form class="mb-neg-1 mx-neg-1" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="home-newsletter-form">
						<div class="input-append row no-gutters right-line">
							<div class="col right-line">
								{% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Ingresá tu email...' | translate, input_group_custom_class: "mb-0", input_custom_class: "form-control-opacity",  input_aria_label: 'Email' | translate } %}
								{% endembed %}
							</div>
							<div class="col-auto">
								<div class="winnie-pooh" style="display: none;">
									<label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
									<input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
								</div>
								<input type="hidden" name="name" value="{{ 'Sin nombre' | translate }}" />
								<input type="hidden" name="message" value="{{ 'Pedido de inscripción a newsletter' | translate }}" />
								<input type="hidden" name="type" value="newsletter" />
								<input type="submit" name="contact" class="btn btn-big btn-line btn-primary" value="{{ 'Enviar' | translate }}" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	{% if "home_news_image.jpg" | has_custom_image %}
        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "home_news_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "home_news_image.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "home_news_image.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "home_news_image.jpg" | static_url | settings_image_url('1080p') }} 1920w' class='lazyload newsletter-home-image {% if "home_news_image_mobile.jpg" | has_custom_image %}d-none d-md-block{% endif %}'/>
    {% endif %}
    {% if "home_news_image_mobile.jpg" | has_custom_image %}
        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "home_news_image_mobile.jpg" | static_url | settings_image_url('large') }} 480w, {{ "home_news_image_mobile.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "home_news_image_mobile.jpg" | static_url | settings_image_url('original') }} 1024w' class="lazyload newsletter-home-image {% if "home_news_image.jpg" | has_custom_image %}d-block d-md-none{% endif %}"/>
    {% endif %}
</section>
