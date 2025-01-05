---
title: Type-Driven Design
date: "2025-01-05"
categories: [Design]
---

{{< backlink "rust" "Rust">}} has allows for a pattern called Type-Driven Design. In the below example a `SubscriberName` is created. It has a single `String` value. In *simple* code this might be represented as `let subscriber_name = "Arjen".to_string();`. By making the type you can wrap the validation logic into the creation of the type. This means that wherever you get a paramter of type `SubscriberName` you know it is valid.

```rust
#[derive(Debug)]
pub struct SubscriberName(String);

impl SubscriberName {
    /// Returns an instance of `SubscriberName` if the input satisfies all
    /// our validation constraints on subscriber names.
    /// It panics otherwise.
    pub fn parse(s: String) -> Result<SubscriberName, String> {
        let is_empty_or_whitespace = s.trim().is_empty();
        let is_too_long = s.graphemes(true).count() > 256;
        let forbidden_characters = ['/', '(', ')', '"', '<', '>', '\\', '{', '}'];
        let contains_forbidden_characters = s.chars().any(|g| forbidden_characters.contains(&g));
        if is_empty_or_whitespace || is_too_long || contains_forbidden_characters {
            Err(format!("{} is not a valid subscriber name.", s))
        } else {
            Ok(Self(s))
        }
    }
}

// Usage
let subscriber_name = SubscriberName::parse("Arjen");
```

The source of this knowledge is from {{< backlink "zero2prod" "Zero2Prod (Book)">}}.
