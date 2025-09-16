{% if settings.institutional_message or settings.institutional_text %}
	<section class="section-institutional-home bottom-line" data-store="home-institutional-message">
		<div class="container">
			<div class="row{% if settings.institutional_align == 'center' %} text-center{% endif %} justify-content-center">
				<div class="col-md-6">
					{% if settings.institutional_message %}
						<h2 class="h6 mb-4">{{ settings.institutional_message }}</h2>
					{% endif %}
					{% if settings.institutional_text %}
						<p class="mb-4">{{ settings.institutional_text }}</p>
					{% endif %}
					{% if settings.institutional_button and settings.institutional_link %}
						<a href="{{ settings.institutional_link }}" class="btn btn-link d-inline-block">{{ settings.institutional_button }}</a>
					{% endif %}
				</div>
			</div>
		</div>
	</section>
{% endif %}
