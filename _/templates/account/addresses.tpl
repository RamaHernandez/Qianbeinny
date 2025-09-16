{% embed "snipplets/page-header.tpl" with {container: true} %}
    {% block page_header_text %}{{ "Mis direcciones" | translate }}{% endblock page_header_text %}
{% endembed %}

<section class="account-page top-line bottom-line">
    <div class="container-fluid p-0">
        <div class="row no-gutters">      
            {% for address in customer.addresses %}

                {# User addresses listed - Main Address #}

                {% if loop.first %}
                    <div class="col-md-4 right-line-md bottom-line bottom-no-line-md mb-neg-1">
                        <h4 class="m-0 px-3 py-2 bottom-line">{{ 'Principal' | translate }}</h4>

                {# User addresses listed - Other Addresses #}

                {% elseif loop.index == 2 %}
                    <div class="col-md-8">
                        <h4 class="m-0 px-3 py-2 bottom-line">{{ 'Otras direcciones' | translate }}</h4>
                        <div class="row no-gutters">

                {% endif %}
                        {% if not loop.first %}
                            <div class="col-md-6 bottom-line right-line-md mb-neg-1">
                        {% endif %}
                                <h6 class="px-3 py-2 m-0 bottom-line">{{ address.name }} {{ 'Editar' | translate | a_tag(store.customer_address_url(address), '', 'btn-link font-weight-normal float-right') }}</h6>
                                <p class="font-small m-0 px-3 py-2">{{ address | format_address }}</p>
                        {% if not loop.first %}
                            </div>
                        {% endif %}
                {% if not loop.first and loop.last %}
                        </div>
                {% endif %}
                {% if loop.first %} 
                        <a class="btn-link mx-3 mb-3 d-inline-block" href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }}</a>
                    </div>
                {% elseif loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
        </div>
    </div>
</section>