{% embed "snipplets/page-header.tpl" with {container: true} %}
    {% block page_header_text %}{{ "Cambiar contraseña" | translate }}{% endblock page_header_text %}
{% endembed %}

<section class="account-page top-line bottom-line">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <div class="col-md-5 right-line-md">
                <p class="p-3 bottom-line m-0">{{ 'Vamos a enviarte un email para que puedas cambiar tu contraseña.' | translate }}</p>

                {% if success %}
                    <div class="alert alert-success">{{ '¡Listo! Te enviamos un email a {1}' | translate(email) }}</div>
                {% endif %}

                {% embed "snipplets/forms/form.tpl" with{form_id: 'resetpass-form', submit_custom_class: 'btn-block', submit_text: 'Enviar email' | translate } %}
                    {% block form_body %}

                        {# Email input #}

                        {% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_for: 'email', input_value: email, input_name: 'email', input_id: 'email', input_label_text: 'Email' | translate, input_placeholder: 'ej.: tuemail@email.com' | translate } %}
                            {% block input_label_text %}{{ 'Email' | translate }}{% endblock input_label_text %}
                            {% block input_form_alert %}
                                {% if failure %}
                                    <div class="alert alert-danger">{{ 'No encontramos ninguna cuenta registrada con este email. Intentalo nuevamente chequeando que esté bien escrito.' | translate }}</div>
                                {% endif %}
                            {% endblock input_form_alert %}
                        {% endembed %}
                        
                    {% endblock %}
                {% endembed %}
            </div>
        </div>
    </div>
</section>