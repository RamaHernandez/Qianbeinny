{% if applied_filters %}

    {# Applied filters chips #}

    {% if has_applied_filters %}
        <div class="d-inline-block bottom-line w-100">
            {% for product_filter in product_filters %}
                {% for value in product_filter.values %}

                    {# List applied filters as tags #}
                    
                    {% if value.selected %}
                        <button class="js-remove-filter js-remove-filter-chip chip mb-neg-1" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.pill-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            {{ value.pill_label }}
                            {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline chip-remove-icon"} %}
                        </button>
                    {% endif %}
                {% endfor %}
            {% endfor %}
            <a href="#" class="js-remove-all-filters btn-link float-left mb-neg-1 px-3 py-2" data-component="filter-delete">{{ 'Borrar filtros' | translate }}</a> 
        </div>
    {% endif %}
{% else %}
    {% if product_filters is not empty %}
        
        {# Filters list #}

        <div id="filters" class="visible-when-content-ready" data-store="filters-nav">
            {% for product_filter in product_filters %}
                {% if product_filter.type == 'price' %}

                    {{ component(
                        'price-filter',
                        {'group_class': 'price-filter-container bottom-line', 'title_class': 'filter-title bottom-line', 'button_class': 'btn btn-primary btn-price-filter btn-icon chevron' }
                    ) }}

                {% else %}
                    {% if product_filter.has_products %}

                        <div class="js-accordion-container" data-store="filters-group" data-component="list.filter-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            <div class="filter-title bottom-line h6">{{product_filter.name}}</div>
                            <div class="filters-container"> 
                                {% set index = 0 %}
                                {% for value in product_filter.values %}
                                    {% if value.product_count > 0 %}
                                        {% set index = index + 1 %}

                                        <label class="js-filter-checkbox filter-item {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.option" data-component-value="{{ value.name }}">
                                            <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}/>
                                            <span class="checkbox">
                                                <span class="checkbox-icon {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}with-color{% endif %}" {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}style="background-color: {{ value.color_hexa }};"{% endif %}></span>
                                                <span class="checkbox-text">
                                                    {{ value.name }} <span class="ml-1">({{ value.product_count }})</span>
                                                </span>
                                            </span>
                                        </label>
                                        {% if index == 8 and product_filter.values_with_products > 8 %}
                                            <div class="js-accordion-content filters-container filters-container-more-items" style="display: none;">
                                        {% endif %}
                                        
                                    {% endif %}
                                    {% if loop.last and product_filter.values_with_products > 8 %}
                                        </div>
                                        <a href="#" class="js-accordion-toggle btn-link btn-more-filters top-line my-neg-1">
                                            <span class="js-accordion-toggle-inactive">{{ 'Ver todos' | translate }}</span>
                                            <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                                        </a>
                                    {% endif %}
                                {% endfor %}
                            </div>
                        </div>
                    {% endif %}
                {% endif %}
            {% endfor %}
        </div>
    {% endif %}
{% endif %}