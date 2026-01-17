+++
date = '2026-01-10T22:18:54+01:00'
title = 'Self Hosting'
categories = ['hosting']
+++

Online services seem to take more and more money to use, they are also getting new features such as AI which might not be entirely what you want. I certainly do not want some random AI system training on my personal data. So I decided to start self-hosting the services that I use. I have been working on internalizing services for almost a year now, and I figured it is time to write some things down.

{{< admonition type="tip" title="My goal" >}}
My goal for this note, and its future linked notes, is to explain my entire self-hosting setup. This is a very-work-in-progress area.
{{</ admonition >}}

# What am I self hosting?

I started self-hosting my IoT devices, such as lamps. This might sound silly, but after an internet outage I was left with the situation that I was unable to control some of my devices without an internet connection. This is, of course, silly. So the first thing I self-hosted was:

- {{< backlink "home-assistant" "Home Assistant" >}}: control system for my house, integrating all smart devices and moving control of them locally.

Then I moved to my use of big tech coding forges. I use Github and Gitlab extensively, and the current move [where Github is going to charge for running your own CI](https://devclass.com/2025/12/17/github-to-charge-for-self-hosted-runners-from-march-2026/) made sure that I did not want to out-source this piece of my workflow. So I self-hosted:

- Forgejo: my own coding forge, replacing Github and Gitlab.

For my file storage (Dropbox, Google Files) I already migrated to TransIp Stack, but they also started increasing prices left and right. Sadly the price increases outpaced the usefullness of the service. So I looked for another EU based solution. I ended up at Hetzner.

- Storage Share: a Nextcloud instance for my file storage

Another interesting bit, which has been going on much longer that any of this, is that I fully run on Linux. I stopped using Windows/macOS personally. At my work I still have a mac, however I use it for work only.

- Omarchy Linux: an opinionated Arch Linux distribution.

# What is left to do?

I still need to move my github pages (this site) to its own environment. And perhaps move away from Fastmail (as they did a massive increase in cost last year).
