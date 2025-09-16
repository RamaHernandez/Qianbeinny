{# /*============================================================================
  #Page header
==============================================================================*/

#Properties

#Title

#Breadcrumbs

#}

<section class="page-header {% if template == 'product' and settings.product_sku and product.sku %}mb-0{% endif %}" data-store="page-title">
	{% include 'snipplets/breadcrumbs.tpl' %}
	<h1 class="{% if template == 'product' %}js-product-name h2{% else %}h3{% endif %} {% if template == 'category' %}category-name{% else %}p-3{% endif %} text-uppercase" {% if template == "product" %}data-store="product-name-{{ product.id }}"{% endif %}>{% block page_header_text %}{% endblock %}</h1>
</section>
