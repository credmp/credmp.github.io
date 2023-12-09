+++
title = "Advent of Code 2023 day 6"
author = ["Arjen Wiersma"]
date = 2023-12-09T07:16:00+01:00
draft = false
+++

Day 6 turned out to be the easiest day in the range so far. A simple implementation of the algorithm was more than sufficient.

I later learned that it was a quadratic function. On the subreddit Deatranger999 said:

> If you hold down the button for x seconds, then you will beat the distance if the quadratic x^2 - t x + d is at most 0, where t is the total time of the race and d is the distance you'd like to beat. So I just plugged each one into WolframAlpha, found the roots, and then calculated the number of integers between the two roots.

My solution was to bruteforce :)

```go
package main

import (
	"fmt"
	"strconv"
	"strings"

	"arjenwiersma.nl/aoc/internal/aoc"
)

func main() {
	lines := aoc.AsLines("2023/Day06/input.txt")

	var times []int
	for _, t := range strings.Split(lines[0], " ")[1:] {
		s := strings.TrimSpace(t)
		if s == "" {
			continue
		}
		i, _ := strconv.Atoi(s)
		times = append(times, i)
	}
	var distances []int
	for _, t := range strings.Split(lines[1], " ")[1:] {
		s := strings.TrimSpace(t)
		if s == "" {
			continue
		}
		i, _ := strconv.Atoi(s)
		distances = append(distances, i)
	}

	result := make([]int, len(times))

	for i := 0; i < len(times); i++ {
		for t := 0; t < times[i]; t++ {
			d := t * (times[i] - t)
			if d > distances[i] {
				result[i] += 1
			}
		}
	}

	ans := 1
	for _, c := range result {
		ans *= c
	}

	fmt.Println("Part 1: ", ans)

	nT, _ := strconv.Atoi(fmt.Sprintf("%d%d%d%d", times[0], times[1], times[2], times[3]))
	nD, _ := strconv.Atoi(fmt.Sprintf("%d%d%d%d", distances[0], distances[1], distances[2], distances[3]))

	ans = 0
	for t := 0; t < nT; t++ {
		d := t * (nT - t)
		if d > nD {
			ans += 1
		}
	}
	fmt.Println("Part 2: ", ans)

}
```
