+++
title = "Advent of Code 2023 day 5"
author = ["Arjen Wiersma"]
date = 2023-12-09T07:13:00+01:00
draft = false
+++

Today was an interesting problem. We are basically given a map to follow based on a number, possibly transforming the number at each step. With a single number this is quite simple, just apply the rules and step through each set of transformations. The problem becomes tricky when it turns out we have to deal with enormous ranges of numbers. On the subreddit some people reported their implementation to take hours and use 20GB of memory.

Luckily there is always a fast solution. In this case it was using ranges of numbers to go through the transformations, so just taking the first number and then creating a (new) range out of the transformation instead of each individual number.

```go
package main

import (
	"fmt"
	"log"
	"math"
	"os"
	"strconv"
	"strings"
	"time"

	"arjenwiersma.nl/aoc/internal/aoc"
)

type Range struct {
	d, s, r int
}

func (r *Range) transform(i int) int {
	if i >= r.s && i <= r.s+r.r-1 {
		delta := i - r.s
		return r.d + delta
	}

	return i
}

type Segment struct {
	from, to int
}

func main() {
	content, _ := os.ReadFile("2023/Day05/input.txt")
	segments := strings.Split(strings.TrimSpace(string(content)), "\n\n")

	seedStr := strings.Split(segments[0][6:], " ")
	var seed []int
	for _, x := range seedStr {
		if strings.TrimSpace(x) == "" {
			continue
		}
		s, err := strconv.Atoi(strings.TrimSpace(x))
		if err != nil {
			log.Fatal(s, err)
		}
		seed = append(seed, s)
	}
	// fmt.Println("Seeds: ", seed)

	maps := make([][]Range, len(segments)-1)
	for i, s := range segments[1:] {
		l := strings.Split(s, "\n")
		maps[i] = make([]Range, len(l)-1)
		for j, x := range l[1:] {
			var m Range
			fmt.Sscanf(x, "%d %d %d", &m.d, &m.s, &m.r)
			maps[i][j] = m
		}
	}

	startTime := time.Now()

	min := math.MaxInt
	for _, s := range seed {
		c := s
	trans:
		for _, m := range maps {
			for _, t := range m {
				source := c
				c = t.transform(c)
				if c != source {
					continue trans
				}
			}
		}
		if c < min {
			min = c
		}
	}
	endTime := time.Now()
	elapsed := endTime.Sub(startTime)
	fmt.Printf("Part 1: %d (%v)\n", min, elapsed) // 662197086

	startTime = time.Now()
	// starting segments
	var S []Segment
	for i := 0; i < len(seed); i += 2 {
		S = append(S, Segment{seed[i], seed[i] + seed[i+1]})
	}

	for _, m := range maps {
		var A []Segment
		for _, t := range m {
			var nS []Segment
			for _, s := range S {
				nA, nnS := createSegments(s, t)
				A = append(A, nA...)
				nS = append(nS, nnS...)
			}
			S = nS
		}
		S = append(S, A...)
	}
	min = math.MaxInt

	for _, s := range S {
		min = aoc.Min(s.from, min)
	}
	endTime = time.Now()
	elapsed = endTime.Sub(startTime)
	fmt.Printf("Part 2: %d (%v)\n", min, elapsed) // 52510809
}

func createSegments(s Segment, t Range) (A []Segment, nS []Segment) {
	before := Segment{s.from, aoc.Min(s.to, t.s)}
	inter := Segment{aoc.Max(s.from, t.s), aoc.Min(t.s+t.r, s.to)}
	after := Segment{aoc.Max(t.s+t.r, s.from), s.to}

	if before.to > before.from {
		nS = append(nS, before)
	}
	if inter.to > inter.from {
		inter.from = inter.from - t.s + t.d
		inter.to = inter.to - t.s + t.d
		A = append(A, inter)
	}
	if after.to > after.from {
		nS = append(nS, after)
	}

	return A, nS
}
```
