<ul class="list p-3 font-small bottom-line no-line-md">
	{% for item in menus[settings.footer_menu] %}
		<li class="footer-menu-item{% if loop.last %} mb-2{% endif %}">
	        <a class="footer-menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		</li>
	{% endfor %}
</ul>