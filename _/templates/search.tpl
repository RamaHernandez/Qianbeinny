{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% paginate by 24 %}
{% endif %}

{% embed "snipplets/page-header.tpl" with { breadcrumbs: false, container: true } %}
	{% block page_header_text %}
		{% if products %}
			{{ 'Resultados de búsqueda' | translate }}
		{% else %}
			{{ "No encontramos nada para" | translate }}<span class="ml-2">"{{ query }}"</span>
		{% endif %}
	{% endblock page_header_text %}
{% endembed %}

<section class="category-body overflow-none bottom-line">
	{% if products %}
		<h2 class="h6 top-line p-3 mb-0 text-uppercase font-weight-normal bottom-line">
			{{ "Mostrando los resultados para" | translate }}<span class="ml-2">"{{ query }}"</span>
		</h2>
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
		<p class="top-line bottom-line px-3 py-5 mb-0 text-uppercase font-weight-normal">
			{{ "Escribilo de otra forma y volvé a intentar." | translate }}
		</p>
	{% endif %}
</section>