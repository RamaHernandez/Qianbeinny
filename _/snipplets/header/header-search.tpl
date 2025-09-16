<form class="js-search-container js-search-form {% if full_width %}w-100{% endif %} {% if settings.search_big_desktop %}search-container {% if settings.logo_position_desktop == 'left' or (settings.logo_position_desktop == 'center' and settings.hamburger_desktop) %}left-line-md{% else %}right-line-md{% endif %}{% endif %}" action="{{ store.search_url }}" method="get">
    <div class="form-group mb-0 h-100">
        <input class="js-search-input form-control search-input" autocomplete="off" type="search" name="q" placeholder="{{ '¿Qué estás buscando?' | translate }}" aria-label="{{ 'Buscar' | translate }}" />
        <button type="submit" class="search-input-submit" value="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscar' | translate }}">
            {% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
        </button>
    </div>
</form>
<div class="js-search-suggest {% if big_search %}js-search-suggest-big{% endif %} search-suggest" style="display: none;">
    {# AJAX container for search suggestions #}
</div>