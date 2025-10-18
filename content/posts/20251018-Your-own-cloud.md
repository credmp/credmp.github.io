+++
date = '2025-10-18T20:34:56+02:00'
title = 'Your Own Cloud'
+++

Over the last couple of months there is a lot of activity in Europe when it comes to moving out of the American cloud. This move is called Digital Autonomy, and there are a lot of articles on it, but I like the ones written by [Bert Hubert](https://berthub.eu).

When I am working on my own projects, or this website for that matter, I am using Github (which is owned by Microsoft). For some projects I use Gitlab, which was started in The Netherlands, but has now become an [American company](https://about.gitlab.com/blog/operating-as-gitlab-inc). Much of my development infrastructure is tied to American companies, simply because they offer the best tools for the job.

But then the discussion on digital autonomy comes in and I am thinking, "If I can not make the switch, how could anybody?", so this weekend I started working on setting up my own environment for {{< sidenote "hosting" >}}As a note of interest, to get a DevBox (with backups), costs about 9 euros on Hetzner{{< /sidenote >}} the tools I need for my software projects. I call this thing my **DevBox**. 

After some tinkering I decided on [Forgejo](https://forgejo.org) for my source control and project management, it is a reasonably complete replacement for Github and Gitlab. To make it work best it needs to be properly insulated and given certificates and things like that. To do that I installed [Traefik](https://traefik.io), it is a reverse proxy that deals with pretty much all the nitty gritty of serving applications.

Of course it is a bad idea to install everything on a box just like that, so I create an [Ansible](https://ansible.com) playbook that pulls in the various docker containers, creates networks, connects the proxy to the backend docker containers and manages configuration files.

To further test out this setup I deployed on of my in-progress projects to the box, a workshop application I am building for my workshop at [J-Fall](https://jfall.nl), the biggest single day Java conference in Europe.

Once everything turns out to be working nicely for a little while I will also migrate over my blog and then start shutting down my Github and Gitlab accounts. For me that is an enormous moment, I have had these accounts for many years, my Github dates back to 2008. 

Lets see if the box is big enough when I migrate everything in.
