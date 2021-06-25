---
layout: resume
---
<div class="resume">

{% assign exp = site.data.experience %}

    <div class="hspan-big"></div>

    <div class="name">

        <div class="img-flex">
            <img src="/img/logo/AK_Researcher_zoomed_logo.png">
            </img>
        </div>

        <div class="name-title">
            <h1>{{ exp.name }}</h1>
            {{ exp.title }}
        </div>

    </div>

    <div class="hspan"></div>

    <div class="flex-container">

        <div class="left-flex-container">

            <div class="inside-left-flex-container">
                
                <h2>Contact</h2>

                <div class="contact">
                    {% for item in exp.contact %}
                        <div class="contact-item">
                            <div class="contact-icon">
                                <img class="contact-icon-img" src="{{ item.icon }}">
                                </img>
                            </div>
                            <div class="contact-name">
                                {{ item.name }}
                            </div>
                        </div>
                    {% endfor %}
                </div>
                
                <div class="left-hspan"></div>

                <h2>Education</h2>

                {% for item in exp.education %}

                    <div class="education-item">
                        <h3>{{ item.name }}</h3><br>
                        {{ item.date}}
                    </div>

                {% endfor %}

                <div class="left-hspan"></div>

                <h2>Skills</h2>

            </div>

        </div>

        <div class="vspan-flex">
            <div class="vspan"></div>
        </div>

        <div class="right-flex-container">

            <div class="inside-right-flex-container">

                <h2>Motivation</h2>
                
                {{ exp.motivation }}

                <div class="right-hspan"></div>

                <h2>Experience</h2>

            </div>
        
        </div>

    </div>

</div>
