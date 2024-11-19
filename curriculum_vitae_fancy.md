---
layout: cv
title: cv_dkeller
show:
  in_progress: false
---

{% assign exp = site.data.experience %}
{% assign mentor = site.data.mentorship %}
{% assign pub = site.data.publications %}
{% assign contact = site.data.contact %}

<div class="container">
<div class="cv">
    <div class="fancy-bar">
        <div class="row">
            <div class="col">
                Curriculum Vitae
            </div>
            <div class="col" style="text-align: right;">
                Douglas KELLER JR, PhD
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-8">
            <div class="spacer"></div>
            <h1>{{ exp.name }}</h1>
            <h2>{{ exp.title }}</h2>
            <b>{{ contact.institute }}</b>
            </br>
            <i>{{ contact.location }}</i>
            </br>
            {{ contact.email }}
            </br>
            <a href="{{ contact.website }}">{{ contact.website }}</a>
        </div>
        <div class="col" style="text-align: center;">
            <div class="big-spacer"></div>
            <img src="img/images/me_postdoc_round.png">
        </div>
    </div>
    </br>

    <!--Areas of Expertise-->

    <p><b>Active fields of research:</b>
    </br>
    {{ exp.fields }}</p>

    <hr>

    <!--Education-->

    <h2>Education</h2>
    {% for item in exp.education %}
        <h3>{{ item.type }}</h3>
        <b>{{ item.name }}</b>, {{ item.institute }}
        </br>
        <i>{{ item.date }}</i>
        </br>
        {{ item.thesis }}
        <div class="spacer"></div>
    {% endfor %}
    <hr>

    <!--Experience-->

    <h2>Research Experience</h2>

    <!--Research-->

    {% for item in exp.research %}
        <h3>{{ item.title }}</h3>
        <b>{{ item.institute }}</b>, {{ item.location }}
        </br>       
        <i>{{ item.date }}</i>
        </br>       
        {{ item.description }}
        <ul>
            {% for highlight in item.highlights %}
                <li>{{ highlight.item }}</li>
            {% endfor %}
        </ul>
        <div class="spacer"></div>
    {% endfor %}
    <hr>

    <!--Work-->

    <h2>Vocational Experience</h2>
    {% for item in exp.vocation %}
        <h3>{{ item.title }}</h3>
        <b>{{ item.institute }}</b>, {{ item.location }}
        </br>       
        {% for task in item.tasks %}
            <i>{{ task.date }}</i>
            </br>
            {{ task.description }}
            </br>
            <ul>
            {% for highlight in task.highlights %}
                <li>{{ highlight.item }}</li>
            {% endfor %}
            </ul>
        {% endfor %}
        <div class="spacer"></div>
    {% endfor %}
    <hr>

    <!--Mentorship-->

    <h2>Mentorship Experience</h2>

    <h3>Doctoral Students</h3>

    {% for student in mentor.doctoral %}
        <h4>{{ student.name }}</h4>
        <b>{{ student.institute }}</b>, {{ student.location }}
        </br>       
        <i>{{ student.date }}</i>
        </br>       
        {{ student.description }}
        <ul>
            {% for highlight in student.highlights %}
                <li>{{ highlight.item }}</li>
            {% endfor %}
        </ul>
        <div class="spacer"></div>
    {% endfor %}

    <h3>Master Students</h3>

    {% for student in mentor.master %}
        <h4>{{ student.name }}</h4>
        <b>{{ student.institute }}</b>, {{ student.location }}
        </br>       
        <i>{{ student.date }}</i>
        </br>       
        {{ student.description }}
        <ul>
            {% for highlight in student.highlights %}
                <li>{{ highlight.item }}</li>
            {% endfor %}
        </ul>
        <div class="spacer"></div>
    {% endfor %}

    <h3>Bachelor Students</h3>

    {% for student in mentor.bachelor %}
        <h4>{{ student.name }}</h4>
        <b>{{ student.institute }}</b>, {{ student.location }}
        </br>       
        <i>{{ student.date }}</i>
        </br>       
        {{ student.description }}
        <ul>
            {% for highlight in student.highlights %}
                <li>{{ highlight.item }}</li>
            {% endfor %}
        </ul>
        <div class="spacer"></div>
    {% endfor %}
    <hr>

    <!--Service-->

    <h2>Service</h2>
    {% for item in exp.service %}
        <h3>{{ item.title }}</h3>
        <b>{{ item.institute }}</b>, {{ item.location }}
        </br>       
        <i>{{ item.date }}</i>
        </br>
        {{ item.description }}
        </br>
        <div class="spacer"></div>
    {% endfor %}
    <hr>

    <!--Publications-->

    <div class="publications">
        <h2>Publications</h2>

        <h3>Published</h3>
        <ol>
            {% assign articles = pub.articles | sort: 'year' | reverse %}
            {% for article in articles %}
                <li><a href="{{ article.doi }}">{{ article.authors }} ({{ article.year }}) "{{ article.title }}," <b>{{ article.journal }}</b>, {{ article.volume }}({{ article.issue }}), {{ article.pages }}, {{ article.doi }}</a></li>
            {% endfor %}
        </ol>

        <h3>Submitted</h3>
        <ol>
            {% assign articles = pub.submitted | sort: 'year' | reverse %}
            {% for article in articles %}
                <li>{{ article.authors }} ({{ article.year }}) "{{ article.title }}," <b>{{ article.journal }}</li>
            {% endfor %}
        </ol>

        <!--Proceedings-->

        <h3>Conference Proceedings</h3>
        <ol>
            {% assign proceedings = pub.proceedings | sort: 'year' | reverse %}
            {% for proceeding in proceedings %}
            <li><a href="{{ proceeding.doi }}">{{ proceeding.authors }} ({{ proceeding.year }}) "{{ proceeding.title }}," <b>{{ proceeding.conference }}</b>, {{ proceeding.volume }}({{ proceeding.issue }}), {{ proceeding.pages }}, <i>{{ proceeding.location }}</i>, {{ proceeding.date_time }}, {{ proceeding.doi }}</a></li>
            {% endfor %}
        </ol>

        <!--Talks-->

        <h3>Presentations</h3>
        <ol>
            {% assign talks = pub.talks | sort: 'year' | reverse %}
            {% for talk in talks %}
                {% if talk.present %}
                    <li>{{ talk.authors }} ({{ talk.year }}) "{{ talk.title }}," <b>{{ talk.conference }}</b>, <i>{{ talk.location }}</i>, {{ talk.date_time }}</li>
                {% endif %}
            {% endfor %}
        </ol>

        <!--Posters-->

        <h3>Posters</h3>
        <ol>
            {% assign posters = pub.posters | sort: 'year' | reverse %}
            {% for poster in posters %}
                <li>{{ poster.authors }} ({{ poster.year }}) "{{ poster.title }}," <b>{{ poster.conference }}</b>, <i>{{ poster.location }}</i>, {{ poster.date_time }}</li>
            {% endfor %}
        </ol>

        <!--In Progress-->

        {% if page.show.in_progress %}
            <h3>In Progress</h3>
            <ul>
                {% assign works = pub.progress | sort: 'year' | reverse %}
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
    <hr>

    <!--Sports-->

    <h2>Athletic Experience</h2>
    {% for item in exp.sports %}
        <h3>{{ item.title }}</h3>
        <b>{{ item.institute }}</b>, {{ item.location }}
        </br>       
        <i>{{ item.date }}</i>
        </br>       
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

</div>

</div>
