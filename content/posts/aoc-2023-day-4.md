+++
title = "Advent of Code 2023 Day 4"
author = ["Arjen Wiersma"]
date = 2023-12-04T23:16:00+01:00
draft = false
+++

The difficulty is going up and down. This day was quite easy in comparison to yesterday. Today it was about parsing some numbers and finding a set of winning numbers.

As I am doing these puzzles in Go I found out that there is no default `set` type. There is an implementation by HashiCorp named [go-set](https://github.com/hashicorp/go-set) that fills this void. I did not use an external package (I try to avoid them while doing AoC), but I am very tempted to pull that package in.

Here is my solution using lists.

```go
package main

import (
	"fmt"
	"math"
	"strings"

	"arjenwiersma.nl/aoc/internal/aoc"
)

func main() {
	lines := aoc.AsLines("2023/Day04/input.txt")

	ans := 0
	counts := make([]int, len(lines))

	for x := 0; x < len(lines); x++ {
		counts[x] = 1
	}

	for i, l := range lines {
		nums := strings.Split(l, ":")
		parts := strings.Split(nums[1], "|")
		myInts := aoc.StrToInts(strings.Split(parts[1], " "))
		winInts := aoc.StrToInts(strings.Split(parts[0], " "))

		count := 0
		for _, v := range myInts {
			for _, x := range winInts {
				if x == v {
					count += 1
				}
			}
		}
		if count > 0 {
			c := int(math.Pow(2, float64(count)-1))
			for x := 1; x <= count; x++ {
				counts[i+x] += counts[i]
			}
			ans += c
		}
	}
	fmt.Println("Part 1: ", ans)
	ans = 0
	for _, v := range counts {
		ans += v
	}
	fmt.Println("Part 2: ", ans)
}
```
