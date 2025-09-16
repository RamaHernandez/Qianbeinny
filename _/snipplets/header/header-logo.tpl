{% set logo_custom_class = '' %}
{% if settings.logo_position_desktop == 'left' and not settings.hamburger_desktop %}
    {% set logo_custom_class = 'right-line-md' %}
{% endif %}

{{ component('logos/logo', {container_classes: { logo_img_container: logo_custom_class, logo_text_container: logo_custom_class}, logo_img_classes: 'transition-soft', logo_text_classes: 'h3 m-0'}) }}

{% if settings.head_transparent_contrast_options and "logo-transparent.jpg" | has_custom_image %}
    {{ component('logos/logo-transparent-header', {logo_img_name: 'logo-transparent.jpg', container_classes: { logo_img_container: logo_custom_class}, logo_img_classes: 'transition-soft'}) }}
{% endif %}