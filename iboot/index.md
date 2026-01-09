---
layout: home
title: iBoot
description: Menu bar shortcut to the macOS Startup Disk panel for fast, safe dual-booting.
hero:
  eyebrow: Menu bar shortcut
  title: Boot into Windows without digging through Settings
  tagline: iBoot pins Startup Disk to your menu bar so you can switch systems quickly and safely—one click at a time.
  primary_cta:
    label: Download on the App Store
    url: "https://apps.apple.com/app/apple-store/id6465744342?pt=123719714&ct=Github&mt=8"
pillars:
  - title: Trusted path
    description: Opens the native macOS Startup Disk panel—no hidden scripts or risky shortcuts.
  - title: Menu bar muscle memory
    description: Summon Startup Disk instantly and enable geek mode for a single-click jump.
  - title: Dual-boot ready
    description: Built for Intel Macs with Boot Camp; Apple silicon Macs are not supported.
---

iBoot keeps Startup Disk one click away, so you can boot Windows from macOS without hunting through Settings.

Requires an Intel Mac that supports Boot Camp. Apple silicon Macs are not supported.


## Advanced usage

In **geek mode**, you can reach the destination with one click on the icon, but you will lose access to the pull-down menu.

There is no entry for the geek mode in the GUI due to the Apple Review Guideline, however you can open **Terminal** and type the following command to enable geek mode.

`defaults write top.mightycounty.BootCampSwitcher geekmode true`

Or you can type the following command to disable geek mode. 

`defaults write top.mightycounty.BootCampSwitcher geekmode false`

Changes to geekmode will take effect after the next launch.

Additionally, you can type `sudo killall iBoot` to quit **iBoot** if you can't find a quit button.

## Get Windows 11

The smoothest path is upgrading from Windows 10 with a Windows 11 image. Run the TPM bypass script before launching the installer. [Read the full guide]({{ '/GetWindows11' | relative_url }}).

## Known issues

### Missing disk?

The Startup Disk panel sometimes hides drives. Click the empty area where a disk should be—the prompt usually updates and reveals it.

### iBoot not opening?

Reported by under 1% of users. In every case I reviewed, the menu bar icon had appeared but went unnoticed. If you still hit an issue, send your About This Mac screenshot and a short demo video so I can investigate.

## Support

Questions or feedback? Email me at [support@lonefondness.com](mailto:support@lonefondness.com).
