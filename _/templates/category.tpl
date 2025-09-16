{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% paginate by 24 %}
{% endif %}

{% if not show_help %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}

{% if category_banner %}
    {% include 'snipplets/category-banner.tpl' %}
{% endif %}

{% set desktop_category_controls_transparent = settings.head_fix_desktop and settings.head_transparent and settings.head_transparent_type == 'all' %}

<section class="js-category-controls-prev category-controls-sticky-detector"></section>
<div class="category-breadcrumbs-container">
	{% include "snipplets/breadcrumbs.tpl" %}
</div>
<section class="js-category-controls {% if desktop_category_controls_transparent %}js-category-controls-transparent-md category-controls-transparent-md{% endif %} category-controls transition-soft visible-when-content-ready bottom-line">
	<div class="category-controls-container">
		<div class="category-controls-row row no-gutters align-items-stretch">
			<div class="col right-line">
				{% embed "snipplets/page-header.tpl" with {'breadcrumbs': false} %}
				    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
				{% endembed %}
			</div>
			{% if products %}
				<div class="visible-when-content-ready col-auto">
					<a href="#" class="js-modal-open js-fullscreen-modal-open btn btn-link btn-filters" data-toggle="#nav-filters" data-modal-url="modal-fullscreen-filters" data-component="filter-button">
						{% if has_applied_filters %}
							<span class="js-filters-badge filters-badge"></span>
						{% endif %}
						{% include "snipplets/svg/filter.tpl" with { svg_custom_class: "icon-inline icon-lg px-1"} %}
					</a>
					{% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters', modal_body_class: 'p-0', modal_position: 'right', modal_position_desktop: 'right', modal_transition: 'slide', modal_header_title: true, modal_width: 'docked-md', modal_mobile_full_screen: 'true' } %}
						{% block modal_head %}
							{{'Filtrar por' | translate }}
						{% endblock %}
						{% block modal_body %}
							{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
							{% include 'snipplets/grid/sort-by.tpl' %}
							{% if has_filters_available %}
								{% if filter_categories is not empty %}
									{% include "snipplets/grid/categories.tpl" with {modal: true} %}
								{% endif %}
								{% if product_filters is not empty %}
							   		{% include "snipplets/grid/filters.tpl" with {modal: true} %}
							   	{% endif %}
								<div class="js-filters-overlay filters-overlay" style="display: none;">
									<div class="filters-updating-message">
										<span class="js-applying-filter h5 mr-2" style="display: none;">{{ 'Aplicando filtro' | translate }}</span>
										<span class="js-removing-filter h5 mr-2" style="display: none;">{{ 'Borrando filtro' | translate }}</span>
										<span class="js-filtering-spinner" style="display: none;">
											{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"} %}
										</span>
									</div>
								</div>
							{% endif %}
							<div class="js-sorting-overlay filters-overlay" style="display: none;">
								<div class="filters-updating-message">
									<span class="h5 mr-2">{{ 'Ordenando productos' | translate }}</span>
									<span>
										{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline h5 icon-spin svg-icon-text"} %}
									</span>
								</div>
							</div>
						{% endblock %}
					{% endembed %}
				</div>
			{% endif %}
		</div>
	</div>
</section>
{% if category.description %} 
	<p class="p-3 m-0 bottom-line">{{ category.description }}</p> 
{% endif %}

<section class="category-body overflow-none bottom-line" data-store="category-grid-{{ category.id }}">
	{% if products %}
		<div class="js-product-table row no-gutters mx-neg-1 mb-neg-1">
			{% include 'snipplets/product_grid.tpl' %}
		</div>
		{% if settings.pagination == 'infinite' %}
			{% set pagination_type_val = true %}
		{% else %}
			{% set pagination_type_val = false %}
		{% endif %}

		{% include "snipplets/grid/pagination.tpl" with {infinite_scroll: pagination_type_val} %}
	{% else %}
		<div class="h6 px-3 py-5 text-center" data-component="filter.message">
			{{(has_filters_enabled ? "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
		</div>
	{% endif %}
</section>
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}