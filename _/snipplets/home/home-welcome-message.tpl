{% if settings.welcome_message or settings.welcome_text %}
	<section class="section-welcome-home bottom-line" data-store="home-welcome-message">
		<div class="container">
			<div class="row{% if settings.welcome_align == 'center' %} text-center{% endif %} justify-content-center">
				<div class="col-md-6">
					{% if settings.welcome_message %}
						<h2 class="h6 mb-4">{{ settings.welcome_message }}</h2>
					{% endif %}
					{% if settings.welcome_text %}
						<p class="mb-4">{{ settings.welcome_text }}</p>
					{% endif %}
					{% if settings.welcome_button and settings.welcome_link %}
						<a href="{{ settings.welcome_link }}" class="btn btn-link d-inline-block">{{ settings.welcome_button }}</a>
					{% endif %}
				</div>
			</div>
		</div>
	</section>
{% endif %}
