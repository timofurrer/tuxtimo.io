---
layout: post
title: GitHub's Password Treasury - Be careful!
date: 2016-02-28 16:40:00
categories: [github, security]
tags: [github, security, passwords, keys]
---

A few times a stumbled over passwords, secret tokens, private RSA keys etc. stored in public GitHub Repositories.
So, I was curious how much more I could find if I search for them. Can I use Google to find stored passwords and such in GitHub Repositories using queries including `site:github.com`? Of course it'd be possible but we can just use the GitHub's Search functionality directly, right?

I was really shocked about how many username-password combinations, secret tokes, private keys etc. I could find using GitHub's Search.

I used very easy terms in the format of `<service> password` and search terms in combination with the `path:` attribute for a more specific search. For example let's search for heroku passwords by using a search term like
`heroku password` or search for GitHub passwords with `github password`. Well, maybe you have to page through the results a little but ... that doesn't prevent the bad guys from stealing your secrets ...

Even more specific searches work absolutely fine. For example to find email account passwords in *muttrc* files:

`password path:mutt` - [GitHub Search Results](https://github.com/search?q=password+path%3Amutt&ref=searchresults&type=Code&utf8=%E2%9C%93)

Or use the following to find FreeNode IRC account passwords in *irssi* configuration files:

`NickServ identify path:irssi` - [GitHub Search Results](https://github.com/search?utf8=%E2%9C%93&q=NickServ+identify+path%3Airssi&type=Code&ref=searchresults)

Or find private RSA keys:

`BEGIN RSA path:id_rsa` - [GitHub Search Results](https://github.com/search?utf8=%E2%9C%93&q=BEGIN+RSA+path%3Aid_rsa&type=Code&ref=searchresults)

Or specify the server - maybe a password configuration is not far:

`mysql.binero.se` - [GitHub Search Results](https://github.com/search?utf8=%E2%9C%93&q=mysql.binero.se&type=Code&ref=searchresults)

To be clear, I don't want to invite or challenge you to find passwords and do bad things with them - **No** - I want to show you how easy it is to find passwords in source code and with that I __want you to be very careful__ when pushing to your repository. Even simple statements in a your `.gitignore` can help preventing you from uploading secret files like private keys.

> Just be careful with what you publish
> **And don't be an asshole!**
