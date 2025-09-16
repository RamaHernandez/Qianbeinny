{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

{% if not mobile %}
<div class="js-home-main-slider-container {% if not has_main_slider %}hidden{% endif %}">
{% endif %}
	<div class="{% if mobile %}js-home-mobile-slider{% else %}js-home-main-slider{% endif %}-visibility {% if has_main_slider and has_mobile_slider %}{% if mobile %}d-md-none{% else %}d-none d-md-block{% endif %}{% elseif not settings.toggle_slider_mobile and mobile %}hidden{% endif %}">
		<div class="section-slider position-relative">
			<div class="js-home-slider{% if mobile %}-mobile{% endif %} nube-slider-home swiper-container swiper-container-horizontal">
				<div class="swiper-wrapper">
					{% if mobile %}
						{% set slider = settings.slider_mobile %}
					{% else %}
						{% set slider = settings.slider %}
					{% endif %}
					{% for slide in slider %}
						{% set has_text = slide.title or slide.description or slide.button %}
						<div class="swiper-slide slide-container swiper-{{ slide.color }} bottom-line">
							{% if slide.link %}
								<a href="{{ slide.link | setting_url }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
							{% endif %}
							<div class="slider-slide">

								{% set apply_lazy_load = not (loop.first and ((has_main_slider and not has_mobile_slider) or (has_mobile_slider and mobile))) %}

								{% if apply_lazy_load %}
									{% set slide_src = 'images/empty-placeholder.png' | static_url %}
								{% else %}
									{% set slide_src = slide.image | static_url | settings_image_url('large') %}
								{% endif %}

								<img 
									{% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
									{% if apply_lazy_load %}data-{% endif %}src="{{ slide_src }}"
									{% if apply_lazy_load %}data-{% endif %}srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w"  
									class="slider-image {% if settings.slider_animation %}slider-image-animation{% endif %} {% if apply_lazy_load %}swiper-lazy fade-in{% endif %}" alt="{{ 'Carrusel' | translate }} {{ loop.index }}"
								/>
								<div class="placeholder-fade"></div>
								{% if has_text %}
									<div class="swiper-text swiper-text-{{ slide.color }}">
										{% if slide.title %}
											<div class="h1-huge m-0 p-3">{{ slide.title }}</div>
										{% endif %}
										{% if slide.description or (slide.button and slide.link) %}
											<div class="row no-gutters justify-content-end{% if slide.title %} top-line{% endif %}">
												{% if slide.description %}
													<div class="col p-3">
														<p class="m-0">{{ slide.description }}</p>
													</div>
												{% endif %}
												{% if slide.button and slide.link %}
													<div class="col-auto col-btn p-3 left-line">
														<div class="btn btn-link d-inline-block">{{ slide.button }}</div>
													</div>
												{% endif %}
											</div>
										{% endif %}
									</div>
								{% endif %}
							</div>
							{% if slide.link %}
								</a>
							{% endif %}
						</div>
					{% endfor %}
				</div>
			</div>
			<div class="js-swiper-home-arrows swiper-arrows">
				<div class="js-swiper-home-control js-swiper-home-prev{% if mobile %}-mobile{% endif %} swiper-button-prev svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
				<div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
			</div>
		</div>
	</div>
{% if not mobile %}
</div>
{% endif %}