+++
date = '2025-05-26'
title = 'How vibe coding fails'
+++

# How vibe coding fails

{{< admonition >}}
The video I am commenting on below is part of a series called [Vibe-coding in het onderwijs](https://aivoordocenten.com/vibe-coding-in-het-onderwijs/). The serie, up to this video, is great! It shows teachers how they can create small tools for their class using AI such as ChatGPT and bolt.new. Those projects had very little actual logic and complexity. The AI usage was on point!
{{< /admonition >}}

Now, check out the following video. In case you do not know any Dutch, Tom is using bolt.new to create an AI chat bot that simulates a difficult HR talk. How HR is related to education is not relevant here, the point is that he wants to show the use of a model with a frontend.

<iframe width="560" height="315" src="https://www.youtube.com/embed/I1WfyW-x5ag?si=UkvTkBN2OR2eB3GR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

The video goes quite well, until marker 11:20. Bolt has created a frontend for him and then he wants to safely store the API key for mistral. Bolt suggest using Supabase with edge functions, Tom however has heard that using `.env` files is a safe way to store keys.

Tom is not wrong, but the technology in use can not read `.env` files. In this case, if he had used the edge functions, there would not be a problem. The point however is that the complexity of the application becomes very high once you explicitly need to keep data secure, it requires you to know just enough about coding to actually make good decisions.

Anyhow, Tom asks it to use a `.env` file and Bolt does what it is asked. It creates a `.env` file and in the build process it actually incorporates it into the JavaScript files. He published the application, and anyone can try it out. For somewhat of a security measure I am not posting it here.

In the DevTools (F12 in most browsers) you can now inspect all the interaction with mistral, including the `Bearer` authorization with the API key.

[[./images/bearer-token-apikey.png]]

{{< admonition >}}
The API key has been disabled at this time. If you find one in an application on the internet, please notify its creator of the problem instead of using their AI budget for yourself.
{{< /admonition >}}
