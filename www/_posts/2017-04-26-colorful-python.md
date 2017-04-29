---
layout: post
title:  "colorful - Terminal string styling done right, in Python"
date:   2017-04-26 17:13:50 +0200
author: Timo Furrer
categories: python
---

Almost three weeks ago I've published an initial release of [colorful] on PyPI and GitHub
and it already got some attention by having a few stars over 200 on GitHub.

**colorful** is a Python package which provides an expressive and easy to use API to style
strings to output in your terminal. Hence the short description *Terminal string styling done right, in Python*.

That's neither a new invention nor the first package in the Python ecosystem which provides similar support.
Thus, not a big deal ... until you want to:

* have full 24bit true color support
* choose between other available color modes like the 8 or 256 ANSI colors
* nest styled strings
* not mess up the `len()` on your styled strings

All these features were things on my wishlist for quite some time.
So I've decided to have a look at some popular packages like colorama, termcolor and blessings and see if I can
come up with some patches which would contribute the above mentioned features.
After some time digging into the docs and code of those projects I just couldn't fit my features and ideas into
their architecture, design or set of already available features -
I wanted to have a clean and human-ready API without having to deal with a legacy one.

A day or two later I did `git init colorful` and started hacking on it.

In the beginning I just wanted to have some quick prototype to have a proof-of-concept for my API ideas.
So I didn't even bother about termcap or terminfo at all which turned out to be not that bad of a decision.
You'll read later why.

Let's have a look at some of the initial API ideas:

```python
# Use method names to style strings, like many other support (blessings, coleur, ..)
s = colorful.bold_red('Spam and eggs')

# Use string formatting
s = f'{colorful.bold_red}Spam and eggs{colorful.reset}'

# combining and piping
s = colorful.bold & colorful.red | 'Spam and eggs'

# nesting
colorful.red('red {0} red'.format(colorful.blue('blue')))
colorful.red('red' + colorful.blue(' blue ', nested=True) + 'red')

# string length
assert len(s) == len('Spam and eggs')

# change the color mode
colorful.use_true_colors()
colorful.use_256_ansi_colors()
colorful.disable()
```

All these features were easier to implement than I initially thought. Most of the time I just had to implement
the correct data model protocols like `__str__`, `__len__`, `__add__`, `__or__` on my classes to make my API work.

What helped a lot were my [pytest tests](https://github.com/timofurrer/colorful/tree/master/tests) which I've writting in advanced during the thinking process of how one should
use *colorful*. I recommend everyone to do the same: to think about how a user of your module or package would like to interact with it.
That's key when designing an API!

Once I've had my tests passing I started writing some documentation and with that some new feature ideas came up:

* support for [X11 color names]
* support for custom color names assigned to custom RGB values
* support for predefined styles

With those ideas *colorful* gained some new features:

```python
# use X11 rgb.txt color names
s = colorful.lightCoral_on_snow('Spam and eggs')

# define custom color palettes
colorful.update_palette({'mint': '#c5e8c8'})
s = colorful.mint('Spam and eggs')

# use predefined color styles
colorful.use_style('solarized')
s = colorful.red_on_green('Spam and eggs')
```

At the moment *colorful*s API was already extended with helper functions like `colorful.print()` or `colorful.format()` and more.
I recommend you to have a look at the documentation here: [https://github.com/timofurrer/colorful](https://github.com/timofurrer/colorful)

### "done right", doesn't that imply using terminfo?

*colorful* uses hardcoded ANSI escape sequences to create styled strings. In the beginning this was just meant to be used in the prototype
and replaced with proper ANSI codes from the appropriate terminfo database once I'm happy with the API.
However, terminfo turned out to be quite, ..., *"outdated"*. For example a major feature I wanted to have is true colors. But terminfo doesn't
support true colors - and probably it won't be implemented any time soon, as you can read [here](https://lists.gnu.org/archive/html/bug-ncurses/2013-10/msg00007.html).

This wasn't the only thing I've missed:

* no support for true colors
* where is the *no bold* code (22) stored in the db?
* where is the reset to *default fore- / background color* codes (39/49) stored in the db?
* there were some more I don't remember ...

Another drawback when using terminfo would have been the dependency to curses which could be a problem on Windows and for PyPy and other Python interpreters.

Easy to solve: I just sticked to hard coded ANSI escape code sequences - any ways, these days the escape codes are the same for almost all terminals commonly used.

### Why you should use colorful in your next project

Most of the reasons why you should use colorful in your next terminal project did I already mention above.
<br>
But again, here they are:

* **expressive** and human friendly **API**
* full 24bit **true color** support (if your terminal supports that, too)
* support **8** and **256 ANSI colors**
* support **X11 color names**
* easily **nest** styled strings
* correctly support **string lengths**
* support **custom color palettes**
* support **predefined styles**
* actively maintained
* thorough unit test suite

Again, the [documentation] on GitHub has more detailed information about each of these points.

Have fun with [colorful] :tada:!

[colorful]: https://github.com/timofurrer/colorful
[documentation]: https://github.com/timofurrer/colorful/blob/master/README.md
[X11 color names]: https://en.wikipedia.org/wiki/X11_color_names
