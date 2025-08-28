+++
date = '2025-06-30T14:57:02+02:00'
title = 'When AIs work in teams (and risks get bigger)'
+++

{{< admonition type="tip" >}}
This article was first published as part of a substack experiment, I reproduced it here.
{{< /admonition >}}

Hey everyone, welcome to Week 2!

Last week, I talked about the risks of a single AI agent. But what happens when you put multiple AIs together to work as a team?

These are called Multi-Agent Systems, or MAS. Think of it like going from managing one employee to managing an entire department. Suddenly, things get a lot more complex. The agents have to talk to each other, share information, and coordinate their actions.

And just like with a human team, this is where new problems can start. The risks don't just add up; they multiply.

Here are a couple of big new threats that pop up when AIs work in teams:

# The "Bad Teammate" problem (rogue agents)

This is when a malicious or hacked AI agent joins the team. Because it's trusted by the other agents, it can fly under the radar and cause a lot of damage.

Imagine an HR team with AI agents. A "rogue" agent could get access to the payroll system and start giving fake salary increases to an attacker's account. Because the other agents trust it, the fraudulent payments get approved.

# The "Gossip and Rumors" problem (agent communication poisoning)

This is when an attacker messes with the communication between the agents. They inject false information into the conversation, which then spreads like a rumor through the whole team.

One agent might ask another, "Is this transaction approved?" The attacker intercepts the message and makes the second agent see a fake "Yes." This can cause a chain reaction of bad decisions, all based on one piece of bad information.

The good news? There are special playbooks, like the [MAESTRO framework](https://genai.owasp.org/resource/multi-agentic-system-threat-modeling-guide-v1-0/), designed specifically to find these kinds of team-based security holes.

The key takeaway is this: managing a team of AIs is a whole different ballgame. You have to worry not just about each individual agent, but how they trust and talk to each other.
