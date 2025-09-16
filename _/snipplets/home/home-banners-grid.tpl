{% set banner = banner | default(false) %}
{% set banner_promotional = banner_promotional | default(false) %}
{% set banner_news = banner_news | default(false) %}

{% if banner %}
    {% set section_banner = settings.banner %}
    {% set section_title = settings.banner_title %}
    {% set section_slider = settings.banner_slider %}
    {% set section_slider_id = 'banners' %}
    {% set section_columns_desktop_4 = settings.banner_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_same_size %}
    {% set section_text_outside = settings.banner_text_outside %}
{% endif %}
{% if banner_promotional %}
    {% set section_banner = settings.banner_promotional %}
    {% set section_title = settings.banner_promotional_title %}
    {% set section_slider = settings.banner_promotional_slider %}
    {% set section_slider_id = 'banners-promotional' %}
    {% set section_columns_desktop_4 = settings.banner_promotional_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_promotional_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_promotional_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_promotional_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_promotional_same_size %}
    {% set section_text_outside = settings.banner_promotional_text_outside %}
{% endif %}
{% if banner_news %}
    {% set section_banner = settings.banner_news %}
    {% set section_title = settings.banner_news_title %}
    {% set section_slider = settings.banner_news_slider %}
    {% set section_slider_id = 'banners-news' %}
    {% set section_columns_desktop_4 = settings.banner_news_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_news_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_news_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_news_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_news_same_size %}
    {% set section_text_outside = settings.banner_news_text_outside %}
{% endif %}

<div class="container-fluid p-0 mb-neg-1">
    <div class="row no-gutters">
        {% if section_title or (section_slider and (section_banner and section_banner is not empty)) %}
            <div class="col-12 bottom-line">
                <div class="row no-gutters justify-content-between mx-neg-1">
                    {% if section_slider and (section_banner and section_banner is not empty) %}
                        <div class="col-auto d-none d-md-block">
                            <div class="js-swiper-{{ section_slider_id }}-prev swiper-button-prev d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                        </div>
                    {% endif %}
                    {% if section_title %}
                        <div class="col">
                            <h2 class="h6 p-3 text-center mb-0">{{ section_title }}</h2>
                        </div>
                    {% endif %}
                    {% if section_slider and (section_banner and section_banner is not empty) %}
                        <div class="col-auto d-none d-md-block">
                            <div class="js-swiper-{{ section_slider_id }}-next swiper-button-next d-inline-block svg-icon-text my-neg-1">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                        </div>
                    {% endif %}
                </div>
            </div>
        {% endif %}
        <div class="col-12">
            {% if section_slider %}
                <div class="js-swiper-{{ section_slider_id }} swiper-container">
                    <div class="swiper-wrapper">
            {% else %}
                <div class="row no-gutters">
            {% endif %}
            {% for slide in section_banner %}

                {% set has_banner_text = slide.title or slide.description or slide.button %}

                {% set has_banner_right_line = not section_slider and (section_columns_desktop_2 and loop.index is odd) or (section_columns_desktop_3 and not loop.index % 3 == 0) or (section_columns_desktop_4 and not loop.index % 4 == 0) %}

                <div class="{% if section_slider %}swiper-slide {% else %}col-grid {% if section_columns_desktop_4 %}col-md-3{% elseif section_columns_desktop_3 %}col-md-4{% elseif section_columns_desktop_2 %}col-md-6{% elseif section_columns_desktop_1 %}col-md-12{% endif %}{% endif %}">
                    <div class="textbanner{% if section_slider %} right-line{% elseif has_banner_right_line %} right-line-md{% endif %} bottom-line">
                        {% if slide.link %}
                            <a href="{{ slide.link | setting_url }}" class="textbanner-link" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
                        {% endif %}
                        {% if section_text_outside and slide.title %}
                            <h3 class="h6 p-3 text-center bottom-line mb-0">{{ slide.title }}</h3>
                        {% endif %}
                        <div class="textbanner-image{% if not section_same_size %} p-0{% endif %}{% if has_banner_text and not section_text_outside %} overlay{% endif %} overflow-none">
                            <img {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %} src="{% if not section_slider %}{{ 'images/empty-placeholder.png' | static_url }}{% endif %}" data-sizes="auto" data-expand="-10" data-srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="textbanner-image-effect {% if section_same_size %}textbanner-image-background{% else %}img-fluid d-block w-100{% endif %} lazyautosizes lazyload fade-in" {% if slide.title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                            <div class="placeholder-fade placeholder-banner"></div>
                        {% if section_text_outside %}
                            </div>
                        {% endif %}
                        {% if has_banner_text %}
                            <div class="textbanner-text{% if not section_text_outside %} over-image{% if section_columns_desktop_1 %} w-md-50 right-line-md{% endif %}{% endif %} {% if not section_text_outside and slide.color == 'light' %}over-image-invert{% endif %}">
                                {% if not section_text_outside and slide.title %}
                                    <h3 class="h6 p-3 top-line mb-0">{{ slide.title }}</h3>
                                {% endif %}
                                {% if slide.description or (slide.button and slide.link) %}
                                    <div class="row no-gutters justify-content-end{% if slide.title %} top-line{% endif %}">
                                        {% if slide.description %}
                                            <div class="col p-3">
                                                <div class="textbanner-paragraph">{{ slide.description }}</div>
                                            </div>
                                        {% endif %}
                                        {% if slide.button and slide.link %}
                                            <div class="col-auto col-btn p-3 left-line">
                                                <div class="btn btn-link d-inline-block">{{ slide.button }}</div>
                                            </div>
                                        {% endif %}
                                    </div>
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if not section_text_outside %}
                            </div>
                        {% endif %}
                        {% if slide.link %}
                            </a>
                        {% endif %}
                    </div>
                </div>
            {% endfor %}
            {% if section_slider %}
                    </div>
                </div>
            {% else %}
                </div>
            {% endif %}
        </div>
    </div>
</div>