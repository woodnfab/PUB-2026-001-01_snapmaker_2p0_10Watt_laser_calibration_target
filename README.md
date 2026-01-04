# PUB-2026-001-01_snapmaker_2p0_10Watt_laser_calibration_target

## Introduction

OpenSCAD model for a Snapmaker 2.0 / A350T 10Watt laser calibration target.

I have bought a used Snapmaker 2.0 printer. It was missing this calibration target. So i thought it would be a good idea to try to print one.
As an alternative it's also possible to contact Snapmaker support to get it as a spare part.

This readme show the design and test progress.

Note: it's my first time using OpenSCAD and I’m also new to 3D printing.

### Some links on the topic.

Manual
- https://support.snapmaker.com/hc/en-us/articles/4420631317783-3-3-axis-Operations

Issue
- https://forum.snapmaker.com/t/10w-laser-calibration-target-missing/29052

## Background

The OpenSCAD model is made with ChatGPT.

It also might be somewhat over-engineered. But it's also about learning OpenSCAD and how to design something with it. So the honeycomb pattern on the bottom is just for esthetics.


### Version

#### 01

Initial version.

Problem:
- The honeycomb pattern on the bottom was not very nice. 

#### 02

Changes:
- Changed depth of text to 0.3
- has a solid border on the bottom
- use library for honeycomb pattern

#### 03

Changes:
- Increased the honeycomb cell size and the line width
- Changed the font to bold

Notes:
- OpenSCAD uses default Liberation Sans.  
See:
https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Text
*Liberation Sans is the default font to encourage this.*


### Print

#### Version 01

Printed with a snapmaker 2.0

Printing done with readily available materials

##### Slicer settings

- Layer Height:  Fine
- Speed: Slow
- Model structure: Medium
- Support: None
- Adhesion Type: Skirt

##### Filament

- eSUN: PLA blue

Settings:
- Printing Temperature: 205
- Build plate temperature: 50
- Fan Speed: 100


#### Version 02

See details version 01

#### Version 03

##### Slicer settings

See version 01

Change:
- Speed: Medium
