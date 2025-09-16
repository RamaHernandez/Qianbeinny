{% if filter_categories %}
    <div class="filter-title bottom-line h6">{{ "Categorías" | translate }}</div>
    <div class="js-accordion-container filters-container"> 
        {% for category in filter_categories %}
            <a href="{{ category.url }}" title="{{ category.name }}" data-item="{{ loop.index }}" class="btn-link filter-item font-small no-underline p-3">{{ category.name }}</a>

            {% if loop.index == 8 and filter_categories | length > 8 %}
                <div class="js-accordion-content filters-container filters-container-more-items" style="display: none;">
            {% endif %}
            {% if loop.last and filter_categories | length > 8 %}
                </div>
                <a href="#" class="js-accordion-toggle btn-link btn-more-filters top-line my-neg-1">
                    <span class="js-accordion-toggle-inactive">{{ 'Ver más' | translate }}</span>
                    <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                </a>
            {% endif %}
        {% endfor %}
    </div>
{% endif %}