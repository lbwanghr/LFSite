---
title: iBoot
tagline: Boot into Windows Quickly
---

iBoot pins Startup Disk to your menu bar so you can switch systems quickly and safely—one click at a time.

## Why iBoot?

- **Trusted path** — Opens the native macOS Startup Disk panel—no hidden scripts or risky shortcuts.
- **Menu bar muscle memory** — Summon Startup Disk instantly and enable geek mode for a single-click jump.
- **Dual-boot ready** — Built for Intel Macs with Boot Camp; Apple silicon Macs are not supported.

## Advanced Usage

In **geek mode**, you can reach the destination with one click on the icon, but you will lose access to the pull-down menu.

There is no entry for the geek mode in the GUI due to the Apple Review Guideline, however you can open **Terminal** and type the following command to enable geek mode.

`defaults write top.mightycounty.BootCampSwitcher geekmode true`

Or you can type the following command to disable geek mode.

`defaults write top.mightycounty.BootCampSwitcher geekmode false`

Changes to geekmode will take effect after the next launch.

Additionally, you can type `sudo killall iBoot` to quit **iBoot** if you can't find a quit button.

## Get Windows 11

The smoothest path is upgrading from Windows 10 with a Windows 11 image. Run the TPM bypass script before launching the installer. [Read the full guide](GetWindows11/).

## Known Issues

### Missing disk?

The Startup Disk panel sometimes hides drives. Click the empty area where a disk should be—the prompt usually updates and reveals it.

### iBoot not opening?

Reported by under 1% of users. In every case I reviewed, the menu bar icon had appeared but went unnoticed. If you still hit an issue, send your About This Mac screenshot and a short demo video so I can investigate.

## Support

Questions or feedback? Email me at [support@lonefondness.com](mailto:support@lonefondness.com).
