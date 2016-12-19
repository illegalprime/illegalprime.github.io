---
layout: post
title:  "Heavy Duty Motion Detector: Part I"
date:   2014-08-01
tags:
  - circuits
---

# The Idea

THE HEAVY DUTY MOTION DETECTOR can detect any human or wild animal that is not asleep, and also not strictly not asleep. The documentation isn't written well. On motion detection it will switch on an outlet, which could power any appliance (most likely a lamp or a toaster)!

I say this because it only detects infrared wavelengths of 7 to 14 nanometers (waves emitted near the human body temperature) and objects moving faster than 1 m/s.

It is completely modular! So more large elements, like delays, monostables, and flip flops can be added at anytime. I'm pretty tempted to add these along with a clock circuit for a strobe light!

## Why?

Long ago the light switch in my closet broke, forcing me to use the pull chain switch to bring light to my otherwise dim clothes. As I stood there in my shame pulling a string of yarn I had tied to lengthen the chain, I realized there was a better way.

### A Better Way

Tying the yarn to a hook on the inside of my closet door pulled the light on as I pulled the door open.

BAM! Automatic light. I though WOW. I made it.

### Sounded Better In My Head

It didn't work. I would have to close the door on myself while still in the closet to reset the switch, and I did not have the energy to swing doors back and forth all day.

# To Rectify the Situation

Bad puns aside, I decided I would go ahead and try to make an automatic light with the help of my Grandfather, [Robert Kasimov](http://patents.justia.com/inventor/robert-s-kasimov).

First there needed to be a power supply to power the sensor and the relay. This meant building a AC/DC converter to transform 120V AC to

 - 12-15V @ 35mA DC for the Relay and
 - 3.3-5V @ 800μA DC for the PIR Sensor (both from RadioShack)

and for the record I don't recommend getting anything at RadioShack: their selection is really very limited and at my location at least nothing is ever in order. This is the only circuit component place in Nashville though.

Our work on Part I is as follows:

{% include image.html url="/media/hdmd-acdc-converter/circuit.png" description="Here is the AC/DC Converter Circuit Schematic" %}

Now the first 1μF capacitor is there to limit the current of our circuit to be close to 35mA, it provides an impedance that results in a current I:

{% include image.html url="/media/hdmd-acdc-converter/mathsForCapacitor.png" %}

A capacitor is used instead of a 6 Watt resistor because it heats up significantly less. Another small 100Ω resistor is placed in series to act as a fuse, burning up if it ever goes beyond its power rating, which is 0.25 Watts. This gives a maximum current of:

{% include image.html url="/media/hdmd-acdc-converter/mathsForFuse.png" %}

A little solder and a lot of connections later:

{% include image.html url="/media/hdmd-acdc-converter/cover.jpg" description="The end product!" %}

Hey! Michael! That end product has more components than the schematic. What you tryin to pull?

Well I didn't have Zener diodes with enough voltage so I used one that is about 10V and another that is 3.3V. To bump the 3.3V to a safer 4.5V, I padded it with two normal diodes adding 0.6V each to the sum:

{% include image.html url="/media/hdmd-acdc-converter/diode-hack.png" description="Diode Hack" %}

Finally, here is the PCB layout I made for the circuit, you can download the netlist data for the entire project [here](/media/hdmd-acdc-converter/ThreeBoards.cir).

{% include image.html url="/media/hdmd-acdc-converter/acdc-board.png" description="Board is about 55x23 mm" %}
