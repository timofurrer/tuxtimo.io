---
layout: post
title: Python's Exception Hierarchy. Why?
date: 2016-02-28 16:00:00
categories: [python, python3]
tags: [python, python3, exceptions, problems, screw-up]
---

The other day I was really frustrated by Python's Exception Hierarchy. Let me explain you why:
From time to time you might want to do something like this although I highly recommend _not_ to do this:

```python
try:
    # do some stuff
except Exception as e:
    logging.error("Got exception: '{0}'".format(e))
```

As I said, sometimes you really want to do that - let's say in the main event loop of your sever application or in a loop running tasks sequentially.
However, did you know that exceptions like `SyntaxError`, `NameError` or `SystemError` inherit from `Exception`, too? ... Instead of maybe `BaseException`?

The thing is if I want to catch all exceptions which might be raised while running arbitrary tasks I'm ending up catching all these exceptions, too - like `SyntaxError` etc. I definitely don't want to catch them though, right?

Let's have a quick look at [Python 3.5's built-in Exception Hierarchy][python-exception-hierarchy]:

```
BaseException
 +-- SystemExit
 +-- KeyboardInterrupt
 +-- GeneratorExit
 +-- Exception
      +-- StopIteration
      +-- StopAsyncIteration
      +-- ArithmeticError
      |    +-- FloatingPointError
      |    +-- OverflowError
      |    +-- ZeroDivisionError
      +-- AssertionError
      +-- AttributeError
      +-- BufferError
      +-- EOFError
      +-- ImportError
      +-- LookupError
      |    +-- IndexError
      |    +-- KeyError
      +-- MemoryError
      +-- NameError
      |    +-- UnboundLocalError
      +-- OSError
      |    +-- BlockingIOError
      |    +-- ChildProcessError
      |    +-- ConnectionError
      |    |    +-- BrokenPipeError
      |    |    +-- ConnectionAbortedError
      |    |    +-- ConnectionRefusedError
      |    |    +-- ConnectionResetError
      |    +-- FileExistsError
      |    +-- FileNotFoundError
      |    +-- InterruptedError
      |    +-- IsADirectoryError
      |    +-- NotADirectoryError
      |    +-- PermissionError
      |    +-- ProcessLookupError
      |    +-- TimeoutError
      +-- ReferenceError
      +-- RuntimeError
      |    +-- NotImplementedError
      |    +-- RecursionError
      +-- SyntaxError
      |    +-- IndentationError
      |         +-- TabError
      +-- SystemError
      +-- TypeError
      +-- ValueError
      |    +-- UnicodeError
      |         +-- UnicodeDecodeError
      |         +-- UnicodeEncodeError
      |         +-- UnicodeTranslateError
      +-- Warning
           +-- DeprecationWarning
           +-- PendingDeprecationWarning
           +-- RuntimeWarning
           +-- SyntaxWarning
           +-- UserWarning
           +-- FutureWarning
           +-- ImportWarning
           +-- UnicodeWarning
           +-- BytesWarning
           +-- ResourceWarning
```

I see a few Exceptions here I usually don't want to catch:

- ImportError
- MemoryError
- NameError
  - UnboundLocalError
- SyntaxError
  - IndentationError
    - TabError
- SystemError
- Warning

Let's say I really have this case - How do I workaround it? Not to catch these exceptions, too?

Maybe only catch all exceptions I really want:

```python
try:
    # do some stuff
except (StopIteration, StopAsyncIteration, ArithmeticError, ...) as e:
    logging.error("Got exception: '{0}'".format(e))
```

Looks like crap, doesn't it? There are just to many of them.
We could exclude the exceptions we don't want to catch?

```python
try:
    # do some stuff
except Exception as e:
    if isinstance(e, (ImportError, MemoryError, NameError, ...)):
        raise
    logging.error("Got exception: '{0}'".format(e))
```

Well, maybe - But still. This looks not like code I want in my code base..

So my conclusion about all this:

**Python's Exception Hierarchy seems to be screwed up!**

.. still. (It was similar in Python 2)

The question I'm asking myself is: *Why doesn't `SystemExit`, `KeyboardInterrupt` and `GeneratorExit` inherit from `Exception?`* What's the difference in the use case of `SystemExit` and for example `SyntaxError`?

For me a good solution would be to move all these named exceptions out of the `Exception` tree and maybe introduce another base exception class for these *ProgrammingErrors* or however you want to call it.


[python-exception-hierarchy]: https://docs.python.org/3/library/exceptions.html#exception-hierarchy
