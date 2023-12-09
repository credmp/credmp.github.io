+++
title = "Advent of Code 2023 day 8"
author = ["Arjen Wiersma"]
date = 2023-12-09T07:27:00+01:00
draft = false
+++

Somewhat suspicious of 2 easy days we end up at Day 8. A simple map to follow again, from one key follow the instructions until we hit `ZZZ`. Part 2 had us do it for several keys at once, with the goal to find the spot where they all converge. This can take **forever**, erhm, a long time.

So there has to be a math type solution to this problem. It turns out to be a Least Common Multiple problem. It is the smallest positive integer that is divisible by two or more numbers without leaving a remainder. To find the LCM of two or more numbers, you can use a method called prime factorization or a simpler approach involving multiples. We can also use the Greatest Common Divisor (GCD) to find the LCM.

```text
LCM(a, b) = (a * b) / GCD(a, b)
```

Example: Find the LCM of 12 and 18 using their GCD.

Step 1: Find the GCD of 12 and 18.

-   You can use methods like prime factorization or the Euclidean algorithm to find the GCD.
-   GCD(12, 18) = 6

Step 2: Use the formula to find the LCM.

```text
LCM(12, 18) = (12 * 18) / 6 = 216 / 6 = 36
```

So, the LCM of 12 and 18 is 36.

```go
package main

import (
	"fmt"
	"strings"
	"time"

	"arjenwiersma.nl/aoc/internal/aoc"
)

func LCM(numbers []int) int {
	result := numbers[0]
	for i := 1; i < len(numbers); i++ {
		result = (result * numbers[i]) / GCD(result, numbers[i])
	}
	return result
}

func GCD(a, b int) int {
	if b == 0 {
		return a
	}
	return GCD(b, a%b)
}

func solve(s string, instr string, m map[string][]string, p2 bool) int {
	steps := 0
	for {
		d := 0
		if string(instr[steps%len(instr)]) == "R" {
			d = 1
		}

		if !p2 && s == "ZZZ" {
			break
		}
		if p2 && s[2] == 'Z' {
			break
		}

		s = m[s][d]

		steps += 1
	}
	return steps
}
func main() {
	content := aoc.AsLines("2023/Day08/input.txt")

	instr := content[0]
	m := make(map[string][]string)

	for _, v := range content[2:] {
		n := strings.Split(v, " = ")
		lr := strings.Split(n[1], ",")

		m[n[0]] = []string{strings.TrimSpace(lr[0][1:]), strings.TrimSpace(lr[1][:len(lr[1])-1])}
	}

	startTime := time.Now()

	steps := solve("AAA", instr, m, false)

	endTime := time.Now()
	elapsed := endTime.Sub(startTime)
	fmt.Printf("Part 1: %d (%v)\n", steps, elapsed)

	startTime = time.Now()

	var solves []int
	for k := range m {
		if k[2] == 'A' {
			solves = append(solves, solve(k, instr, m, true))
		}
	}

	// do stuff
	endTime = time.Now()
	elapsed = endTime.Sub(startTime)
	fmt.Printf("Part 2: %d (%v)\n", LCM(solves), elapsed)
}
```
