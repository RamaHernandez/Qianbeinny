{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if not show_help %}
	{% embed "snipplets/page-header.tpl" with {container: true} %}
		{% block page_header_text %}{{ "Error" | translate }} - {{ "404" | translate }}{% endblock page_header_text %}
	{% endembed %}
{% endif %}

<section id="page-error">
	<div class="container-fluid p-0 top-line bottom-line">
		{% set related_products = sections.primary.products | take(4) | shuffle %}
		<div class="p-3 bottom-line">
			{{ "La página que estás buscando no existe." | translate }}
			{% if related_products | length > 1 %}
				<div class="mt-2">{{ "Quizás te interesen los siguientes productos." | translate }}</div>
			{% endif %}
		</div>
		{% if related_products | length > 1 %}
			<div class="section-products-related overflow-none">
				<div class="row no-gutters mx-neg-1">
					{% for related in related_products %}
						{% include 'snipplets/grid/item.tpl' with {product : related} %}
					{% endfor %}
				</div>
			</div>
		{% endif %}
	</div>
</section>

{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
	<div id="product-example">
		{% snipplet 'defaults/show_help_product.tpl' %}
	</div>
{% endif %}