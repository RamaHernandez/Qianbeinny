{% if infinite_scroll %}
	{% if pages.current == 1 and not pages.is_last %}
		<div class="js-load-more text-center bottom-line mb-neg-1">
			<a class="btn btn-primary btn-big d-inline-block px-5">
				<span class="js-load-more-spinner" style="display:none;">{% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-spin"} %}</span>
				{{ 'Mostrar más productos' | t }}
			</a>
		</div>
		<div id="js-infinite-scroll-spinner" class="bottom-line py-4 text-center w-100 mb-neg-1" style="display:none">
			{% include "snipplets/svg/spinner-third.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text icon-spin"} %} 
		</div>
	{% endif %}
{% else %}
	<div class="row no-gutters justify-content-between align-items-stretch bottom-line mx-neg-1 mb-neg-1 overflow-none">
		{% if pages.numbers %}
			<div class="col-auto">
				<a {% if pages.previous %}href="{{ pages.previous }}"{% endif %} class="swiper-button-prev my-neg-1 {% if not pages.previous %}opacity-30 disabled{% endif %}">
					{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg pr-1"} %}
				</a>
			</div>
			<div class="col align-self-center">
				<div class="h4 mb-0 text-center font-weight-normal">
					{% for page in pages.numbers %}
						{% if page.selected %}
							<span>{{ page.number }}</span>
						{% endif %}
					{% endfor %}
					<span>/</span>
					<span>{{ pages.amount }}</span>
				</div>
			</div>
			<div class="col-auto">
				<a {% if pages.next %}href="{{ pages.next }}"{% endif %} class="swiper-button-next my-neg-1 {% if not pages.next %}opacity-30 disabled{% endif %}">
					{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg pl-1"} %}
				</a>
			</div>
		{% endif %}
	</div>
{% endif %}