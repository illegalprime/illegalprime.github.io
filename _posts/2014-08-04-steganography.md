---
layout: post
title:  "Bitshifts & Safetybelts"
date:   2014-08-04
tags:
    - code
---
# The Steganographic Way

Look at this picture of Andy, do you see a hidden message?

{% include image.html url="/media/2014-08-04-stickshifts-n-safetybelts/andy-encoded.png" description="The text 'Hello World!' is encoded into this image." %}

'Hello World!' is able to live inside that image using one common method of Steganography:
["the art or practice of concealing a message, image, or file within another message, image, or file"](https://en.wikipedia.org/wiki/Steganography).

To visualize this hiding we first transform the message into binary (using Unicode):

```c
        H                       e
0000 0000 0100 1000     0000 0000 0110 0101
        l                       l
0000 0000 0110 1100     0000 0000 0110 1100
        o                       space
0000 0000 0110 1111     0000 0000 0010 0000
        W                       o
0000 0000 0101 0111     0000 0000 0110 1111
        r                       l
0000 0000 0111 0010     0000 0000 0110 1100
        d                       !
0000 0000 0110 0100     0000 0000 0010 0001
```

The idea here is to take all the bits and place each of them on one pixel of the image. Since there are 192 bits (count them!) we will need a image file that is at least 192 pixels. Good thing our picture of Andy is 496 x 274 = 135904 pixels! This gives you an idea of exactly how much you can fit into Andy.

So where in the pixel do we put this bit?? Well each pixel in an image must be a fixed number of bits long (so computers can read the image correctly), so we cannot just squeeze this bit in between the bits of the pixel. No, the only other option is to

 - Pick a bit in the pixel
 - Remove this bit
 - Replace it with a bit from the message
 - Repeat until all message bits are in pixels

To change the color of the pixel the least (to make our efforts the more inconspicuous) we are going to peel of the LSB (least significant bit) from the image. Here's a visual:

<table>
<tr><td></td><td>Before</td><td>After</td></tr>
<tr>
<td>Replacing the most significant bit (left most)</td>
<td style="background-color:#0000FF;font-family:monospace;color:white;">000000000000000011111111</td>
<td style="background-color:#8000FF;font-family:monospace;color:white;">100000000000000011111111</td>
</tr>
<tr>
<td>Replacing the least significant bit (right most)</td>
<td style="background-color:#0000FF;font-family:monospace;color:white;">000000000000000011111111</td>
<td style="background-color:#0000FE;font-family:monospace;color:white;">000000000000000011111110</td>
</tr>
</table>

Of course there is a 50% chance that the bit we remove and the bit we replace will coincidentally be the same. In this case literally nothing is changed for that pixel.

# The Code

I've, after learning about this method, written a program to automate the process. In it though I have reserved the first 32 pixels to tell the program how long the message is so it will know how much of the image to decode.

Written in C++ & Qt, the code starts by creating a copy of the image so the copy can be changed and encoded. It then initializes x and y, which represent the coordinates of the image: (0, 0) means top left. Finally it gets the message length to encode into the first 32 pixels of the image.

```c++
QImage* Cipher::encodeImage() {
    QImage* encodedImage = new QImage(image.copy(0, 0, image.width(), image.height()));
    int x = 0, y = 0, header = message.length();

    if (message == NULL || bitsPerPixel == 0) {
        return encodedImage;
    }
```

then we have this ugly thing:

```c++
    for (int mask = 0x0001; mask != 0x0000; mask <<= 1) {
```

This loop initializes `mask` to equal 1. Then each pass of the loop shifts all the bits in mask to the left then saves that value back to mask. A quick reminder on what left bit shift is:

```c++
int mask;
mask = 1;   //      mask = 0 ...23 0's... 0000 0001

            // Shift all bits one to the left, then save it in 'mask'
mask <<= 1; //      mask = 0 ...23 0's... 0000 0010

            // Shift again
mask <<= 1; //      mask = 0 ...23 0's... 0000 0100

// and so on. until that lone '1' is shifted all
// the way to the end (left), after that it is simply
// shifted out of existence. Then only 0's are left.

// When this happens

mask == 0;  // is true and the loop exits
```

This loop generates a variable (`mask`) that will only contain '0's except for one '1',
this '1' will also be in every location on the variable only once. This is great news.

Basically the location of the '1' in `mask` decides which bit of `header` to use.

<div class="message">This first loop encodes the <code>header</code> variable
into the image which is a lot like encoding the actual message,
this is done in the second loop. <code>header</code> just contains the length of the message,
which the program needs to know for later decoding.</div>

This can be done by using a bitwise AND. Bitwise AND (`&`) takes two bits and outputs one. If both these bits are '1' it will output '1', otherwise the output will be '0'. Because `mask` moves its '1' along to the left, we can get each bit of header from doing `header & mask` in this loop:

```c++
mask           000000000001
header       & 010100110101
             ---------------
               000000000001

mask <<= 1     000000000010
header       & 010100110101
              ---------------
               000000000000
```

Afterwords we want to remove the least significant bit from the pixel:

```c++
~mask          111111111110
pixels       & 101010111001
             ---------------
               101010111000
```

Then we fuse the two together with bitwise OR (`|`):

```c++
(mask & header)         000000000001
(~mask & pixel)       | 101010111000
                      ---------------
                        101010111001
```

<div class="message">Keep in mind that the binary in the examples above is actually much longer.</div>

The same thing in C++ & Qt:

```c++
    QRgb bit   = (bool) (header & mask);
    QRgb pixel = encodedImage->pixel(x, y) & ~0x0001;

    encodedImage->setPixel(x, y, pixel | bit);
```

Finally to keep iterating through the image left to right and top to bottom, we write this at the end of the loop:

```c++
    if (++x == image.width()) {
        x = 0;
        if (++y == image.height()) {
            break;
        }
    }
```

The encoding process is mostly the same for the actual message, except now there is an outer loop that iterates through each character of the message, then an inner loop which encodes the character into 16 pixels of the image. Because the header was an `int` it took up 32 bits and used 32 pixels. To make sure each character only uses 16 pixels, `mask` is changed from `int` to `ushort`, a variable that only takes up 16 bits of space. Because a `ushort` is only 16 bits long, and `mask` is shifted one bit every iteration, the inner loop will run out after 16 iterations, encoding 16 pixels.

## The final code:

```c++
QImage* Cipher::encodeImage() {
    QImage* encodedImage = new QImage(image.copy(0, 0, image.width(), image.height()));
    int x = 0, y = 0, header = message.length();

    if (message == NULL || bitsPerPixel == 0) {
        return encodedImage;
    }
    for (int mask = 0x0001; mask != 0x0000; mask <<= 1) {
        QRgb bit   = (bool) (header & mask);
        QRgb pixel = encodedImage->pixel(x, y) & ~0x0001;

        encodedImage->setPixel(x, y, pixel | bit);

        if (++x == image.width()) {
            x = 0;
            if (++y == image.height()) {
                break;
            }
        }
    }

    for (QChar* character = message.begin(); character != message.end(); ++character) {

        for (ushort mask = 0x0001; mask != 0x0000; mask <<= 1) {
            QRgb bit   = (bool)  (character->unicode() &  mask);
            QRgb pixel = encodedImage->pixel(x, y) & ~0x0001;

            encodedImage->setPixel(x, y, pixel | bit);

            if (++x == image.width()) {
                x = 0;
                if (++y == image.height()) {
                    return encodedImage;
                }
            }
        }
    }
    return encodedImage;
```

# This is so Meta

To come full circle, here is Andy again, except this time this <b>entire</b> post is encoded into him:

{% include image.html url="/media/2014-08-04-stickshifts-n-safetybelts/andy-encoded-alot.png" description="This image contains the <b>entire</b> post." %}
