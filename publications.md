---
layout: default
title: My Publications
---

Virtual trees covered in ink and other things that used to be in print.

{% assign pubs = site.publications | sort: 'year' | reverse %}

<h2>Journal Articles</h2>

<div class="pub-container">
	<ul>
		{% for publication in pubs %}
			{% if publication.type == 'journal' %}
				<li>     				
					<a href="{{ publication.doi }}">
					{{ publication.authors }} ({{ publication.year }}) "{{ publication.title }}" <i>{{ publication.journal }}</i>
					</a>
				</li> 
			{% endif %}
		{% endfor %}
	</ul>
</div>

<h2>In Progress</h2>

<div class="pub-container">
	<ul>
		{% for publication in pubs %}
			{% if publication.type == 'in progress' %}
      				<li>
					{{ publication.authors }} "{{ publication.title }}"
				</li> 
			{% endif %}
		{% endfor %}
	</ul>
</div>

<h2>Talks</h2>

<div class="pub-container">
	<ul>
		{% for publication in pubs %}
			{% if publication.type == 'talk' %}
      				<li>
					{{ publication.authors }} "{{ publication.title }}" <i>{{ publication.conference }}</i> {{ publication.location }}. {{ publication.date_time }}
				</li>
			{% endif %}
		{% endfor %}
	</ul>
</div>

<h2>Posters</h2>

<div class="pub-container">
	<ul>
		{% for publication in pubs %}
			{% if publication.type == 'poster' %}
      				<li>
					{{ publication.authors }} "{{ publication.title }}" <i>{{ publication.conference }}</i> {{ publication.location }}. {{ publication.date_time }}
				</li> 
			{% endif %}
		{% endfor %}
	</ul>
</div>

<h2>Conference Proceedings</h2>

<div class="pub-container">
	<ul>
		{% for publication in pubs %}
			{% if publication.type == 'proceedings' %}
				<li>      			
					<a href="{{ publication.doi }}">
						{{ publication.authors }} "{{ publication.title }}" <i>{{ publication.conference }}</i> {{ publication.location }}. {{ publication.date_time }}
					</a>
				</li> 
			{% endif %}
		{% endfor %}
	</ul>
</div>
