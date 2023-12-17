---
layout: cv
title: Curriculum Vitae
show:
  in_progress: false
---

{% assign exp = site.data.experience %}

<div class="cv">
    <h1>{{ exp.name }}</h1>
    <h2>{{ exp.title }}</h2>
    <hr>

    <!--Education-->

    <h2>Education</h2>
    {% for item in exp.education %}
        <h3>{{ item.type }}</h3>
        <b>{{ item.name }}</b> <i>{{ item.date }}</i>
        </br>
        {{ item.institute }}
        </br>
        {{ item.thesis }}
    {% endfor %}
    <div class="spacer"></div>
    <hr>

    <!--Experience-->

    <h2>Research Experience</h2>

    <!--Research-->

    {% for item in exp.research %}
        <h3>{{ item.title }}</h3>
        <b>{{ item.institute }}</b>, {{ item.location }}
        <br>       
        <i>{{ item.date }}</i>
        <br>       
        {{ item.description }}
        {% for highlight in item.highlights %}
            <ul>
                <li>{{ highlight.item }}</li>
            </ul>
        {% endfor %}
        <div class="spacer"></div>
    {% endfor %}
    <div class="spacer"></div>
    <hr>

    <!--Work-->

    <h2>Vocational Experience</h2>
    {% for item in exp.vocation %}
        <h3>{{ item.title }}</h3>
        <b>{{ item.institute }}</b>, {{ item.location }}
        <br>       
        {% for task in item.tasks %}
            <i>{{ task.date }}</i>
            <br>
            {{ task.description }}
            <br>
            <ul>
            {% for highlight in task.highlights %}
                <li>{{ highlight.item }}</li>
            {% endfor %}
            </ul>
        {% endfor %}
        <div class="spacer"></div>
    {% endfor %}
    <div class="spacer"></div>
    <hr>

    <!--Sports-->

    <h2>Athletic Experience</h2>
    {% for item in exp.sports %}
        <h3>{{ item.title }}</h3>
        <b>{{ item.institute }}</b>, {{ item.location }}
        <br>       
        <i>{{ item.date }}</i>
        <br>       
        {{ item.description }}
        <div class="spacer"></div>
    {% endfor %}
    <div class="spacer"></div>
    <hr>

    <!--Skills-->

    <h2>Skills</h2>
    {% for skill in exp.skills %}
        <h3>{{ skill.name }}</h3>
        <div class="skills">
            <ul>
            {% for item in skill.list %}
                <li>{{ item.item }}</li>
            {% endfor %}
            </ul>
        </div>
    {% endfor %}
    <div class="spacer"></div>
    <hr>

    <!--Publications-->

    <div class="publications">
        <h2>Publications</h2>
        <h3>Peer Reviewed</h3>
        <ul>
            {% assign articles = site.data.publications.articles | sort: 'year' | reverse %}
            {% for article in articles %}
                <li><a href="{{ article.doi }}">{{ article.authors }} ({{ article.year }}) "{{ article.title }}," <b>{{ article.journal }}</b></a></li>
            {% endfor %}
        </ul>

        <!--Proceedings-->

        <h3>Conference Proceedings</h3>
        <ul>
            {% assign proceedings = site.data.publications.proceedings | sort: 'year' | reverse %}
            {% for proceeding in proceedings %}
            <li><a href="{{ proceeding.doi }}">{{ proceeding.authors }} ({{ proceeding.year }}) "{{ proceeding.title }}," <b>{{ proceeding.conference }}</b>, <i>{{ proceeding.location }}</i>, {{ proceeding.date_time }}</a></li>
            {% endfor %}
        </ul>

        <!--Talks-->

        <h3>Presentations</h3>
        <ul>
            {% assign talks = site.data.publications.talks | sort: 'year' | reverse %}
            {% for talk in talks %}
                <li>{{ talk.authors }} ({{ talk.year }}) "{{ talk.title }}," <b>{{ talk.conference }}</b>, <i>{{ talk.location }}</i>, {{ talk.date_time }}</li>

            {% endfor %}
        </ul>

        <!--Posters-->

        <h3>Posters</h3>
        <ul>
            {% assign posters = site.data.publications.posters | sort: 'year' | reverse %}
            {% for poster in posters %}
                <li>{{ poster.authors }} ({{ poster.year }}) "{{ poster.title }}," <b>{{ poster.conference }}</b>, <i>{{ poster.location }}</i>, {{ poster.date_time }}</li>
            {% endfor %}
        </ul>

        <!--In Progress-->

        {% if page.show.in_progress %}
            <h3>In Progress</h3>
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
        {% endif %}
    </div>
</div>
