{# Only remove this if you want to take away the theme onboarding advices #}

{% if not params.preview %}
	{% if is_theme_draft %}
		{% set admin_link = '/admin/themes/settings/draft/' %}
	{% else %}
		{% set admin_link = '/admin/themes/settings/active/' %}
	{% endif %}
{% endif %}

{# Slider that work as example #}

<section class="js-home-slider-container bottom-line" data-store="home-slider">
	<div class="section-slider p-0">
		<div class="js-home-empty-slider nube-slider-home swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide slide-container">
					{% include "snipplets/svg/help/help-slider.tpl" %}
				</div>
				<div class="swiper-slide slide-container">
					{% include "snipplets/svg/help/help-slider.tpl" %}
				</div>
				<div class="swiper-slide slide-container">
					{% include "snipplets/svg/help/help-slider.tpl" %}
				</div>
			</div>
			<div class="placeholder-overlay placeholder-slider transition-soft">
				<div class="placeholder-info">
					{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
					<div class="placeholder-description font-small-xs">
						{{ "Podés subir imágenes principales desde" | translate }} <strong>"{{ "Carrusel de imágenes" | translate }}"</strong>
					</div>
					{% if not params.preview %}
						<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
					{% endif %}
				</div>
			</div>
			<div class="js-swiper-empty-home-pagination swiper-pagination swiper-pagination-bullets d-block"></div>
		</div>
		{% snipplet 'placeholders/home-slider-placeholder.tpl' %}
	</div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home bottom-line" data-store="home-products-featured">
	<div class="container-fluid p-0 mb-neg-1">
		<div class="row no-gutters">
			<div class="col-12 bottom-line">
				<div class="row no-gutters justify-content-between">
					<div class="col">
						<h3 class="h6 m-0 p-3 text-center">{{ "Destacados" | translate }}</h3>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="row no-gutters mx-neg-1">
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_3': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
				</div>
			</div>
		</div>
	</div>
</section>

{# Categories banners that work as examples #}

<section class="section-banners-home bottom-line" data-store="home-banner-categories">
	<div class="container-fluid p-0 mb-neg-1">
		<div class="row no-gutters">
			<div class="col-md col-grid">
				<div class="textbanner right-line-md bottom-line">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text over-image">
						<div class="h6 p-3 top-line">{{ "Categoría" | translate }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés destacar categorías de tu tienda desde" | translate }} <strong>"{{ "Banners de categorías" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
			<div class="col-md col-grid">
				<div class="textbanner right-line-md right-transparent-line-md bottom-line">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text over-image">
						<div class="h6 p-3 top-line">{{ "Categoría" | translate }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés destacar categorías de tu tienda desde" | translate }} <strong>"{{ "Banners de categorías" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home bottom-line" data-store="home-products-new">
	<div class="container-fluid p-0 mb-neg-1">
		<div class="row no-gutters">
			<div class="col-12 bottom-line">
				<div class="row no-gutters justify-content-between mx-neg-1">
					<div class="col-auto d-none d-md-block">
						<div class="js-swiper-featured-demo-prev swiper-button-prev d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
					</div>
					<div class="col">
						<h3 class="h6 m-0 p-3 text-center">{{ "Novedades" | translate }}</h3>
					</div>
					<div class="col-auto d-none d-md-block">
						<div class="js-swiper-featured-demo-next swiper-button-next d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="js-swiper-featured-demo swiper-container swiper-products">
					<div class="swiper-wrapper">
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_4': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_5': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_7': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2}  %}
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Video that work as examples #}

<section class="section-video-home bottom-line" data-store="home-video">
	<div class="home-video embed-responsive embed-responsive-16by9">
		{% include "snipplets/svg/help/help-video.tpl" %}
		<div class="placeholder-overlay transition-soft">
		<div class="placeholder-info">
				{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
				<div class="placeholder-description font-small-xs">
					{{ "Podés subir tu video de YouTube desde" | translate }} <strong>"{{ "Video" | translate }}"</strong>
				</div>
				{% if not params.preview %}
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				{% endif %}
			</div>
		</div>
	</div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home bottom-line" data-store="home-products-sale">
	<div class="container-fluid p-0 mb-neg-1">
		<div class="row no-gutters">
			<div class="col-12 bottom-line">
				<div class="row no-gutters justify-content-between">
					<div class="col">
						<h3 class="h6 m-0 p-3 text-center">{{ "Ofertas" | translate }}</h3>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="row no-gutters mx-neg-1">
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_8': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
				</div>
			</div>
		</div>
	</div>
</section>

{# Promotional banners that work as examples #}

<section class="section-banners-home bottom-line" data-store="home-banner-promotional"">
	<div class="container-fluid p-0 mb-neg-1">
		<div class="row no-gutters">
			<div class="col-md col-grid">
				<div class="textbanner right-line-md bottom-line">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text over-image">
						<div class="h6 p-3 top-line">{{ "Promoción" | translate }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés mostrar tus promociones desde" | translate }} <strong>"{{ "Banners promocionales" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
			<div class="col-md col-grid">
				<div class="textbanner right-line-md right-transparent-line-md bottom-line">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text over-image">
						<div class="h6 p-3 top-line">{{ "Promoción" | translate }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés mostrar tus promociones desde" | translate }} <strong>"{{ "Banners promocionales" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Instagram feed that work as examples #}

<section class="section-instafeed-home position-relative overflow-none" data-store="home-instagram-feed">
	<div class="container-fluid p-0">
		<div class="row no-gutters bottom-line">
			<div class="col-md-2 right-line-md bottom-line bottom-no-line-md instafeed-column">
				<div class="p-3 h-100 text-center text-md-left">
					<div class="instafeed-title">
						<h3 class="h6 mb-0">@{{ 'Instagram' | translate }}</h3>
					</div>
				</div>
			</div>
			<div class="col-md-10 mb-neg-1">
				<div id="instafeed" class="row row no-gutters mx-neg-1">
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
				</div>
			</div>
		</div>
	</div>
	<div class="placeholder-overlay transition-soft">
		<div class="placeholder-info">
			{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
			<div class="placeholder-description font-small-xs">
				{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Publicaciones de Instagram" | translate }}"</strong>
			</div>
			{% if not params.preview %}
				<a href="{{ admin_link }}#instatheme=redes-sociales" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
			{% endif %}
		</div>
	</div>
</section>
