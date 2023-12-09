+++
title = "Advent of Code 2023 day 9"
author = ["Arjen Wiersma"]
date = 2023-12-09T07:29:00+01:00
draft = false
+++

The weekend generally is a place to find hard puzzles again, this time not so much. A simple quest to find the next number in a sequence with a fully written out algorithm to follow. They key here is to use recursion.

```go
package main

import (
	"fmt"
	"time"

	"arjenwiersma.nl/aoc/internal/aoc"
)

func NextStep(in []int) int {
	allZero := true

	for _, v := range in {
		if v != 0 {
			allZero = false
		}
	}

	if allZero {
		return 0
	}

	var diffs []int
	for i := 1; i < len(in); i++ {
		diffs = append(diffs, in[i]-in[i-1])
	}

	p := NextStep(diffs)
	return in[len(in)-1] + p
}

func main() {
	content := aoc.AsLines("2023/Day09/input.txt")

	var lines [][]int
	for _, v := range content {
		lines = append(lines, aoc.AsNumbers(v))
	}

	startTime := time.Now()

	var res []int
	for _, v := range lines {
		res = append(res, NextStep(v))
	}

	r := aoc.SumArray(res)
	endTime := time.Now()
	elapsed := endTime.Sub(startTime)
	fmt.Printf("Part 1: %d (%v)\n", r, elapsed)

	startTime = time.Now()

	for _, v := range lines {
		aoc.Reverse(v)
	}

	res = []int{}
	for _, v := range lines {
		res = append(res, NextStep(v))
	}

	r = aoc.SumArray(res)
	endTime = time.Now()
	elapsed = endTime.Sub(startTime)
	fmt.Printf("Part 2: %d (%v)\n", r, elapsed)
}
```
