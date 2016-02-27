---
layout: post
title: SecurityHeaders.io CLI
date: 2016-02-27 12:34:40
categories: [securityheaders, tools, hacking]
tags: [tools, hacking, pentest]
---
Recently I discovered the awesome [SecurityHeaders.io][securityheadersio] service - A project by Scott Helme.
It provides you a simple way to take a look at a server configuration by analyzing the HTTP headers of a response to a specific request to an URL. It then points out improvements you can make to tighten up your server configuration.

Why should I be interested in these headers? Well, there are a lot of tools out there to scan a server and point out possible vulnerabilities of specific versions of services running on the server. For example per default a *nginx* server will add the *Server* HTTP Attribute to all response with a value similar to `nginx/1.5.6`. Or an Apache server on a raspbian gives something like this per default `Server: Apache/2.4.10 (Raspbian)`. This makes it very easy for an attacker to search for possible vulnerabilities of your server - You want to obscure and hide this information.
There are other types of headers - headers which help to prevent certain types of attacks. There is for example a *X-XSS-Protection* header to protect you again some type of *XSS* vulnerabilities. As well as headers to harden your SSL connection like the *Strict-Transport-Security* header.

## The Website

Let's take a quick look at the [SecurityHeaders.io][securityheadersio] webinterface and scan the *github.com* URL:

![SeuciryHeaders.io GitHub - Web]({{ site.url }}/assets/securityheaders.io-cli/securityheadersio_web.jpg)


As you scan *github.com* got a rating of an *A+* which is the best rating you can get. For a quick overview you can just check the *Headers*-Badges in the first table.

## The CLI

I'm a big fan of the console and actually I spent most of the time on my computer on a console. If I want to scan a website I don't want to go to the browser and type the URL there. Because of that reason I've built a CLI application to use to services of [SecurityHeaders.io][securityheadersio]. This CLI application is entirely written in python, it's open source and available through pip. Check out the [GitHub repository][github-repo], too.

Install the CLI on your machine:

```bash
pip3 install securityheaders
```

After the installation is completed a `securityheaders` command should be available:

```bash
$ type securityheaders
securityheaders is /usr/local/bin/securityheaders
```

Let's do the same scan again with the CLI version:

```bash
$ securityheaders https://github.com
...
```

![SeuciryHeaders.io GitHub - Web]({{ site.url }}/assets/securityheaders.io-cli/securityheadersio_cli.jpg)

Very easy, huh?

Let's see what other options we have:

```
securityheaders --help
Usage: securityheaders [OPTIONS] URL

  Get Security Headers from a given URL.
  The data is fetched from SecurityHeaders.io.

Options:
  --version  Show the version and exit.
  --json     Print the Security Headers analysis as JSON
  --help     Show this message and exit.
```

As you can see there is a `--json` option to get the scan results as a JSON object. You can use this to integrate `securityheaders` into your own application.


Please leave me your feedback! Use this [Issue Tracker][github-issues] for any issues you may encounter! Have fun!

[securityheadersio]: https://securityheaders.io
[github-repo]: https://github.com/timofurrer/securityheaders
[github-issues]: https://github.com/timofurrer/securityheaders/issues
