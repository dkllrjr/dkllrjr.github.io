<div class="resume">

{% assign exp = site.data.experience %}

<!--Name and title-->

    <div class="name">

        <div class="name-title">
            <h1>{{ exp.name }}</h1>
            {{ exp.title }}
        </div>

    </div>

    <!--<div class="hspan"></div>-->

    <div class="flex-container">

<!--Left column-->

        <div class="left-flex-container">

            <div class="inside-left-flex-container">

<!--Contact-->

                <h2>Contact</h2>

                <div class="contact">
                    {% for item in exp.contact %}
                        <div class="contact-item">
                            <div class="{{ item.icon }}" id="contact-icon"></div>
                            <div class="contact-name">
                                {{ item.name }}
                            </div>
                        </div>
                    {% endfor %}
                </div>

                <!--<div class="left-hspan"></div>-->

<!--Education-->

                <h2>Education</h2>

                {% for item in exp.education %}

                    <div class="education-item">
                        <h3>{{ item.shorthand }}</h3>
                        <b>{{ item.name }}</b></br>
                        <div class="education-date">{{ item.date}}</div>
                    </div>

                {% endfor %}

                <!--<div class="left-hspan"></div>-->

<!--Skills-->

                <h2>Skills</h2>

                <div class="skills">
                    {% for skill in exp.skills %}
                        <h3>{{ skill.name }}</h3>
                        <ul>
                        {% for item in skill.list %}
                            <li>{{ item.item }}</li>
                        {% endfor %}
                        </ul>
                    {% endfor %}
                </div>

            </div>

        </div>

        <!--<div class="vspan-flex">-->
            <!--<div class="vspan"></div>-->
        <!--</div>-->

<!--Right column-->

        <div class="right-flex-container">

            <div class="inside-right-flex-container">

<!--Experience-->

    <!--Work-->

                <h2>Vocation</h2>

                {% for item in exp.vocation %}
                    
                    {% if item.resume %}

                        <div class="experience-item">

                            <div class="experience-head">
                                <div class="experience-title">{{ item.title }}</div>
                                <div class="experience-date">{{ item.date }}</div>
                            </div>

                            <div class="experience-institute"><i>{{ item.institute }},</i> {{ item.location }}</div>

                            <ul>
                            {% for task in item.tasks %}
                                <li>{{ task.description }}</li>
                            {% endfor %}
                            </ul>

                        </div>

                    {% endif %}

                {% endfor %}

    <!--Research-->

                <h2>Research</h2>

                {% for item in exp.research %}
                    
                    {% if item.resume %}

                        <div class="experience-item">

                            <div class="experience-head">
                                <div class="experience-title">{{ item.title }}</div>
                                <div class="experience-date">{{ item.date }}</div>
                            </div>

                            <div class="experience-institute"><i>{{ item.institute }},</i> {{ item.location }}</div>
                            <ul>
                                <li>{{ item.description }}</li>
                            </ul>
                        </div>

                    {% endif %}

                {% endfor %}
            
            </div>

<!--Publications-->
            
            <div class="inside-right-flex-container">

                <h2>Publications</h2>

                {% for item in site.data.publications.articles %}
                    
                    {% if item.resume %}

                        <div class="publications-item">

                            <div class="publications-title">{{ item.title }}</div> {{ item.year }}<br>
                            <div class="publications-author">{{ item.authors }}</div>
                        </div>

                    {% endif %}

                {% endfor %}

            </div>

<!--Interests-->

            {% if exp.interests.resume %}

                <div class="inside-right-flex-container">

                    <h2>Interests</h2>
                    {{ exp.interests.description }}

                </div>

            {% endif %}
        
        </div>

    </div>

</div>
