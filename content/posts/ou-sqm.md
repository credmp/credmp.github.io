+++
title = "Open Universiteit: Software Quality Management"
author = ["Arjen Wiersma"]
date = 2023-03-25T16:31:00+01:00
draft = false
+++

## Background {#background}

I have been working on getting my Master's degree in Software Engineering. To do this I have started following courses at the Dutch Open Universiteit. They have a Master's program that takes 2 years and you are able to follow it from home.

As this is my first post on the courses, I will give some background. As a teacher it is recommended to have a Master's degree. As I had a whole lot of work experience my teaching activities were not a problem, but from an  overall point of view I was advised to pursue an Master degree. As my highest educational level up to now is a Bachelor I first had to follow a pre-master program before I could start the Master program. I will write about my experiences of the pre-master program later.


## Software Quality Management {#software-quality-management}

I just finished the Software Quality Management course. It was a fun course that focused on the maintainability of code and measuring objective quality metrics. As is usual in a Master you read a lot of papers on the topic, from McCabe's complexity measure to Fuggetta et al. on the evolution of the software development process. All these papers were very interesting and have given me insights into the evolution of software development. It was enlightening to offset those papers with my own experience.

Most of the papers are from the late 1990's up to the early 2010's. During that time I worked in Silicon Valley and within the Dutch startup environment. All these companies were on the frontline of new technologies and methodologies. The papers hit home most of the time. Several papers on the implementation of Scrum and how software evolves felt a bit one-sided from an academic point of view, but that did not bother me too much.


## The Rascal Programming Language {#the-rascal-programming-language}

One of the more interesting parts of the course was to write our own metric collection and visualization in the [Rascal Meta Programming Language](https://www.rascal-mpl.org/). Rascal is a domain specific language that allows you to reason about source code by building models and then querying these models.

In my group we implemented metrics collection for unit size, complexity, duplication and code coverage (testing). These were very interesting problems to attack and the result was a very cool visualization using D3js.

The project hit a happy place for me. As a result I going to work on an extension for Rascal for my Master Thesis.


## References {#references}

Some of the articles that were used in the course are listed below.

-   McCabe (1976) A Complexity Measure, IEEE Transactions on Software Engineering.
-   Fuggetta, Di Nitto (2014) Software Process, ACM.
-   Bennett, Rajlich (2000) Software Maintenance and Evolution: A Roadmap, Association for Computing Machinery.
