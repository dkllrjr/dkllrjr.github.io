---
layout: cv
title: cv_dkeller
show:
  in_progress: false
---

{% assign exp = site.data.experience %}
{% assign teach = site.data.teaching %}
{% assign mentor = site.data.mentorship %}
{% assign pub = site.data.publications %}
{% assign contact = site.data.contact %}

<div class="container">
<div class="cv">
    <div class="fancy-bar">
        <div class="row">
            <div class="col">
                Experience
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

    <!--Foreward-->

    <p><h3>Brief Summary:</h3>
    </br>
    What follows is my research and teaching experience with sections for:
    <ul>
        <li>Research experience</li>
        <li>Teaching experience</li>
        <li>Mentorship experience (PhD, Master, and Bachelor students)</li>
        <li>Service experience</li>
    </ul>
    </p>

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

    <h2>Teaching Experience</h2>
    {% for item in teach.teaching %}
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

</div>

</div>
