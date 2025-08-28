+++
date = '2025-06-23T14:40:02+02:00'
title = 'Understanding the New World of AI Security'
+++

{{< admonition type="tip" >}}
This article was first published as part of a substack experiment, I reproduced it here.
{{< /admonition >}}

Welcome to Day 1 of my guide to the important topic of Generative AI (GenAI) and Large Language Model (LLM) security.

LLMs are powerful AI systems that are being used more and more in business. They offer amazing new abilities, but they also create new security problems and risks. Old cybersecurity methods, which mainly focused on stopping hackers from breaking into computers, are not enough to protect these new systems.

# Why AI security is different and important

The fast growth of LLMs has created new risks for data security. These advanced AI systems have special weaknesses. This means we need new ways to test them and protect them.

Here are the key differences and challenges:

- Prompt injection: Attackers use tricky instructions to make the AI do something it shouldn't. Such as showing weird recipes in your vibe-coded app.
- Data leakage: The AI might accidentally share secret information. This happens to the best of us, just ask Microsoft.
- Hallucinations: The AI gives wrong information but sounds very sure it is correct. Even when you are a lawyer, AI might hallucinate.
- Agentic vulnerabilities: These are complex attacks on smart AI "agents" that use many tools and make their own decisions. This was demonstrated by Github’s agent leaking private repositories.
- Supply chain risks: Problems can come from the different steps used to create and update the AI models.

Unlike normal computer programs, AI models can sometimes act in ways we don't expect. This is especially true when they face new situations or attacks. The results are not simply "right" or "wrong." So, we must watch them closely and decide what level of error is acceptable.

AI security is needed for every step, from start to finish. This includes collecting data, training the model, testing it, using it, and finally, turning it off. We need a complete plan that covers everything.

# Helpful Guides and Methods

To handle these new threats, experts have created several guides and methods:

- OWASP Top 10 for LLM Applications: This is a famous list of the top 10 security risks for LLM applications. It is made by a community of experts to give basic advice for using LLMs safely (link).
- GenAI Red Teaming: This is like a "fire drill" for AI. Experts pretend to be attackers to find weaknesses in the AI system's security and safety. This helps find problems before real attackers do (link).
- LLMSecOps Framework: This method helps add security into every stage of building and using an LLM. It makes sure that security is a part of the whole process, not just an extra step at the end (link).
- MAESTRO Threat Modeling Framework: MAESTRO is a special method to study and find security risks in advanced AI systems where multiple AI "agents" work together. It helps security teams find and fix unique problems in these complex systems (link).

These guides give practical advice for everyone who builds and protects AI systems, including developers, system designers, and security experts. In the coming posts I will explore this vast new landscape together with you.


