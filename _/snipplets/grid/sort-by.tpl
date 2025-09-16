{% set sort_text = {
'user': 'Destacado',
'price-ascending': 'Precio: Menor a Mayor',
'price-descending': 'Precio: Mayor a Menor',
'alpha-ascending': 'A - Z',
'alpha-descending': 'Z - A',
'created-ascending': 'Más Viejo al más Nuevo',
'created-descending': 'Más Nuevo al más Viejo',
'best-selling': 'Más Vendidos',
} %}
<div class="filter-title bottom-line h6">{{ 'Orden' | translate }}</div>
<div class="js-sort-by-list filters-container"> 
	{% for sort_method in sort_methods %}
		{# This is done so we only show the user sorting method when the user chooses it #}
		{% if sort_method != 'user' or category.sort_method == 'user' %}
			<a href="#" class="js-apply-sort filter-item checkbox-container {% if sort_by == sort_method %}selected{% endif %}" data-sort-value="{{ sort_method }}">
				<span class="checkbox">
					<span class="checkbox-icon"></span>
					<span class="checkbox-text">
						{{ sort_text[sort_method] | t }}
					</span>
				</span>
			</a>
		{% endif %}
	{% endfor %}
</div>