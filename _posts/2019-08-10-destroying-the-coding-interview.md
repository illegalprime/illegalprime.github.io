---
title: Ben Shapiro DESTROYS and OBLITERATES the Coding Interview
layout: post
tags:
  - code
---

I've been interviewing again recently and I wanted to share all the technical
questions I've ever received so that _you too_ can annihilate and commit genocide
on technical interview questions.

First I wanted to share some thoughts on the general process.
If you're an interviewer, please:

1. **Don't** schedule a call just to reject me, I don't want an email that just
says you have "a quick update" but you'd "rather speak on the phone".

2. **Do** tell me a did a great job, even if I was mediocre.

3. **Do** give me problems that I find challenging but that I ultimately solve.
Make their difficulty just within reach so I feel really good about solving them.
That psychological calculation also tells me that
I'm "lucky to work here" because I "barely made it" rather than a super easy
problem that doesn't make me feel special.

4. **Don't** be offended if I try to squeeze everything from this offer I possibly
can.

5. **Don't** tell me you have my best interests at heart. Your goal as a
recruiter is to make me sign and give me as little information as you can
get away with. If I find out I don't like something _after_ I've started I'm
more likely to try to live with it.

6. **Don't** hire me. Where's your diversity? I am a child.


A good interview will scale the level of difficultly and make the candidate feel
accomplished at every step, like a good video game
(that is, only if you actually want to hire him/her/them).

_Make me feel special, lure me in, then wring me out._

---

Just because they're listed here doesn't mean I can solve them.
I'll keep adding to this list as I get more questions
(which will hopefully be very rarely, interviewing is no fun).
The Questions (in no particular order):

### Multiplication Table

Print an `n` by `n` multiplication table, keep the widths of the columns consistent.

### Calculator

Evaluate a mathematical expression like `1 + 3 * 2` and respect the traditional
order of operations. This is sometimes given with / without parenthesis,
but you generally just do
[this](https://en.wikipedia.org/wiki/Shunting-yard_algorithm).

### PIN Check

Write a function that lives on an embedded device that checks if a given pin is
equal to a stored pin. This might seem easy at first but it was asked from a
security point-of-view so it needed to be resistant against timing and
power-glitching attacks (and maybe more that I don't know about).

### Leader Board

Write a data structure to hold a leader board for a video game.
You must be able to efficiently insert and update a player's score
_and_ efficiently retrieve the n<sup>th</sup> best player.

### String Subset

Given a list of (English) words and a set of characters, which word is the
shortest and uses all the characters in the set?
What if this wasn't just English?

### Duplicate Strings

Given a large text find duplicate sections larger than `k` characters within it
(efficiently, of course).
If `k = 3` and the text was "sea shells by the seashore" then `sea` is
a duplicate because its at least `k` characters and appears more than once.
You should be able to do this in linear time.

### LRU Cache

I got this one twice already!
This is a cache that has a limited capacity `n`, it will cache that many values
until the limit is reached. If the cache is over capacity it will drop its
Least Recently Used (LRU) key. A use counts as retrieving or setting the value.
It's well-known that both operations of this cache (setting and getting) must
preform in constant time and there's many examples online of how to achieve this.

### Median Across Lists

Given two _sorted_ lists return the median you would get if you were to combine
the two lists. This should be in logarithmic time.

### Leaf to Leaf

Find the longest path in a tree from a root to a leaf, then find the longest
path between leaves (without repeating edges of course).
This is in linear time and lends itself well to recursion.

### Breaking the Safe

A safe is guarded by a number pad that accepts a four digit pin.
There's no "submit" button though so as soon as you enter the correct
four digits the safe will unlock. This means entering "12345" will have
the effect of attempting "1234" and "2345".
What's the shortest string that brute-forces all combinations?

There is actually some graph theory behind this that I learned a while ago
but I don't remember, but under some (all?) conditions it should be
possible to find the minimum-length string.
I wasn't given a time constraint here because of the limited solution space.

### 2 Sum Below

Given a list of numbers find the two largest numbers whose sum is below `k`.

### Word Reverse

Reverse the order of words in a sentence, not the characters within the words.
My favorite solution is in Haskell:

```haskell
rev_words = unwords . reverse . words
```

This is easy so the usual follow-up is how to do it in constant space.

### Find the Diff

Given two lists of integers, find the one element that is different in both
of them.

This one is really instructive because you go from an _n_<sup>2</sup>-time
solution all the way down to an <i>n</i>log<i>n</i> and even _n_.
You can also do this in _n_ time and _constant_ space!

### Coin Change

Given a value `v` and a list of coin denominations find all the possible ways
to represent `v` in the given denominations (the number of ways to make
change for cash).

### Grid Path

If you can only walk up and to the right on a two-dimensional grid, how many
possible ways are there to get to `(x, y)`? Note that there's a formula
(close form) for this so technically this can be solved in constant time but
I've never been asked to do that.

### 3 Sum

Given a list of numbers, find all triplets that sum to zero.

### Fibonacci

Calculate the n<sup>th</sup> Fibonacci number.
This is often asked in the form of "do a slow recursive one", then
"a fast recursive one", then a "fast non-recursive one".
Although if you didn't know about recursion you'd probably get to the
answer they want quicker.
