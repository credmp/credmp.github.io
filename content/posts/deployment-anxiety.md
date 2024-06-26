+++
title = "Deployment Anxiety"
author = ["Arjen Wiersma"]
date = 2022-11-16T00:00:00+01:00
tags = ["development"]
categories = ["writing"]
draft = false
+++

Let me tell you how it was to ship a product out to half a million people back in 1999. But before I do that, let me tell you why. Today I talked to one of my students and he mentioned that he was very nervous about a change he was making. He was afraid it would break things and that he would spend the afternoon working through his CI/CD pipeline to resolve issues.

Well, back in 1999 I worked on a project. Together with some friends we were building cool software in Borland Delphi and life was good. One of the things that we had built was a nifty dialler application that you could run on Windows. It would dial into your ISP and it made the entire process a lot easier and it made all the dealings with modems and telephone lines so much simpler. Why would we make such a thing? It was actually a commission for one of the earlier internet providers in The Netherlands. It was well received and  we made our first big bucks. It was awesome.

After finishing the project I received a call. There was a secret project in the parent company and they needed the software as well. The project turned out to be the creation of a _free_ internet provider.  The provider was Freeler. The term _free_ meant you only paid for your telephone line, but not for the service itself. It was a cool and radical idea and the parent company gave the project group 1 month to put everything into place and market it. In modern times that would be 1 sprint.

Needless to say it was a pressure cooker. In hindsight I did not really understand many of things going on, I was just focused on modifying my dialler application to do the job that was asked.  The idea was to have a CD ROM ready just before launch time. The CD ROM would then be placed at gas stations and other high traffic areas.  It had to work flawlessly. The thing with CD ROMs is that you _can't send a patch_ if something is wrong.

As I was just out of my teen years it was all quite hectic and I had never released software on this scale. So I made my changes to the application, but how do you make sure it is correct? It worked on my computer, but how do you test something like this? Well, first you need to make your CD ROM. So we built an image and sent it to the pressing company, we received a box a _few hundred testers the next day_. So, time to call all our family members? Fun fact, thanks to  people of the internet archive you can still download the CD ROM image [from them](https://archive.org/details/FREELER).

{{< figure src="/ox-hugo/freeler.png" alt="the Freeler CD ROM" width="300" >}}

After some calls and research my technical partner on the project found a laboratory that actually specialized in testing CD ROMs. It was one of the coolest things ever; they take your CD ROM and feed it to a robotized setup. In this laboratory they had hundreds of machines from various manufacturers running various versions of the Windows operating system. It was pure magic to behold.

We spent several days at the laboratory getting results. Some machines did not auto start the software, others ran into issues setting up the connections. It was an effort, but at the end of the day I fixed all the issues and a _master cd_ was made. This is basically the template from which all the copies are created.

So, now we have some tested software and a distribution medium that will work with the target audience. We are finished right? Well, no. As people use the CD ROMs they will have questions. Some people will never have dialled into the internet before, some people might not even have a modem (no, that is not a joke). So to ensure their questions are answered a call center is needed. I don't remember how big the call center was, but I do remember it was in the center of Groningen.

Given the time crunch, the deadline was only in a few days, these operators needed to be trained. They needed to be trained in working with the dialler application. So I was sent to Groningen to work with the call center. Imagine the sight; you just created an application, went to a laboratory to test it, then created a bunch (a million-ish) CD ROMs and then you wait for people to call with issues. The first time the phone rings you heart drops. "Did it not work?", "Did I miss something?".... it is not like you can go around people's house to fix the issues. Patching it is not possible, since they use the application to get onto the internet.

Luckily for me the software worked quite nicely. Freeler grew to 350.000 members. But to release this simple piece of software I spent weeks working through many painstaking processes.

So why do I tell this story? Well... having the luxury of CI/CD, instant feedback and _the ability to patch things the same minute/hour/day should be the greatest good in the world_. Be fearless, merge your changes, fix your issues, deploy without anxiety.... you will never have to see a robot feed a CD ROM to a computer in order to find out if you code works.

