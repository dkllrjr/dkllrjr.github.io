---
layout: default
title: Publications
---

<div class="container">
    <div class="container-publications">
        <div class="text-center">
            <!--Articles-->
            <h1>Peer Reviewed</h1>
        </div>
        <ul>
            {% assign articles = site.data.publications.articles | sort: 'year' | reverse %}
            {% for article in articles %}
                <li><a href="{{ article.doi }}">{{ article.authors }} ({{ article.year }}) "{{ article.title }}," <b>{{ article.journal }}</b></a></li>
            {% endfor %}
        </ul>
        <div class="text-center">
            <!--Proceedings-->
            <h1>Conference Proceedings</h1>
        </div>
        <ul>
            {% assign proceedings = site.data.publications.proceedings | sort: 'year' | reverse %}
            {% for proceeding in proceedings %}
            <li>{{ proceeding.authors }} ({{ proceeding.year }}) "{{ proceeding.title }}," <b>{{ proceeding.conference }}</b>, <i>{{ proceeding.location }}</i>, {{ proceeding.date_time }}</li>
            {% endfor %}
        </ul>
        <div class="text-center">
            <!--Talks-->
            <h1>Presentations</h1>
        </div>
        <ul>
            {% assign talks = site.data.publications.talks | sort: 'year' | reverse %}
            {% for talk in talks %}
                <li>{{ talk.authors }} ({{ talk.year }}) "{{ talk.title }}," <b>{{ talk.conference }}</b>, <i>{{ talk.location }}</i>, {{ talk.date_time }}</li>
            {% endfor %}
        </ul>
        <div class="text-center">
            <!--Talks-->
            <h1>Posters</h1>
        </div>
        <ul>
            {% assign posters = site.data.publications.posters | sort: 'year' | reverse %}
            {% for poster in posters %}
                <li>{{ poster.authors }} ({{ poster.year }}) "{{ poster.title }}," <b>{{ poster.conference }}</b>, <i>{{ poster.location }}</i>, {{ poster.date_time }}</li>
            {% endfor %}
        </ul>
        <div class="text-center">
            <!--In Progess-->
            <h1>In Progress</h1>
        </div>
        <ul>
            {% assign works = site.data.publications.progress | sort: 'year' | reverse %}
            {% for work in works %}
                {% if work.doi %}
                    <li><a href="{{ work.doi }}">{{ work.authors }} ({{ work.year }}) "{{ work.title }}," <b>{{ work.journal }}</b></a></li>
                {% else %}
                    <li>{{ work.authors }} ({{ work.year }}) "{{ work.title }}," <b>{{ work.journal }}</b></li>
                {% endif %}
            {% endfor %}
        </ul>
    </div>
</div>
