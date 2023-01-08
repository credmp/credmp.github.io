+++
title = "Should we pay for open source?"
author = ["Arjen Wiersma"]
date = 2022-11-06T00:00:00+01:00
draft = false
+++

As the world is processing the [Twitter deal](https://www.forbes.com/sites/petersuciu/2022/11/05/twitter-is-facing-a-great-exodus--can-the-company-remain-profitable-if-it-loses-its-power-users/?sh=3a3aaec0212a) the open source project [Mastodon](https://joinmastodon.org/) is gaining a lot of traction. The instance that I am on, [fosstodon](https://fostodon.org), is run by a small team and is fully funded by [donations](https://hub.fosstodon.org/support/).

Now this may sound somewhat strange; as the twitterverse is blowing up about $8/month for a blue checkmark I would argue that the $8 is better spent supporting open source projects. As developers, security people, and users we rely on a lot of free time and effort from open source contributors.


## Sustainable open source {#sustainable-open-source}

This idea of sustainable open source is not new. On Github you can already donate to your favorite projects and many people accept money through patreon or [Liberapay](https://liberapay.com/). This is a good step towards sustainability. To illustrate what could go wrong if we don't move more into this direction we should look at the case of Marak Squiress.

You might've heard about `color.js` and `faker.js`. The latter was used to generate fake data for testing forms in web applications and such. Both projects were used by thousands of other projects. Most developers did not even notice this dependency in their project as it would be deep into the dependency tree.

One day Marak got fed up. He was tired of working on his projects and seeing companies use his projects without giving back. So he pleaded with the outside world to no avail. Sadly it seems he totally burned out and removed his projects from various repositories. Needless to say, stuff started to break. As the NPM ecosystem is not geared towards reproducability (and general usability) a missing package will only be followed with absolute failure.

The [detailed story](https://www.bleepingcomputer.com/news/security/dev-corrupts-npm-libs-colors-and-faker-breaking-thousands-of-apps/) of Marak and his decision is quite the read, I highly recommend going through it and reflecting on what it would mean for your own projects.


## Dependencies {#dependencies}

The fragility of dependencies is not new. In an XKCD comic it was beautifully illustrated:

{{< figure src="/ox-hugo/dependency.png" >}}

There are countless examples where this goes wrong. Just in the NPM space it is quite easy to find examples where funding would've helped. Lets take a look at some supply chain attacks where a better funded developer might've taken the time to actually setup better security for themselves.

In November of 2018 a malicious package was added as a dependency to version 3.3.6 of the popular package event-stream by a new maintainer. The malicious package, called flatmap-stream, contained an encrypted payload that stole bitcoins from certain applications. Read the [NPM Blog](https://blog.npmjs.org/post/180565383195/details-about-the-event-stream-incident) for an incident report.

In October of 2021 the NPM account for the UA-Parser-JS library was hijacked, to infect dependent systems with cryptominers and password-stealing trojans in a supply-chain attack. There is a [Detailed story](https://www.bleepingcomputer.com/news/security/popular-npm-library-hijacked-to-install-password-stealers-miners/) that goes into all the steps involved.

In July of 2018 the credentials of a maintainer on NPM were compromised resulting in a malicious release of eslint-scope, version 3.7.2. The malicious code copied the npm credentials of the machine running eslint-scope and uploaded them to the attacker. There is a good [blog post](https://eslint.org/blog/2018/07/postmortem-for-malicious-package-publishes/) by the ESLint team.

Although better funding does not mean better security posture, it would mean that developers get more time to spend on their projects. More time generally results in better choices and hopefully also security choices.


## OpenSSL {#openssl}

Outside the NPM realm you can also throw a stone and find an interesting story. Lets take a look at OpenSSL on November 1st of 2022. The release a critical patch for a vulnerability. Instead of it being something that was broken when security was not on the forefront this time it was a vulnerability in _new_ code. Code that was just recently added, knowing how important OpenSSL is in the ecosystem. Sadly it was not tested enough. The code dealt with the parsing of punycode urls in email addresses. It resulted in a trivial buffer overflow; using `<=` instead of `<`. Read more about it in their [blog post](https://www.openssl.org/blog/blog/2022/11/01/email-address-overflows/).


## Closing thought {#closing-thought}

So, lets start working towards a sustainable open source culture where developers can get (well) paid for their work.


## After the post {#after-the-post}

After posting this earlier today the news dropped on hackernews that the author of [mold](https://github.com/rui314/mold), [Rui Ueyama](https://twitter.com/rui314), is thinking about changing the license for mold/macOS due to its lack of funding. His [twitter post](https://twitter.com/rui314/status/1589228847903698945) is unrolled below.

> I was optimistic when I started the mold project that I'd be able to earn a comfortable income in some way if it becomes popular. But I may have to admit that that's a bit too optimistic. I'm still losing my money after two years.
>
> I **have** enough money that I earned when I was working as a full-time software engineer, but if I keep losing money, it's not sustainable long term.
> It's even a bit ironic that I had been asked by several big-name companies when mold/macOS would become available, since they wanted to use it for their multi-billion-dollar businesses. But no one gave me a financial support.
>
> Part of a reason is because most companies don't have an internal process to start supporting an open-source project. If they need to buy a license, that's fine, that's part of a usual business. But giving money away to "free" software? There's no precedent and hard to justify.
> Given this situation, I'm seriously considering changing the mold/macOS license (not mold/Unix license) from AGPL to a commercial, source-available one. Something like individuals would be able to use it for free but companies have to pay.
>
> I know some people are not happy about even thinking about it, and so am I. But to me it is more important to make the project viable long-term and grow into something that we can hire an engineer or two to accelerate the development. I haven't decided anything yet though!
