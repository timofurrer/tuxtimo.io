---
layout: post
title:  "Das Unicode-Uebel in Domain Names"
date:   2017-04-22 17:13:50 +0200
author: Timo Furrer
categories: unicode security phishing
---

Wie erkennt man eine Phishing Attacke wenn man beispielsweise per E-Mail einen Link bekommt?

Genau, bevor man diesen oeffnet schaut man sich vielleicht die Linkvorschau des Mail Programms an, ob die Webseiten Adresse vertraut und richtig ausschaut, oder?
Wenn man dann den Link angeklickt hat und sich die gewueschte Webseite oeffnet ist meist schon aller Zweifel, auf eine Phishing Webseite gelangt zu sein, verschwunden.
Ist man ein bisschen paranoider schaut man sich vielleicht die Adresse nochmals in der Adressleiste des Browsers an und ueberprueft ein allfaelliges SSL Zertifikat.

Doch was waere wenn die Webseiten Adresse weder in der Vorschau noch der Adressleiste des Browser noch im ausgestellten SSL Zertifikat visuell fuer einen Menschen von einer Phishing-Seite nicht zu unterscheiden waere?

Kennen Sie die Firma Alexa Internet Inc (Alexa)? Alexa ist eine Tochterfirma von Amazon.com, die Daten ueber Seitenabrufe von Webseiten
sammelt, analysiert und kommerziell zur Verfuegung stellt.

Tun Sie mir den Gefallen und besuchen Sie die Firmen Website unter [alexa.com] und anschliessend folgende Website: [alexa.com](http://www.аӏеха.com).
Sicher haben Sie den unterschiedlichen Seiteninhalt bemerkt, doch haben Sie auch den feinen Unterschied in der Adressleiste entdeckt?

<br>
<img src="https://raw.githubusercontent.com/timofurrer/idn-homograph-attack/master/results/alexa.com_addressbar_comparison.png?token=AA9ifICxTXqP6qtDp-DspmjbFTZaPMxaks5ZBgcEwA%3D%3D" alt="alexa.com firefox addressbar comparison" class="img-responsive center-block img-thumbnail shadow-block">
<br>

Was geht da vor sich? Ist das wirklich die gleiche Adresse? Ist da eine Malware mit im Spiel?

Nein, da ist weder ein Virus im Spiel noch sind das die gleichen Adressen die da in der Adressleisten stehen.

Was auf [alexa.com](http://аӏеха.com) zu sehen ist, ist eine Demonstration eines sogenannten [IDN Homograph Attack]s.
Diese Attacke zeigt, dass es moeglich ist, mit kluger Auswahl von Zeichen aus einem fremden Alphabet eine Domain zu gestalten die einer anderen visuell sehr aehnelt.

Dies wurde ermoeglicht durch die Implementation von [Internationalized domain names] \(IDN), die es erlaubt den ganzen Unicode-Zeichensatz in Domains zu gebrauchen.
Der Vorteil darin ist, dass Webaddressen auch in anderen Sprachen, als nur Englisch, mit nativen Zeichen angezeigt werden koennen.
Das Problematische jedoch ist, dass zwischen gewissen Zeichen aus verschiedenen Alphabeten innerhalb des Unicode-Zeichensatzes bei den meisten Schriftarten visuell kaum mehr unterschieden werden kann.
Oder dann werden fremde, nicht unterstuetzte Zeichen gar mit den unterstuetzen aehnlich aussehenden komplett ersetzt, was eine Unterscheidung unmoeglich macht.
Beispielsweise ist das kleine `a` im latinischen Alphabet kaum vom kleinen kyrillischen `а` zu unterscheiden oder auch das latinische kleine `e` vom kyrillischen kleinen `е`.

Bereits bei der Einfuehrung von IDN im Jahr 1998 wurden solche Attacken vermutet und seit 2001 sind diese Homograph Attacks auch den Browserherstellern bekannt.

Weil jedoch die Unterscheidung zwischen legitimen und Phishing Domain Names fuer die Browser fast unmoeglich zu machen ist, gab es immer wieder Probleme beim Versuch
diese "Sicherheitsluecke" in den Browsern zu beheben. Einige Browserhersteller, wie z.B. Mozilla, weisen auch die Schuld von sich, fuer dieses Phishingriskio, verantwortlich zu sein.
Sie argumentieren damit, dass die Domain Name Registrars dafuer verantwortlich seien nur Domain Names zu vergeben die visuell nicht mit einer bereits registrierten verwechselt werden koennten.

Ende Januar 2017 hat der chinesiche Security Researcher Xudong Zheng das [Interesse der Browserhersteller], dieses Phishingrisiko zu minimieren, wieder geweckt.
Daraufhin wurde am 19 April 2017 die Version 58 von Google Chrome veroeffentlicht, welche Adressen mit Verwechselungsrisiko mit [Punycode] kodiert, sodass diese nur im [ASCII] Zeichensatz darstellt werden.
So wird aus der risikobehafteten Adresse [alexa.com](http://www.аӏеха.com) die Adresse [xn--80aao8dw1b.com](http://xn--80aao8dw1b.com), welche nicht mehr so einfach verwechselt wird.

Andere Browser wie Mozilla Firefox oder Opera warten immer noch auf einen entsprechenden Fix.
Manche dieser Browser, wie beispielsweise Firefox, bieten ihren Benutzern die Moeglichkeit die Webadressen in der Adressleiste immer *Punycode kodiert* anzuzeigen,
was schon viel hilft eine Phishing Attacke fruehzeitig zu erkennen und die Webseite zu verlassen.

[alexa.com]: http://alexa.com
[аӏеха.com]: http://аӏеха.com
[IDN Homograph Attack]: https://en.wikipedia.org/wiki/IDN_homograph_attack
[Internationalized domain names]: https://en.wikipedia.org/wiki/Internationalized_domain_name
[Interesse der Browserhersteller]: https://bugs.chromium.org/p/chromium/issues/detail?id=683314
[Punycode]: https://de.wikipedia.org/wiki/Punycode
[ASCII]: https://de.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange
[opera.com xxx]: https://орега.com
[php.net xxx]: http://рһр.net



