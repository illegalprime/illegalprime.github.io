---
title: "Automatic Southwest Check In"
layout: post
tags:
  - code
---

Like all men I exist for and because of woman.
You see where this is going? Southwest allows me cheap air fare but at
the cost of remembering and sometimes waking up explicitly to check in online
to get an early seat. Why is this important?

<div class="message"><i>The early bird gets the girl (earlier).</i></div>

Every time I fly to see Janie I'm just as excited as the last time,
so I'm always interested in shaving off valuable _minutes_ of time apart.
With all of this in mind it should be no surprise that I've written
an automatic check in script in `phantom.js`.

If you're unfamiliar with `phantom.js` its a scriptable headless web browser.
You write some javascript (gross) to control a browser and automate some
tasks for you. It should be in your distros' repos:

```bash
pacman -S phantomjs
apt-get install 'something'
emerge 'some-such'
```

In short there are a three steps to check in, and you have to eval the webpage
to get all the cookies to let you do this right. So `phantom.js` was a quick and
easy solution:

```javascript
/*!
 * Southwest Check In v0.1
 * GPLv3 License
 */
var page = require('webpage').create();

page.onLoadFinished = function(status) {
    // we didn't succeed loading the damn thing!
    // exit with an error code, hopefully a parent process
    // can try again after a delay
    if (status !== 'success') {
        console.error("Could not load URL: " + page.url);
        phantom.exit(1);
    }
    // enter the first and last name, and the confirmation number
    if (page.url.match(/retrieveCheckinDoc\.html/)) {
        page.evaluate(function(confirmation, first_name, last_name) {
            document.getElementById('confirmationNumber').value = confirmation;
            document.getElementById('firstName').value = first_name;
            document.getElementById('lastName').value = last_name;
            document.getElementById('itineraryLookup').submit();
        }, confirmation, first_name, last_name);
    }
    // just click through past the confirmation page
    else if (page.url.match(/selectPrintDocument\.html/)) {
        page.evaluate(function() {
            document.getElementById('printDocumentsButton').click();
        });
    }
    // at this point you're technically checked in, but we'll try
    // to tell you which boarding position you got.
    // this is also helpful so you can test if the script worked
    else if (page.url.match(/selectCheckinDocDelivery\.html/)) {
        var flight_info = page.evaluate(function() {
            var output = [];
            var details = document.getElementsByClassName('itinerary_content');
            var rows = details[0].getElementsByTagName('tr');
            // the first row is the header
            for (var i = 1; i < rows.length; i += 1) {
                var info = rows[i].getElementsByClassName('boardingInfo');
                var seat = "";
                for (var j = 0; j < info.length; j += 1) {
                    seat += info[j].innerHTML;
                }
                output.push(seat);
            }
            // for each passenger gives ["B1", "B2", etc..]
            return output;
        });

        console.log("Seats:");
        for (var i = 0; i < flight_info.length; i += 1) {
            console.log("\t" + flight_info[i]);
        }
        phantom.exit(0);
    }
}

// open the online checkin page and start the process
page.open('https://www.southwest.com/flight/retrieveCheckinDoc.html');
```

Keep in mind that this is just the phantom.js snippet and it needs three
variables to be in scope to work:

```javascript
var confirmation = 'A0AAAA';
var first_name = 'Michael';
var last_name = 'Eden';
```

But of course yours will be different than mine.
The real win is if in the future I make this into a daemon
that listens to my Google Calendar events and even emails me
the boarding pass after check in.

Run with `phantomjs script.js` and keep this in mind on your next red-eye.
