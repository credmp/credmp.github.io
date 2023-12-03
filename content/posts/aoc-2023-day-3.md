+++
title = "Advent of Code 2023 Day 3"
author = ["Arjen Wiersma"]
date = 2023-12-03T12:38:00+01:00
draft = false
+++

Day 3 was quite something. I think that in an attempt to make it harder for AI to solve the puzzles the creators also increased the difficulty level of the base puzzles a little too much. The test was not very clear as to what should happen with negative numbers and it might trip people up. The puzzle itself is a great to exercise grid knowledge as you have to work with neighbors and you have to extend the numbers when you find them. Part 2 was just some bookkeeping on my existing implementation, so it was not too much work.

As a note; I first started out with a list of Points, keeping track of the numbers in a coordinate system. This failed miserably :).

```go
package main

import (
	"fmt"

	"arjenwiersma.nl/aoc/internal/aoc"
)

type Point struct {
	Y, X int
}

func IsDigit(b byte) bool {
	return b-'0' >= 0 && b-'0' <= 9
}

func main() {
	lines := aoc.AsLines("2023/Day03/input.txt")

	ygrid := len(lines)
	xgrid := len(lines[0])

	grid := make([][]byte, ygrid)
	for y, l := range lines {
		grid[y] = make([]byte, xgrid)
		for x := 0; x < len(l); x++ {
			grid[y][x] = l[x]
		}
	}

	neighbors := [][]int{
		{-1, -1}, {0, -1}, {1, -1},
		{-1, 0}, {0, 0}, {1, 0},
		{-1, 1}, {0, 1}, {1, 1},
	}

	gears := make(map[Point][]int)
	sum := 0
	for y := 0; y < ygrid; y++ {
		for x := 0; x < xgrid; x++ {
			num := 0
			hasSymbol := false
			isGear := false
			var gearCoord Point
			for IsDigit(grid[y][x]) {
				num = num*10 + int(grid[y][x]-'0')
				for _, n := range neighbors {
					if y+n[1] >= 0 && y+n[1] < ygrid &&
						x+n[0] >= 0 && x+n[0] < xgrid {
						v := grid[y+n[1]][x+n[0]]
						if !IsDigit(v) && v != '.' {
							if v == '*' {
								isGear = true
								gearCoord = Point{X: x + n[0], Y: y + n[1]}
							}
							hasSymbol = true
						}
					}
				}
				x += 1
				if x >= xgrid {
					break
				}
			}
			if num > 0 && hasSymbol {
				if isGear {
					gears[gearCoord] = append(gears[gearCoord], num)
				}
				sum += num
			}
		}
	}

	fmt.Println("Part 1: ", sum) // 498559

	sum = 0
	for _, v := range gears {
		if len(v) == 2 {
			sum += v[0] * v[1]
		}
	}
	fmt.Println("Part 2: ", sum) // 72246648
}
```
