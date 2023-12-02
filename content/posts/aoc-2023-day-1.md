+++
title = "Advent of Code 2023 Day 1"
author = ["Arjen Wiersma"]
date = 2023-12-02T14:39:00+01:00
draft = false
+++

The [Advent of Code](https://www.adventofcode.com) has started again. At [NOVI](https://www.novi.nl) we participate with a group of our students. We use the AoC throughout the entire curriculum as practice exercises to learn new programming languages or the application of data-structures and algorithms.

Day 1 was a tricky start for most people. Part 1 was not too bad, but part 2 tripped most people up. I guess the idea was that you would have to solve the challenge with an array iteration, but most students tripped up. They tried to match each word and replace the occurrence in the text, running head-on into the edge-case where 2 numbers overlap, such as "eightwo".

Here is my solution using the Go programming language:

```go
package main

import (
	"fmt"
	"os"
	"strings"
	"unicode"
)

func part1(lines []string) {
	ans := 0
	for _, v := range lines {
		var ints []int
		for _, c := range v {
			if unicode.IsDigit(c) {
				ints = append(ints, int(c-'0'))
			}
		}
		if len(ints) == 0 {
			continue
		}
		ans += ints[0]*10 + ints[len(ints)-1]
	}
	fmt.Println("Part 1: ", ans)
}

func part2(lines []string) {
	ans := 0
	for _, v := range lines {
		var ints []int
		for x := 0; x < len(v); x++ {
			for k, val := range []string{"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"} {
				if strings.HasPrefix(v[x:], val) {
					ints = append(ints, k+1)
				}
			}
			if unicode.IsDigit(rune(v[x])) {
				ints = append(ints, int(v[x]-'0'))
			}
		}

		if len(ints) == 0 {
			continue
		}
		ans += ints[0]*10 + ints[len(ints)-1]
	}

	fmt.Println("Part 2: ", ans)
}

func main() {
	content, _ := os.ReadFile("2023/Day01/input.txt")

	lines := strings.Split(string(content), "\n")

	part1(lines)
	part2(lines)
}
```
