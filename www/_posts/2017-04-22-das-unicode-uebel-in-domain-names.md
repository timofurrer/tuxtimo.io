---
layout: post
title:  "You've been phished! - Das Unicode-Uebel in Domain Names"
date:   2017-04-22 17:13:50 +0200
categories: unicode security phishing
---

Kennen Sie die Firma Alexa Internet Inc (Alexa)? Alexa ist eine Tochterfirma von Amazon.com die Daten ueber Seitenabrufe von Websites
sammelt, analysiert und kommerziell zur Verfuegung stellt.
Die Firmen Website ist unter alexa.com publiziert.

Tun Sie mir den gefallen und besuchen Sie die Firmen Website unter [alexa.com] und anschliessend folgende Website: [alexa.com](http://www.аӏеха.com).
Sie werden den Seiteninhaltsunterschied definitiv bemerkt haben, doch haben Sie auch den Unterschied in der Adressleiste entdeckt?

<br>
<img src="https://raw.githubusercontent.com/timofurrer/idn-homograph-attack/master/results/alexa.com_addressbar_comparison.png?token=AA9ifICxTXqP6qtDp-DspmjbFTZaPMxaks5ZBgcEwA%3D%3D" alt="alexa.com firefox addressbar comparison" class="img-responsive center-block img-thumbnail shadow-block">
<br>

Was geht da vorsich? Ist das wirklich die gleiche Adresse? Wurde gerade mein Computer mit einem Virus infisziert?

Nein, da ist weder ein Virus im Spiel noch ist das die gleiche Adresse die da in der Adressleiste steht.
Je nach Schriftart die der Browser benutzt um die Adresse darzustellen, ist jedoch nur ein leichter bis gar kein Unterschied von blossem Auge auszumachen.

Was auf [alexa.com](http://аӏеха.com) zu sehen ist, ist eine Demonstration eines sogenannten [IDN Homograph Attack]s.
Diese Attacke zeigt, dass es moeglich ist mit kluger Auswahl von Zeichen aus einem fremden Alphabet eine Domain zu gestalten die einer anderen visuell sehr aehnelt.

[alexa.com]: http://alexa.com
[аӏеха.com]: http://аӏеха.com
[IDN Homograph Attack]: https://en.wikipedia.org/wiki/IDN_homograph_attack
