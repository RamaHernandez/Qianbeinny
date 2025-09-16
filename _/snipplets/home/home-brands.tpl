{% if settings.brands and settings.brands is not empty %}
	<section class="section-brands-home overflow-none" data-store="home-brands">
		<div class="container-fluid p-0">
			<div class="row no-gutters">
				{% if settings.brands_format == 'slider' or settings.brands_title %}
					<div class="col-12 bottom-line{% if settings.brands_format == 'slider' and not settings.brands_title %}-md{% endif %}">
						<div class="row no-gutters justify-content-between">
							{% if settings.brands_format == 'slider' %}
								<div class="col-auto d-none d-md-block">
									<div class="js-swiper-brands-prev swiper-button-prev d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
								</div>
							{% endif %}
							{% if settings.brands_title %}
								<div class="col">
									<h2 class="h6 p-3 text-center mb-0">{{ settings.brands_title }}</h2>
								</div>
							{% endif %}
							{% if settings.brands_format == 'slider' %}
								<div class="col-auto d-none d-md-block">
									<div class="js-swiper-brands-next swiper-button-next d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
								</div>
							{% endif %}
						</div>
					</div>
				{% endif %}
				<div class="col-12 bottom-line swiper-brands">
					{% if settings.brands_format == 'slider' %}
						<div class="js-swiper-brands swiper-container text-center">
							<div class="js-swiper-brands-wrapper swiper-wrapper">
					{% else %}
						<div class="row no-gutters mb-neg-1 mx-neg-1">
					{% endif %}
							{% for slide in settings.brands %}
								<div class="{% if settings.brands_format == 'slider' %}swiper-slide slide-container{% else %}col-md-2 col-4 bottom-line{% endif %} right-line{% if loop.first and settings.brands_format == 'grid' %} left-line{% endif %} text-center">
									{% if slide.link %}
										<a href="{{ slide.link | setting_url }}" title="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}" aria-label="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
									{% endif %}
										<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('large') }}" class="lazyload brand-image" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
									{% if slide.link %}
										</a>
									{% endif %}
								</div>
							{% endfor %}
						</div>
					{% if settings.brands_format == 'slider' %}
						</div>
					{% endif %}
				</div>
			</div>
		</div>
	</section>
{% endif %}
