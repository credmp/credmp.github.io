+++
title = "Advent of Code 2023 day 7"
author = ["Arjen Wiersma"]
date = 2023-12-09T07:18:00+01:00
draft = false
+++

Today we learned about CamelCards, a game of poker meant to play on the back of a camel. The most interesting part here was the parsing of the cards and figuring out how to properly rank them. Part 2 turned out to be as easy as tracking Jokers.

```go
package main

import (
	"fmt"
	"sort"
	"strconv"
	"strings"
	"time"

	"arjenwiersma.nl/aoc/internal/aoc"
)

type Card struct {
	bid    int
	hand   []int
	jokers int
}

func (c *Card) strongerThen(o *Card) bool {
	for i, v := range c.hand {
		if v > o.hand[i] {
			return true
		} else if v < o.hand[i] {
			return false
		}
	}
	return false
}

func (c *Card) rank() int {
	freq := make([]int, 15)
	for _, v := range c.hand {
		if v == 1 { // skip counting the joker
			continue
		}
		freq[v]++
	}

	sort.Ints(freq)

	freq[len(freq)-1] += c.jokers
	strength := 2 * freq[len(freq)-1]
	// full house and 2 pair
	if freq[len(freq)-2] == 2 {
		strength += 1
	}
	return strength
}

func NewCard(s string, bid int, p2 bool) *Card {
	c := &Card{}
	c.bid = bid
	c.jokers = 0
	for p := 0; p < len(s); p++ {
		if s[p]-'0' >= 2 && s[p]-'0' <= 9 {
			c.hand = append(c.hand, int(s[p]-'0'))
		} else {
			x := 10
			switch s[p] {
			case 'A':
				x = 14
			case 'K':
				x = 13
			case 'Q':
				x = 12
			case 'J':
				if p2 {
					c.jokers += 1
					x = 1
				} else {
					x = 11
				}
			case 'T':
				x = 10
			}
			c.hand = append(c.hand, x)
		}
	}
	return c
}

func (c *Card) String() string {
	return fmt.Sprintf("%v (%d)", c.hand, c.bid)
}

func main() {
	content := aoc.AsLines("2023/Day07/input.txt")

	var cards []*Card
	for _, v := range content {
		p := strings.Split(v, " ")
		b, _ := strconv.Atoi(p[1])
		c := NewCard(p[0], b, false)
		cards = append(cards, c)
	}

	startTime := time.Now()
	lessFunc := func(i, j int) bool {
		if cards[i].rank() == cards[j].rank() {
			return cards[j].strongerThen(cards[i])
		}
		return cards[i].rank() < cards[j].rank()
	}

	sort.Slice(cards, lessFunc)

	res := 0
	for i, c := range cards {
		res += (i + 1) * c.bid
	}

	endTime := time.Now()
	elapsed := endTime.Sub(startTime)
	if 251216224 != res {
		panic("Wrong answer")
	}
	fmt.Printf("Part 1: %d (%v)\n", res, elapsed) // 251216224

	cards = []*Card{}
	for _, v := range content {
		p := strings.Split(v, " ")
		b, _ := strconv.Atoi(p[1])
		c := NewCard(p[0], b, true)
		cards = append(cards, c)
	}
	startTime = time.Now()

	sort.Slice(cards, lessFunc)

	res = 0
	for i, c := range cards {
		res += (i + 1) * c.bid
	}
	endTime = time.Now()
	elapsed = endTime.Sub(startTime)
	if 250825971 != res {
		panic("Wrong part 2")
	}
	fmt.Printf("Part 2: %d (%v)\n", res, elapsed) // 250825971
}
```
