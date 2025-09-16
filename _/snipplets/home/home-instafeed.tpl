{% if settings.show_instafeed and store.instagram and store.hasInstagramToken() %}
    <section class="section-instafeed-home overflow-none" data-store="home-instagram-feed">
        <div class="container-fluid p-0">
            <div class="row no-gutters bottom-line">
                {% set instuser = store.instagram|split('/')|last %}
                <div class="col-md-2 right-line-md bottom-line bottom-no-line-md instafeed-column mb-neg-1">
                    <a target="_blank" href="{{ store.instagram }}" class="mb-0" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                        <div class="p-3 h-100 text-center text-md-left">
                            <div class="instafeed-title">
                                <h2 class="h6 mb-0">@{{ instuser }}</h2>
                                {# Instagram fallback info in case feed fails to load #}
                                <div class="js-ig-fallback">
                                    <p class="btn-link font-small mt-3 mb-0">{{ 'Ver perfil' | translate }}</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-10 mb-neg-1">
                    {% if store.hasInstagramToken() %}
                        <div class="js-ig-success row no-gutters mx-neg-1"
                            data-ig-feed
                            data-ig-items-count="6"
                            data-ig-item-class="col-4 col-md-2 right-line bottom-line"
                            data-ig-link-class="instafeed-link"
                            data-ig-image-class="instafeed-img w-100 fade-in"
                            data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}"
                            style="display: none;">
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </section>
{% endif %}