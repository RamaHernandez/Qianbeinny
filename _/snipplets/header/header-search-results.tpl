<ul class="search-suggest-list">
    {% set search_suggestions = products | take(6) %}
    {% for product in search_suggestions %}
        <li class="search-suggest-item container-fluid bottom-line">
            <a href="{{ product.url }}" class="search-suggest-link row no-gutters">
                <div class="search-suggest-image-container col-auto right-line">
                    {{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt, {class: 'search-suggest-image img-absolute-centered-vertically'}) }}
                </div>
                <div class="search-suggest-text col pl-2 pt-2">
                	<p class="search-suggest-name">
                		{{ product.name | highlight(query) }}
                	</p>
                    {% if product.display_price %}
                    	<p class="search-suggest-price">
                    		{{ product.price | money }}
                    	</p>
                    {% endif %}
                </div>
            </a>
        </li>
    {% endfor %}
    <div class="text-center my-3">
        <a href="#" class="js-search-suggest-all-link btn-link">{{ 'Ver todos los resultados' | translate }}</a>
    </div>
</ul>
