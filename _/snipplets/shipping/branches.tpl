<div class="js-accordion-container js-toggle-branches">
    <a href="#" class="js-accordion-toggle row no-gutters bottom-line mb-neg-1">
        <div class="col p-3">
            <div class="font-small text-uppercase">
                {% if store.branches|length > 1 %}
                    {{ 'Nuestros locales' | translate }}
                {% else %}
                    {{ 'Nuestro local' | translate }}
                {% endif %}
            </div>
        </div>
        <div class="col-auto icon-48px left-line">
            <span class="js-accordion-toggle-inactive">
                {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
            </span>
            <span class="js-accordion-toggle-active" style="display: none;">
                {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text"} %}
            </span>
        </div>
    </a>
    <div class="js-accordion-content bottom-line" style="display: none;">
    {% if not product_detail %}
        <div class="radio-buttons-group">
    {% else %}
        <div class="list">
    {% endif %}
            <ul class="radio-button-container list-unstyled">

                {% for branch in store.branches %}
                    <li class="{% if product_detail %}list-item list-item-shipping radio-button{% else %}radio-button-item{% endif %} p-3{% if not loop.last %} bottom-dashed-line{% endif %}" data-store="branch-item-{{ branch.code }}">

                        {# If cart use radiobutton #}

                        {% if not product_detail %}
                            <label class="js-shipping-radio js-branch-radio radio-button" data-loop="branch-radio-{{loop.index}}">
                        
                                <input 
                                class="js-branch-method {% if cart.shipping_data.code == branch.code %} js-selected-shipping-method {% endif %} shipping-method" 
                                data-price="0" 
                                {% if cart.shipping_data.code == branch.code %}checked{% endif %} type="radio" 
                                value="{{branch.code}}" 
                                data-name="{{ branch.name }} - {{ branch.extra }}"
                                data-code="{{branch.code}}" 
                                data-cost="{{ 'Gratis' | translate }}"
                                name="option" 
                                style="display:none">
                                <div class="shipping-option row-fluid radio-button-content">
                                   <div class="radio-button-icons-container">
                                        <span class="radio-button-icons">
                                            <span class="radio-button-icon unchecked"></span>
                                            <span class="radio-button-icon checked"></span>
                                        </span>
                                    </div>
                        {% endif %}
                                    <div class="{% if product_detail %}list-item-content{% else %}radio-button-label{% endif %}">
                                        <div class="row no-gutters">
                                            <div class="col font-small {% if not product_detail %}pr-3{% endif %}">
                                                <div>{{ branch.name }} - {{ branch.extra }}</div>
                                            </div>
                                            <div class="col-auto text-right">
                                                <p class="text-accent mb-0 d-inline-block">{{ 'Gratis' | translate }}</p>
                                            </div>
                                        </div>
                                    </div>
                        {% if not product_detail %}
                                </div>
                            </label>
                        {% endif %}
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>