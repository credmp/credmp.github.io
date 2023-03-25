+++
title = "Badge Challenge 3"
author = ["Arjen Wiersma"]
date = 2023-03-12T12:10:00+01:00
draft = false
+++

## Original Post {#original-post}

During each in-person Hack The Box meetup I have a small badge challenge that will give the first solver of the challenge a price. at the meetup of March 2023 there will be a very nice little challenge to be done as well, a beautiful NOVI hoodie. You can already download the password protected zip archive. The password will be shared during the meetup opening words.

-   [The zip archive](/files/badge3.zip) (sha1: 28e84243c79caefce06f62ba2c5d930de37a3439)

Good luck. Afterwards I will post a walkthrough of the challenge on this site. Badge Life is hard :)


## Walkthrough {#walkthrough}

As usual, the solving of this challenge did not go as expected.

When you first receive the challenge a quick binary analysis will show you that there is a condition of the passphrase. It has to **24** characters in length and the ascii value has to sum up to **2137**. During the meetup there were some hints as to how to find the passphrase, namely that I said that I posted in **LinkedIn** about the challenge and Salp had a _"credmp talks too much"_ on his badge. Sadly the hints were not picked up and people started writing bruteforcers for gigantic dictionaries. Eventually I updated my initial blog post to have all the information that was necessary so that the challenge could be solved.

A wise lesson here is to not rely on multiple sources for the challenge, and if so, make it much more direct. What should've been a fun, quick, bruteforcers ended up in a days long torment.

The original LinkedIn message on the badge challenge had all the information that was required. Lets check it out in the following figure.

{{< figure src="/ox-hugo/linkedin-badge-challenge.png" alt="The linkedin post" width="100%" >}}

By creating a bruteforcer, as MrHaas did for the blog post, a script as the following could be created.

<a id="code-snippet--Solve code by MrHaas"></a>
```python
from itertools import combinations, permutations
from tqdm import tqdm
import pwn

pwn.context.log_level = "error"

post = """
    Badge Challenge 3
March 12, 2023 · 1 min · Arjen Wiersma
During each in-person Hack The Box meetup I have a small badge challenge that will give the first solver of the challenge a price. at the meetup of March 2023 there will be a very nice little challenge to be done as well, a beautiful NOVI hoodie. You can already download the password protected zip archive. The password will be shared during the meetup opening words.
    The zip archive (sha1: 28e84243c79caefce06f62ba2c5d930de37a3439)
Good luck. Afterwards I will post a walkthrough of the challenge on this site.
"""


def ssum(s):
    return sum(ord(c) for c in s)


def iter_passphrases(words, n):
    for comb in combinations(words, n):
        if sum(len(word) for word in comb) != (24 - n + 1):
            continue
        if sum(ssum(word) for word in comb) != (2137 - (n - 1) * 32):
            continue

        for perm in permutations(comb):
            yield " ".join(perm)


if __name__ == "__main__":
    word_list = open("./dutch_common_wordlist.txt").read().split()
    words = [word.strip(".?!()#") for word in post.split()]
    overlap = set(word_list) & set(words) | {"Life"}

    for n in range(3, 6):
        print(f"Trying {n} words")
        for passphrase in tqdm(iter_passphrases(overlap, n)):
            with pwn.process(["./badge3", passphrase]) as ps:
                result = ps.recvall()

                if b"Sorry" not in result:
                    print(passphrase)
                    print(result.decode())
                    break
```

More interestingly, chatgpt can be leveraged to create a brute forcing program, however it is not very good. ChatGPT gets confused on how to use the itertools package to generate the combinations. However, it is a good starting template.

{{< figure src="/ox-hugo/badge3-chatgpt.png" alt="Getting help from ChatGPT" width="100%" >}}

Finally, here is the actual Rust code for the challenge.

<a id="code-snippet--Challenge code in Rust"></a>
```rust
use std::env;
use std::str;

fn main() {
    let mut args: Vec<String> = env::args().collect();

    println!(
"
Badge Life (in ASCII art)
");

    if args.len() == 1 {
        println!("Usage: {} passphrase", args[0]);
        return;
    }

    args.remove(0);
    let pass = args.join(" ");

    let mut sum = 0;
    for p in pass.chars() {
        sum = sum + (p as i32);
    }

    if pass.len() != 24 && sum != 2137 {
        println!(
            "That is not a correct passphrase (len {} sum {}), try again!",
            pass.len(),
            sum
        );
        return;
    }

    println!("That might work.... lets try it!");

    let password = pass.as_bytes();

    let encrypted = [
        166, 245, 144, 245, 161, 25, 252, 210, 105, 138, 33, 57, 160, 128, 18, 25, 38, 0, 0, 0, 0,
        0, 0, 0, 6, 171, 134, 183, 188, 103, 63, 69, 199, 190, 26, 116, 174, 217, 135, 232, 211,
        26, 102, 245, 226, 186, 82, 70, 104, 59, 170, 231, 162, 92, 120, 130, 135, 108, 134, 108,
        22, 81,
    ];

    let plain = simplestcrypt::deserialize_and_decrypt(&password[..], &encrypted);

    match plain {
        Ok(v) => {
            let conv = str::from_utf8(&v);
            match conv {
                Ok(key) => println!("Here is the key: {:?}", key),
                Err(_) => println!("Sorry, it was not the right phrase"),
            }
        }
        Err(_) => {
            println!("Sorry, it was not the right phrase");
            return;
        }
    }
}
```

The passphrase was: **Badge Life at The meetup**
