<p align="center" >
  <img src="/Other/Tipper_Banner.jpg" alt="Banner" title="Banner" width="563">
</p>

# Tipper
Calculates tip for your bill

# Pre-work - Tipper

Tipper is a tip calculator application for iOS.

Submitted by: Kevin Kim

Time spent: ~6 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Added slider to give user more control over tip amount
- [x] Shows bill total if split among 2, 3, or 4 people

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='/Other/Tipper_Overview.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

This was my first go at using animations and working with currency. Getting the appropriate currency was easier than expected because of the provided "currency" number formatter and locale specific currency symbols. Incorporating animations were a bit trickier because keeping track of the layout and animation speed were finicky.

## License

    Copyright [2015] [Kevin Kim]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
