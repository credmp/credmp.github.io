+++
title = "Starting my Master Thesis"
author = ["Arjen Wiersma"]
date = 2023-04-13T22:15:00+02:00
tags = ["education"]
draft = false
+++

Today, I took the first step towards starting my master's thesis. I have decided to document my journey and experiences on my blog. Given that the thesis will play a pivotal role in my life for the next nine months, I expect it to be a thrilling journey.


## Finding a topic {#finding-a-topic}

As a student at [Open Universiteit](https://www.ou.nl) in The Netherlands, I had the opportunity to work with the [Rascal programming language](https://rascal-mpl.org) during the Software Quality Management course. I found the language intriguing and enjoyed working with it throughout the module. After consulting with my professor, we brainstormed various possibilities for my master's thesis topic, ultimately settling on the creation of a visualization library for the language.

Although I had to complete my Software Architecture course before embarking on my thesis, I finally had the chance to visit the [Center for Mathematics and Informatics (CWI)](https://www.cwi.nl/en/), an important organization in the Netherlands. The CWI has a large department devoted to quantum computing and is responsible for developing and maintaining the Rascal programming language, in addition to being the [first entity to connect to the internet and register a ".nl" domain name](https://www.cwi.nl/en/about/history/). During my visit, we discussed a plethora of options, including reusable components and compositional visualizations, but ultimately decided to focus on projectional editors.

Projectional editors are a type of text editor that allows users to work with a representation of the code's abstract syntax tree (AST), instead of working with the code directly. This approach enables users to work with a higher-level representation of the code, which can make it easier to comprehend and manipulate complex code structures. Typically, users create and edit code in projectional editors by selecting elements from a palette or menu and positioning them in a visual representation of the code's syntax tree. The editor then automatically generates the corresponding code based on the user's selections. This approach is especially useful for languages with intricate syntax or when developing domain-specific languages.

To create a visualization of source code in the form of a diagram, a domain-specific language (DSL) is required to describe the visualization. A DSL is a programming language designed to solve problems in a specific domain or context. In this case, a DSL would be used to describe the structure and layout of the visualization of the source code.

Currently, there is no existing DSL that can be used to describe the visualization of source code. Therefore, as part of the master's thesis, the focus will be on creating a context-free grammar (CFG) capable of generating the DSL required for the visualization. The CFG will define the syntax and structure of the language, including the rules and patterns used to create the visual representation of the code.

Once the CFG is created, the DSL can be generated and used to create the visualization of the source code in the form of a diagram. This visualization will enable users to reason about their code in a high-level manner, helping to identify and understand complex code structures and relationships.


## Context-Free Grammars {#context-free-grammars}

A context-free grammar (CFG) is a formalism used to describe the syntax of a formal language. A CFG consists of a set of rules that define how strings of symbols can be constructed in the language. The rules in a CFG specify how non-terminal symbols can be replaced with sequences of terminal and non-terminal symbols.

A non-terminal symbol represents a syntactic category or type of element in the language, while a terminal symbol represents a basic unit of meaning or a symbol that cannot be further reduced. The rules in a CFG define how non-terminal symbols can be replaced by sequences of terminal and non-terminal symbols, and how these sequences can be combined to form valid strings in the language.

Consider the following CFG:

```nil
S -> aSb | ε
```

In this CFG, `S` is a non-terminal symbol that represents a string of the form `a^n b^n where n >= 0`. The rule `S -> aSb` specifies that a string of the form `a^n b^n` can be constructed by taking a string of the form `a^(n-1) b^(n-1)` and appending an `a` to the beginning and a `b` to the end. The rule `S -> ε` specifies that the empty string is also a valid string of the language.

Using this CFG, we can generate the following strings:

```nil
ε
ab
aabbb
aaabbbb
aaaabbbbb
```

To generate the string aaaabbbbb, we can use the following sequence of derivations:

```nil
S => aSb          (apply rule S -> aSb)
  => aaSbb        (apply rule S -> aSb)
  => aaaSbbb      (apply rule S -> aSb)
  => aaaaSbbbb    (apply rule S -> aSb)
  => aaaabbbbb    (apply rule S -> ε)
```

Note that at each step in the derivation, we apply a rule to replace a non-terminal symbol with a sequence of terminal and non-terminal symbols, until we arrive at a string composed entirely of terminal symbols (i.e., the empty string or a string of the form `a^n b^n`).


## Moving forward {#moving-forward}

The preparation phase for the master's thesis at Open Universiteit spans 11 weeks, followed by 22 weeks of research and writing. As I am just starting the preparation phase, I anticipate the topic to evolve over time, and I look forward to sharing my journey with you.
