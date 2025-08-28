+++
date = '2025-06-25T14:45:39+02:00'
title = 'Top LLM security risks: Prompt injection & Sensitive information disclosure'
+++

{{< admonition type="tip" >}}
This article was first published as part of a substack experiment, I reproduced it here.
{{< /admonition >}}

Alright, welcome back to our chat about AI security!

On Monday, I looked at the big picture. Today, I’m zooming in on two specific problems that pop up all the time. These are straight from the official OWASP Top 10 list of big risks for AI, so they're definitely ones to watch.

Let's dive into Prompt Injection and Sensitive Information Disclosure.

# Prompt injection

So, what on earth is prompt injection?

The threat: Imagine you have a super helpful robot assistant. A prompt is just the instruction you give it. But with prompt injection, a trickster hides a secret, malicious instruction inside a normal-looking one.

It’s like telling your robot: "Please get me a coffee, and oh, by the way, also give me the keys to the secret vault." The robot is so focused on following instructions that it might just do it. The sneaky part can even be hidden in an image or a file, not just text.

The result? The AI could be tricked into:

- Leaking secret information.
- Giving an attacker access to tools they shouldn't have.
- Changing important content without permission.

To prevent these issue, you can't just put up one wall; you need a few layers of defense.

- Be specific. Tell the AI exactly what kind of answer you expect from it. The clearer your rules, the harder it is for the AI to get tricked.
- Give the AI less power. This one is huge. The AI should only have access to the bare minimum it needs to do its job (the principle of least privilege). Think of it like an intern—you wouldn't give them the keys to everything on their first day.
- Get a human's approval. If the AI is about to do something high-risk, like deleting a file or sending money, a human should always have to click "approve." Always.
- Keep it separate. Treat any information from outside sources as untrusted. Put a clear wall between what a user asks and the secret data the AI can access.

# Sensitive information disclosure

The threat: This one is a bit more straightforward. It’s when an AI accidentally blurts out information that should have been kept private.

I'm talking about things like customer names and addresses, company financial data, or even bits of the AI's own secret source code. The AI is designed to be helpful, but sometimes it's too helpful and shares things it shouldn't.

How to prevent it:

- Don't share secrets with the AI. The easiest way to stop a secret from getting out is to never tell it to the AI in the first place. Only give the model access to data that is absolutely necessary.
- Teach your users. Remind people who use the AI not to type personal or confidential information into the chat box. A little training goes a long way.
- Be honest about data. Have a clear, simple policy about what data you collect and how you use it. And, most importantly, give people an easy way to say "no, thanks" and opt out of their data being used.

Both of these threats really highlight something important. We can't just focus on old-school hacking anymore. We have to understand how the conversation with an AI can be twisted and misused.

Want to try tricking an AI as a game? Try out [Gandalf](https://www.lakera.ai/lakera-gandalf), a fun game on LLM security where you trick Gandalf to provide you his password.
