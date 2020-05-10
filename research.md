---
layout: default
title: My Research Projects!
---

Here are the academic pursuits I... pursue.

{% assign research = site.research | sort: 'year' | reverse %}

<div class="research-container" id="research-list">
	<ul>
		{% for res in research %}
			<li>
				<h2>
					<a href="{{ res.url }}">
						{{ res.title }}
					</a>
				</h2>
				{{ res.excerpt }}
			</li>
		{% endfor %}
	</ul>
</div>
