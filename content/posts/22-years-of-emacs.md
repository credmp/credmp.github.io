+++
title = "22 years of Emacs"
author = ["Arjen Wiersma"]
date = 2021-12-07T00:00:00+01:00
tags = ["emacs"]
categories = ["writing"]
draft = false
+++

## Where to begin... {#where-to-begin-dot-dot-dot}

I just watched David Wilson's talk called [M-x forever - why Emacs will outlast text editor trends](https://emacsconf.org/2021/talks/forever/). He gave this talk at [EmacsConf 2021](https://emacsconf.org/) which is a conference dedicated to Emacs. The talk made me reflect on my use of Emacs over the last years and then I realized that this year will mark 22 years that Emacs and I have been together. This (probably too long) article reflects on those years and dives into my use of Emacs.


### First Contact {#first-contact}

Back in 1998 I was planning a move to the US. I had just finished my first professional programming gig writing a RAS Dialer for [Freeler](https://archive.org/details/FREELER) internet, the first "free" internet provider in The Netherlands. Pretty much everyone in The Netherlands (who had a modem and tried Freeler) was using my software to connect to the service. I was programming in various languages at the time, from Delphi (for the dialer) to Perl (yes, it was popular then!). This is when I first started playing with Linux and editors like Vi and Emacs.

When I moved to the US (San Francisco) I started working for [Personify](https://blog.stevekrause.org/2005/09/personify-retrospective.html), a company focused on building an analytical platform for e-commerce sites. I started working in a small team which dealt with webserver logfile parsing. That sounds like a great job for Perl, right? My mentor worked in the same team and he guided me through the hectic time of working at a pre-2000 startup in Silicon Valley.


### Picking Emacs for life {#picking-emacs-for-life}

As I was working closely with my mentor I started picking up on things he did. He was (and probably still is) a wizard behind the keyboard. He used Emacs as his editor. Naturally I gave it a try, but found it hard to really get productive with it and so I kept switching back and forth between Vi, Emacs and several other editors. It always amazed me how quick he was in getting stuff done. One day, my mentor told me to stop and _take the time to learn my tools_.

His reasoning was that when you learn your tool well it will not impede you from completing your task. You will be able to complete it as fast as you can simply because the tool becomes an extension of your thought process and it is possible to leverage the features it has to the benefit of the task at hand. It did not matter which tool I would choose, but pick one and learn it well. I accepted the challenge of working with a single tool for 30 days and see if my work speed would improve.

I chose to use Emacs, as it allowed me to look at the things he did. The availability of information on how to best use software was not as abundant as it is now. Now you can look up anything on YouTube or any blog, back then there was the Emacs Manual and other users that I ran into during technical meetups.

Now we are 22 years later and I still use Emacs everyday for pretty much anything. It has been with me through transitioning from Windows, to macOS and since 2017 full time on Linux. It came with me when moving between continents (back to Europe) and through various jobs at different companies.


### Cheating on Emacs {#cheating-on-emacs}

I too have been tempted by new fashioned shiny tools that promised to be the next big thing in Editing. I even switched to Vim for a little while. The thing is, I always came back to Emacs. I think this is mostly due to the fact that new tools have something spectacular and then you want to adjust it and you find you can not do it to the degree that Emacs allows you to change the way it works for you.

While working with programming languages like Java the lure of IDEs has been quite tempting as well. In teams where pretty much everyone uses IntelliJ IDEA you stand out when just opening up Emacs. It often results in quite some interesting discussions as to what "makes a good developer". Some people are quite unreasonable and think an IDE makes the developer, but I greatly disagree on that topic.


### Serendipity {#serendipity}

Over the years there have been several serendipitous moments in the Emacs community for me. I will pick out 2:

-   I started sponsoring [Jonas Bernoulli](https://github.com/tarsius) in 2021 for his work on [Magit](https://github.com/magit/magit) and back in 2012 he sent in a patch for my worklog package which I only found out while preparing this article and looking at the logs of my various projects.
-   I was referenced [in a talk by Martin Clausen](https://youtu.be/DdkwNTgtIJ0?t=2429). He gave a presentation on a Clojure project and in the conclusion he talked about knowing your tools. We had been doing some live streams together working on Clojure projects and while he talked about using your tools effectively he casually dropped a "then you need to talk to this guy" and pointed my out in the crowd.


## Giving back {#giving-back}


### A YouTube series {#a-youtube-series}

In 2015/2016 I started working a little less and found time to do a Friday morning live-coding series. It featured me learning to write Clojure by building various projects. In the videos I, of course, used Emacs in pretty much every way possible.

I also created a series of videos called [Productive Emacs](https://www.youtube.com/watch?v=T1WBsI3gdDE&list=PLdKXxqwRv6_y7rHHjbrK38E59t9ost3o3) in which I highlighted useful packages (focused on Clojure development). They were a big hit (at least I think so) and connected me to wonderful people like [Mike Zamansky](https://www.youtube.com/user/mzamansky).


### Writing packages {#writing-packages}

In my time with Emacs I have written and maintained some code as well. Most notably in 2003 I took over a package for tracking time ([worklog](https://github.com/credmp/worklog)) as I had a job where I need to track my time and naturally I chose to do this in Emacs.

I also have a [grey theme](https://github.com/credmp/arjen-grey-theme/) out on [melpa](https://melpa.org/#/arjen-grey-theme) that is being used by several people. I always enjoy getting responses from the community when they like the work that has gone into making things.

Whenever I can I will post about some snippet of emacs-lisp I have written, such as my Advent of Code [helper function](../../../posts/2021-11-13-Advent-of-Code-Helper/). It retrieves the input for a puzzle during December and puts it into a file. It then prints the puzzle description and allows you to quickly get going. It is awesome to use your editor to make your life easier!


### Providing patches {#providing-patches}

One of the most meaningful things in this entire ecosystem is to give back to the projects when you can. Whenever I run into a bug or oddity I will try and fix it. When my skill-set allows it I will send in a patch or documentation update to show my appreciation for the work people do. This entire community runs on people spending their free time working on code that helps many of us.


## My configuration {#my-configuration}

Recently there was a twitter exchange with [Bozhidat Batsov](https://twitter.com/bbatsov/status/1463429044993769477) in which [Stephen A. Ramsey](https://twitter.com/stephenaramsey) calls Emacs a lifestyle choice as someone makes the remark that the people they know have been configuring Emacs as long as they have been using it.

{{< figure src="/ox-hugo/twitter.png" >}}

I too am one of those that is always tinkering with my configuration. I think it is part of having such an extensible editor and using it constantly for everything. The community keeps making amazing packages that provide entire new dimensions to the use of Emacs (hi use-package, Projectile, Counsel, Ivy, Org-Roam, Company, and many many more) that it only makes sense to be critical and try out anything that seems useful and an improvement. The ease with which it is possible to add new functions to Emacs is amazing.

I said ease, but for new users it can be quite daunting to start with a configuration. That is why projects like [Doom Emacs](https://github.com/hlissner/doom-emacs) and [Spacemacs](https://www.spacemacs.org/) are so important. I have tried both and I think the work done in them is amazing! I often go into their repositories and check out the packages they use and take snippets from their configuration.

A few years back I converted my pre-2000 `init.el` to a literal configuration using `org-mode` and `babel`. This allows you to treat your configuration as documentation and annotate it using the wonderful `org-mode`. Sadly I sometimes lack the discipline to properly annotate my configuration like [Protesilaos](https://protesilaos.com/) does.

You can still check out [my configuration](https://gitlab.com/buildfunthings/emacs-config) in its repository. The wonderful thing of having a configuration in the open is that many people take from it. It has resulted in various connections around the globe that to this day exchange ideas and experiments using my configuration as a base.


## Favorite packages {#favorite-packages}

So after all these years, there must be some favorite packages. Yes there are. It is important to note that I use Emacs for pretty much everything in my day-to-day live; from making presentations and documents in LaTeX, keeping notes and scheduling in org-mode, writing code in languages such as Java, C, Rust and Clojure and reading my Email. The list below is in no means a complete reference, but it gives a sense of what I do in my day-to-day life using Emacs.


### Org-mode and Org-Roam {#org-mode-and-org-roam}

I think [org mode](https://orgmode.org/) can be seen as one of the most influential packages in the Emacs ecosystem. For me it has taken over most of my note-taking, document processing needs.

Lets start with my daily tasks. As a teacher I have many daily things to keep track of, from work that needs reviewing, classes that need preparing and the grading of papers. To keep track of everything and not loose sight of anything I have implemented a [Getting Things Done (GTD)](https://gettingthingsdone.com/) workflow.

Anything that lives in a browser is connected to my GTD system using [org-protocol](https://orgmode.org/worg/org-contrib/org-protocol.html), anything that lives in Emacs is captured using [capture templates](https://orgmode.org/manual/Capture-templates.html). This means that anything that will take me more then 2 minutes to take care of will go into my GTD system and will be filed away with scheduling dates, deadlines and notes on the task itself. In my archive I have cleared over 10000 tasks in the current version of the system.

The article you are reading now is also an Org document. It lives in an archive called website and has an Emacs build script that generates this website in a Github Action.

As an extension to org-mode I use [org-roam](https://www.orgroam.com/) to keep track of knowledge snippets. This can be anything from development tricks, hacking methodology, background information on some technology to grading notes on papers. All this knowledge is captured in my org-mode archive and is accessible through a series of links in topic covering notes.

{{< figure src="/ox-hugo/org-mode.png" >}}


### Mu4e {#mu4e}

The use of org-mode continues into my Email. All my mail is read through [mu4e](https://www.djcbsoftware.nl/code/mu/). It seamlessly ties into my GTD workflow, its editing builds on the document processing I already do with org-mode and using various modules I can even read horrible HTML emails.

Most importantly, captures I have made from email into the GTD system will link directly to the email itself, so it is as if the system is one concise whole, making it very productive.


### Magit {#magit}

As I put everything I find of value into git repositories I tend to use [Magit](https://magit.vc/) quite a lot during the day. It has totally redefined how Emacs should do interfaces for tools and has shown the world how a good git interface can integrate into the editor. It puts anything else to shame in my opinion.

{{< figure src="/ox-hugo/magit.png" >}}


### Which-Key {#which-key}

A few years back I added [which-key](https://github.com/justbur/emacs-which-key) to my configuration after reading an article on discoverability of features. It is an amazing extension that allows you to press a key combination and it will pop-up a list of all following combinations that can be accessed from there. This greatly helps when you are trying to remember that one key sequence for that feature you don't use that often.

{{< figure src="/ox-hugo/which-key.png" >}}


### LSP / eglot {#lsp-eglot}

With the introduction of VSCode to the world Microsoft actually made something useful as well, the Language Server Protocol (LSP). The LSP is the thing that makes VSCode such a hit, it separated the editor frontend from the language understanding backend.

Emacs now has 2 LSP infrastructures, [lsp-mode](https://emacs-lsp.github.io/lsp-mode/) and [eglot](https://github.com/joaotavora/eglot). I have tried both and eventually settled on using eglot for my daily programming tasks.

The lsp-mode package is the most extensive and feature loaded of the two, it also means it has a lot of configuration to tweak it to your liking. The package also takes care of installing the needed language server for your language and sets it up automatically.

On the other hand, eglot, is bare bones and configuration-less. Just drop it in and it works after manually installing a language server. It is simple and unobtrusive, and as I do a lot of screen sharing while coding I chose it over lsp-mode.

Both packages give Emacs an IDE set of features, such as context sensitive completion, formatting of code, refactoring, organization of imports and the execution of code actions on errors and warnings. It has redefined Emacs for me when it comes to writing code.

{{< figure src="/ox-hugo/lsp.png" >}}


### Projectile {#projectile}

The last of my favorite packages is [projectile](https://projectile.mx/). As the name implies it is a tool to work with projects. As I said, I maintain a lot git repositories for anything I deem of importance. Projectile interacts with these git projects and allows you to quickly open files in the project, search them, run commands on them, switch between test and implementation code and so on.

As a productivity tool projectile makes code editing that extra bit enjoyable.


## Helpful resources {#helpful-resources}

As the community is large there are several resources I keep track of to find new features, applications and packages.

[Mastering Emacs](https://masteringemacs.org/)
: a book and website with cool and useful tricks in Emacs.

[Emacs News by Sacha Chua](https://sachachua.com/blog/category/emacs-news/)
: a weekly digest that summarizes the week of Emacs news, a great resource to read with a cup of coffee.

[Emacs Reddit](https://www.reddit.com/r/emacs/)
: the Emacs sub-reddit is extremely wonderful when it comes to sharing information. The community is great and supportive (who would say this about Reddit, right?)

YouTube
: the following channels offer a lot of information; [Protesilaos](https://www.youtube.com/c/ProtesilaosStavrou) and [System Crafters](https://www.youtube.com/c/SystemCrafters).


## Closing thoughts {#closing-thoughts}

Emacs and I have been together for 22 years now and I don't see it changing anytime soon. Emacs itself is getting better and better with initiatives such as [native-compilation](https://www.emacswiki.org/emacs/GccEmacs) and the Pure GTK patches. Its package ecosystem is in excellent condition and packages such as `org-mode` and `eglot` / `lsp-mode` make even the most demanding programming languages a joy to work with in Emacs.

Here's to another 22 years Emacs!
