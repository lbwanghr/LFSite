---
title: Power Event Wizard
tagline: Scheduled Startup & Shutdown
---

Bring back the power scheduling feature to modern macOS.

Please watch this [video](https://youtu.be/Mh2bkcEp0tE) to learn how to use this app.

## Introduction

Power Event was once a useful feature provided by macOS Monterey and earlier systems. However, after upgrading to the latest system, this setting page can no longer be found.

Apple Support suggests you use Terminal to manage this setting. You can learn more from this [link](https://support.apple.com/guide/mac-help/schedule-your-mac-to-turn-on-or-off-mchl40376151/mac).

This app brings the feature back, and provides a page to view the power events set on your Mac.

## FAQ

### Why can I only set two events at most? Can I set more?

This app is based on the native command **pmset**. If you read the manual, you will find there are only two groups of events can be set. One contains **wake** and **wakeorpoweron** while another contains **shutdown**, **restart** and **sleep**.
Only **one** command can take effect in **each** group.

### How to validate the configuration?

If you don't want to wait for time to prove it, especially when you can't believe the information displayed on the inspection view in this app, you should open the native app **System Information**, then check **Hardware > Power > PowerEvents**, it won't deceive you.

### When it shows something like "shutdown at 10:00PM Some days", I want the exact days!

If you run `pmset -g sched` in Terminal, you will find this page shows expected result.
Certainly, this app could record what you have set in this app, but if you or other apps rewrite the system settings, this app can't recognize what happened.

### Inconsistent display like "12:00AM" on the Setting page but "00:00AM" on the Inspect page.

It's also expected result, because **pmset** shows "12:00AM" as "0:00AM" and "12:00PM" as "12:00PM".
Generally speaking, there is no "0:00AM" or "0:00PM" in the 12-hour time format, but **pmset** has its own style.

### This app messed up my Login Items page, please help!

If you don't want to use this app, you can reset your Login Items page with the following command in Terminal.
`sfltool resetbtm`

---

You can ask questions by emailing me directly at [support@lonefondness.com](mailto:support@lonefondness.com).
