---
layout: post
title:  "Top 1 Million Sites vulnerable to IDN Homograph Attacks"
date:   2017-05-16 10:13:50 +0200
author: Timo Furrer
categories: infosec phishing
---

Security Researcher Xudong Zheng published a [nice article] about his study on IDN Homograph Attacks.
It shows how easy it can be to lure people to a faked site using similar looking characters from another
alphabet or script than the original one.

I was curious if big companies register [Internationalized domain names] which can be represented with foreign
characters to look similar to their main domain themselves.

The Unicode®, Inc. maintains a list of [confusable characters].
I've curated this list with the characters which are looking similar in the cyrillic and latin alphabet and
came up with the following mapping:

```python
#: Holds a mapping of latin characters to similar looking cyrillic characters
cyrillic_latin_match = {
    'a': 'а',
    'e': 'е',
    'h': 'һ',
    'i': 'і',
    'j': 'ј',
    'l': 'ӏ',
    'o': 'о',
    'p': 'р',
    'r': 'г',
    's': 'ѕ',
    'w': 'ԝ',
    'x': 'х',
    'y': 'у'
}
```

I've used a [dirty Python Script] to search in *Alexa's Top 1 Million Websites* list for domains which can be
completely represented with similar looking characters from the cyrillic alphabet.

As it turned out **5644 of this 1 Millions sites are vulnerable** to a IDN Homograph Attack. Considering that I only
checked for domains which can be represented entirely in the cyrillic alphabet (thus, only composed of the above 13
characters) this is a fair amount of domains.

To demonstrate it I've registered three of those domains:

* [alexa.com]
* [opera.com]
* [php.net]

You can have a look at the complete list of vulnerable sites here:

* [Raw List]
* [CSV List]

Some major Browsers already released a fix, like Google Chrome with Version 58 in Mid April.
This fix shows risky unicode domains punycoded in the URL bar of the Browser which helps users to spot phishing attempts.

[nice article]: https://www.xudongz.com/blog/2017/idn-phishing/
[Internationalized domain names]: https://en.wikipedia.org/wiki/Internationalized_domain_name
[confusable characters]: ftp://ftp.unicode.org/Public/security/8.0.0/confusables.txt
[dirty Python Script]: https://github.com/timofurrer/idn-homograph-attack/blob/master/scripts/find_domain.py
[alexa.com]: http://аӏеха.com
[opera.com]: http://орега.com
[php.net]: http://рһр.net
[Raw List]: https://raw.githubusercontent.com/timofurrer/idn-homograph-attack/master/results/idn_ha_vuln_sites_alexa_top1m.txt
[CSV List]: https://raw.githubusercontent.com/timofurrer/idn-homograph-attack/master/results/idn_ha_vuln_sites_alexa_top1m.csv
