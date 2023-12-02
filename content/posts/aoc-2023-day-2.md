+++
title = "Advent of Code 2023 Day 2"
author = ["Arjen Wiersma"]
date = 2023-12-02T14:41:00+01:00
draft = false
+++

Day 2 was another fun challenge. Lots of splitting of strings. I wonder if there is a better way to filter out the min and max value from the separate grabs.

I am sure I will not be able to complete all challenges this year, but so far so good.

```go
package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

type Grab struct {
	red, green, blue int
}

type Game struct {
	id    int
	grabs []Grab
}

func main() {
	content, _ := os.ReadFile("2023/Day02/input.txt")

	var input []Game
	for g, l := range strings.Split(strings.TrimSpace(string(content)), "\n") {
		game := Game{}
		game.id = g + 1
		parts := strings.Split(l, ":")
		grabs := strings.Split(parts[1], ";")
		for _, h := range grabs {
			grab := Grab{}
			for _, rgb := range strings.Split(h, ",") {
				color := strings.Split(strings.TrimSpace(rgb), " ")
				i, _ := strconv.Atoi(color[0])
				switch color[1] {
				case "red":
					grab.red = i
				case "green":
					grab.green = i
				case "blue":
					grab.blue = i
				}
			}
			game.grabs = append(game.grabs, grab)
		}
		input = append(input, game)
	}

	max := Grab{
		red:   12,
		green: 13,
		blue:  14,
	}

	var possible []Game
outer:
	for _, game := range input {
		for _, grab := range game.grabs {
			if grab.red > max.red || grab.green > max.green || grab.blue > max.blue {
				continue outer
			}
		}
		// fmt.Println("Possible game: ", game)
		possible = append(possible, game)
	}

	sum := 0
	for _, g := range possible {
		sum += g.id
	}
	fmt.Println("Part 1: ", sum)

	var powers []Grab
	for _, game := range input {
		min := Grab{
			red:   0,
			green: 0,
			blue:  0,
		}
		for _, grab := range game.grabs {
			if grab.red > min.red {
				min.red = grab.red
			}
			if grab.green > min.green {
				min.green = grab.green
			}
			if grab.blue > min.blue {
				min.blue = grab.blue
			}
		}
		powers = append(powers, min)
	}

	sum = 0
	for _, x := range powers {
		sum += x.red * x.green * x.blue
	}
	fmt.Println("Part 2: ", sum)
}
```
