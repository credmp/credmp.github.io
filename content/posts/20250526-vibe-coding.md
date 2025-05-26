+++
date = '2025-05-26'
title = 'How vibe coding fails'
+++

# How Vibe Coding Fails

{{< admonition type="tip" title="Up to now" >}}
The video I am commenting on below is part of a series called [Vibe-coding in het onderwijs](https://aivoordocenten.com/vibe-coding-in-het-onderwijs/). So far, the series has been excellent! It shows teachers how they can create small tools for their class using AI such as ChatGPT and bolt.new. The projects featured had very little actual logic or complexity, and the use of AI was spot-on!
{{< /admonition >}}

Now, take a look at the following video. If you don't know any Dutch, Tom is using bolt.new to create an AI chatbot that simulates a difficult HR conversation. How this relates to education isn't relevant here; the point is that he wants to demonstrate the use of a model with a frontend.

{{< rawhtml >}}
<iframe width="560" height="315" src="https://www.youtube.com/embed/I1WfyW-x5ag?si=UkvTkBN2OR2eB3GR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
{{< /rawhtml >}}

The video goes well until around the 11:20 mark. Bolt has created a frontend for him, and then he wants to safely store the API key for Mistral. Bolt suggests using Supabase with edge functions, but Tom has heard that using `.env` files is a safe way to store keys.

Tom isn't wrong, but the technology in use can't read `.env` files. In this case, if he had used the edge functions, there wouldn't be a problem. The point, however, is that the complexity of the application increases significantly once you need to explicitly secure data. This requires just enough coding knowledge to make good decisions.

Anyway, Tom asks Bolt to use a `.env` file, and Bolt complies. It creates a `.env` file and incorporates it into the JavaScript files during the build process. He published the application, and anyone can try it out. For somewhat of a security measure, I'm not posting it here.

In the DevTools (F12 in most browsers), you can now inspect all interactions with Mistral, including the `Bearer` authorization with the API key.

![An exposed API key](/images/bearer-token-apikey.png)

{{< admonition type="danger">}}
The API key has been disabled at this time. If you find one in an application on the internet, please notify its creator of the problem instead of using their AI budget for yourself.
{{< /admonition >}}

I discuss these risks in my talk "Vibe-coding your way into a security nightmare". You can watch it below:

{{< rawhtml >}}
<iframe width="560" height="315" src="https://www.youtube.com/embed/AeECsaII_18?si=4kSLeZOtEuZrmYVU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
{{< /rawhtml >}}
