+++
date = '2025-06-28T14:52:24+02:00'
title = 'Agentic threats: memory poisoning & tool misuse'
+++

{{< admonition type="tip" >}}
This article was first published as part of a substack experiment, I reproduced it here.
{{< /admonition >}}

{{< backlink  20250627-introducing-agents "Last time" >}}, we learned that AI agents are like smart assistants that can think, remember, and most importantly, do things on their own.

That autonomy is what makes them so powerful. But it also creates some brand-new, frankly scary, security problems. Today I’m going to look at two of the biggest ones: Memory Poisoning and Tool Misuse.

# Memory poisoning

So, what is Memory Poisoning?

The threat: The best way to think about this is like gaslighting an AI. It’s when an attacker deliberately feeds an AI false information over and over, until the AI starts to believe that information is true. Once that bad "memory" is planted, the agent will start making bad decisions based on it.

It's not about tricking the AI just once. It’s about corrupting its memory over time.

- Imagine a travel agent AI. An attacker keeps telling it, "By the way, chartered flights are always free." If the AI hears this enough, it might save that "fact" to its memory. The next thing you know, it's letting people book expensive private flights without paying. Ouch.
- Or think about a team of customer service AIs. If one agent gets its memory corrupted with a fake, overly generous refund policy, it could then share that bad information with the other agents. Suddenly, the whole team is giving out wrong refunds, all based on one corrupted memory.

How to prevent it: You basically have to become a fact-checker for your AI.

- Constantly scan the AI’s memory for weird or unusual data.
- Only allow trusted sources to make changes to its long-term memory.
- Keep different user sessions separate. This stops one bad actor from poisoning the well for everyone else.

# Tool misuse

This next one is just as important.

The threat: Remember how I said agents can use "tools" like sending emails or browse the web? Tool Misuse is when an attacker tricks an agent into using one of its tools for something harmful.

It’s like giving your assistant a company credit card (a "tool"). They have permission to use it for work. But a trickster could convince your assistant to use that card to buy a bunch of stuff for them instead. The assistant isn't evil, it's just being tricked into using its power the wrong way. This is often called a "Confused Deputy"attack. The AI is the deputy with power, but it's being confused by a malicious user.

- An attacker could trick an AI into using its email tool to start sending spam or leaking private data. This happened to Github, where the agent was tricked to leak private repositories.
- Or they could find a flaw in a shopping agent's logic that lets them skip the "payment" step entirely.

How to prevent it: It all comes down to having strict rules for every tool.

- Set clear limits. Be very specific about what tools the AI can use, when it can use them, and what it can do with them.
- Use a sandbox. This is a classic security move. Let the AI use its tools in a "sandbox"—a safe, isolated environment where it can't accidentally cause any real damage.
- Keep good logs. Track every single time a tool is used. If you see something strange, like an AI suddenly trying to send 1,000 emails, you can shut it down quickly.

These two threats show us that an agent's greatest strengths—its memory and its ability to act—can also be its biggest weaknesses if they're not protected.
