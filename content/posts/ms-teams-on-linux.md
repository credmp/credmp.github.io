+++
title = "Microsoft Teams (v2) on Linux"
author = ["Arjen Wiersma"]
date = 2024-04-01T10:29:00+02:00
draft = false
+++

This post is just a small note for those of you who also run Microsoft Teams on Linux through their browser and now receive a note "your browser does not meet the requirements for the new Teams". It turns out that the client is looking at the user-agent string to determine which browsers it accepts, and which not.

So, if you have the message, install an user-agent switcher and select a common browser on a common OS (from the MS perspective) and you will suddenly meet the requirements.
