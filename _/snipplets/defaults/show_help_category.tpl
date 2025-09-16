<section class="category-header m-0 bottom-line">
	<div class="container-fluid p-0">
		<div class="row no-gutters align-items-center">
			<div class="col p-3">
				{% embed "snipplets/page-header.tpl" with {'breadcrumbs': false} %}
					{% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
				{% endembed %}
			</div>
		</div>
	</div>
</section>
<section class="category-body overflow-none">
	<div class="container-fluid p-0">
		<div class="row no-gutters mx-neg-1">
			{% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true} %}
			{% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true} %}
			{% include 'snipplets/defaults/help_item.tpl' with {'help_item_3': true} %}
			{% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true} %}
			{% include 'snipplets/defaults/help_item.tpl' with {'help_item_5': true} %}
			{% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true} %}
			{% include 'snipplets/defaults/help_item.tpl' with {'help_item_7': true} %}
			{% include 'snipplets/defaults/help_item.tpl' with {'help_item_8': true} %}
		</div>
	</div>
</section>