{% if home_main_product %}
	{% set has_multiple_slides = product.images_count > 1 %}
{% else %}
	{% set has_multiple_slides = product.images_count > 1 or product.video_url %}
{% endif %}
{% set two_images_per_row = settings.product_image_format != 'slider' and settings.product_image_grid == '2' and product.images_count > 1 %}
{% set one_images_per_row = settings.product_image_format != 'slider' and settings.product_image_grid == '1' and product.images_count > 1 %}
<div class="mb-neg-1" data-store="product-image-{{ product.id }}"> 
	{% if product.images_count > 0 %}
		<div class="product-image-container position-relative bottom-line">
			<div class="js-swiper-product swiper-container {% if settings.product_image_format != 'slider' and not home_main_product %} product-detail-slider{% endif %}" style="visibility:hidden; height:0;" data-product-images-amount="{{ product.images_count }}">
				{% include 'snipplets/labels.tpl' with {'product_detail': true, 'shipping': true} %}
				<div class="swiper-wrapper">
					{% for image in product.images %}
					 <div class="js-product-slide swiper-slide{% if settings.product_image_format == 'slider' or home_main_product %} product-slide{% if home_main_product %}-small{% endif %} h-auto{% endif %} slider-slide {% if not home_main_product %}{% if two_images_per_row %}col-md-6 p-0 bottom-line-md{% if loop.index is even %} right-transparent-line-md{% endif %}{% endif %} {% endif %} right-line{% if loop.last %} right-transparent-line{% endif %}{% if one_images_per_row %} right-transparent-line-md {% if not loop.last %}bottom-line-md{% endif %}{% endif %} {% if product.images_count == 1 %} right-line-md left-line-md{% endif %}" data-image="{{image.id}}" data-image-position="{{loop.index0}}">
						{% if home_main_product %}
							<div class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
						{% else %}
							<a href="{{ image | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
						{% endif %}
							<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w, {{  image | product_image_url('original') }} 1024w' data-sizes="auto" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
							<img src="{{ image | product_image_url('tiny') }}" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
						{% if home_main_product %}
							</div>
						{% else %}
							</a>
						{% endif %}
					</div>
					{% endfor %}
					{% if not home_main_product %}
						{% include 'snipplets/product/product-video.tpl' %}
					{% endif %}
				</div>
			</div>
			{% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
			{% if has_multiple_slides %}
				<div class="swiper-arrows d-none{% if settings.product_image_format == 'slider' or home_main_product %} d-md-block{% endif %} mx-neg-1 mb-neg-1">
					<div class="js-swiper-product-prev swiper-button-prev d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
					<div class="js-swiper-product-next swiper-button-next d-inline-block svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
				</div>
				<div class="product-paginator {% if not home_main_product and settings.product_image_format != 'slider' %}d-md-none{% endif %}">
					<div class="js-swiper-product-pagination swiper-pagination-fraction font-small d-inline-block"></div>
				</div>
			{% endif %}
		</div>
	{% endif %}
</div>