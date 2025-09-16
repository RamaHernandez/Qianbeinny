{% set has_home_testimonials = false %}
{% set num_testimonials = 0 %}
{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
	{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
	{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
	{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
	{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
	{% if has_testimonial %}
		{% set has_home_testimonials = true %}
		{% set num_testimonials = num_testimonials + 1 %}
	{% endif %}
{% endfor %}

{% if has_home_testimonials %}
	<section class="section-testimonials-home" data-store="home-testimonials">
		<div class="container-fluid p-0">
			{% if settings.testimonials_title %}
				<div class="row no-gutters">
					<div class="col-12 bottom-line">
						<h2 class="h6 p-3 text-center mb-0">{{ settings.testimonials_title }}</h2>
					</div>
				</div>
			{% endif %}
			<div class="row no-gutters justify-content-center bottom-line-md">
				{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
					{% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
					{% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
					{% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
					{% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
					{% if has_testimonial %}
						<div class="col-md-4{% if not loop.last %} right-line-md{% endif %} bottom-line bottom-no-line-md{% if (num_testimonials == 1 or num_testimonials == 2) and loop.first %} left-line-md{% endif %}">
							<div class="row no-gutters">
								{% if testimonial_image %}
									<div class="col-auto right-line{% if loop.index == 2 %}-md order-2 order-md-first left-line left-no-line-md{% endif %}">
										<div class="testimonials-image">
											<img class="testimonials-image-background lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{testimonial}.jpg" | static_url | settings_image_url("small") }}' {% if testimonial_name %}alt="{{ testimonial_name }}"{% else %}alt="{{ 'Testimonio de' | translate }} {{ store.name }}"{% endif %} />
											<div class="placeholder-fade"></div>
										</div>
									</div>
								{% endif %}
								{% if testimonial_name or testimonial_description %}
									<div class="col p-3{% if loop.index == 2 %} text-right text-md-left{% endif %}">
										{% if testimonial_name %}
											<h3 class="h6 mb-2">{{ testimonial_name }}</h3>
										{% endif %}
										{% if testimonial_description %}
											<p class="font-small">{{ testimonial_description }}</p>
										{% endif %}
									</div>
								{% endif %}
							</div>
						</div>
					{% endif %}
				{% endfor %}
			</div>
		</div>
	</section>
{% endif %}
