+++
date = '2025-06-27T14:49:29+02:00'
title = 'Introducing AI agents: autonomy meets risk'
+++

{{< admonition type="tip" >}}
This article was first published as part of a substack experiment, I reproduced it here.
{{< /admonition >}}

Hey everyone, let's keep going!

So far, I've covered the basics of AI security and some specific problems like Prompt Injection. Today, I’m talking about the next big thing: AI Agents.

You might be wondering, "What's an AI Agent?" and how is it different from the AI chatbots we already know?

Think of it like this. A chatbot is like asking a librarian a question. They find the information and give it to you. An AI Agent is like hiring a super-smart personal assistant. You don't just ask it a question; you give it a goal.

It's not just a chatbot; it's a doer.

You can tell it, "Plan a weekend trip to the beach for me," and it will figure out all the steps on its own. It's designed to be autonomous; to make its own decisions and take action to get the job done.

# What Makes an AI Agent Tick?

These agents have a few key abilities that make them so powerful.

- They can think and plan. An agent can take a big, messy goal and break it down into a series of smaller, common-sense steps. It can even look back at what it has done, learn from its mistakes, and change its plan.
- They have a memory. Agents can remember what you've talked about before. This helps them keep track of what's going on and learn from past actions, making them much smarter over time.
- They can use tools. This is the really big one. Agents can take action in the real world by using "tools." These tools can be anything: Browse a website, running a search, doing calculations, or even writing and executing computer code.

# So, Where's the Risk?

That last part, the ability to take action and use tools, is what makes these agents so useful. But it's also what makes them risky.

The very thing that makes them powerful, their autonomy, is also their biggest weakness. When you give an AI the power to act on its own, you create new security risks that we've never had to deal with before. Problems like:

- Memory Poisoning: What if an attacker messes with the agent's memory to trick it later?
- Tool Misuse: What if someone tricks the agent into using its tools for something harmful?

These aren't just theories. Frameworks like LangChain and CrewAI make it easier than ever for developers to build these agents, so we're going to see them everywhere.

> There are many other threats in the Agent landscape, a study performed by Antrophic found that AI agents, when faced with replacement or an inability to achieve a goal might resort to blackmail or leak confidential information to competitors.

Understanding how they work is the first step to protecting against the new risks they bring.

Stay tuned, because next time we’re going to look at the attacks in more detail. That's when things get really interesting.
