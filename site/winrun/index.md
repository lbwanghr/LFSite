---
title: WinRun
---

Run Windows 11 natively on your Apple Silicon Mac — no setup wizard, no configuration panels, no subscription. Open a window, get Windows. Close the window, your session is saved.

## How It Works

1. **Download** WinRun from the App Store
2. **Point** it to a Windows 11 ARM ISO from Microsoft
3. **Done** — WinRun installs everything automatically (about 5–10 minutes, hands-free)

From then on, opening WinRun puts you back at the Windows desktop in a second or two — exactly where you left off, with the same windows still open. Close the WinRun window and the session is saved instantly.

No virtual machine to manage. No snapshots to name. One app. One Windows.

## Who It's For

WinRun is built for people who occasionally need Windows but don't want to live there.

- **Mac users with one Windows-only app** — Tax software, a corporate VPN client, a vendor portal, a niche professional tool that has no Mac equivalent
- **Cross-platform developers** — You build on macOS but need to verify behavior on Windows now and then
- **Designers and consultants** — Working with PC clients who send Windows-only files, plugins, or proofing tools
- **Students** — Coursework that mandates a specific Windows program (CAD, statistics, simulation)
- **Casual users** — Old Windows games, hobby tools, anything you used to do on a Windows machine you no longer own

If Windows is your **primary working environment** and you need it running all day, take a look at [SubWin](../subwin/) instead — it's a menu-bar background Windows you reach via Remote Desktop. WinRun is for the rest of us.

## Key Features

- **Zero Configuration** — No virtual machine to create, no settings to tweak. One app, one Windows.
- **Pay As You Go** — Top up only when you need more. No subscriptions, no upfront cost.
- **Instant Resume** — Close the window to save, open to restore. Your Windows session is always right where you left it.
- **Native Mac Interaction** — Keyboard, trackpad, and mouse work directly with Windows. Optional immersive full-screen mode.
- **Bidirectional Clipboard & Drag-and-Drop** — Copy from Mac, paste in Windows (and vice versa). Drag files between Finder and Windows Explorer.
- **USB Device Passthrough** — Connect iPhone / iPad, webcams, microphones, USB drives, printers, or scanners directly to Windows when you need them.
- **Privacy Friendly** — Runs entirely on your Mac. No accounts, no cloud, no data leaves your device.
- **Native Performance** — Built on Apple's Hypervisor framework. Single-core performance is on par with native Snapdragon X Elite hardware.
- **App Store Sandboxed** — Full macOS sandbox for system-level security.

## Pricing & Free Trial

WinRun charges by usage time, not by month. There is no upfront cost — the app itself is free to download.

- **Top up 180 minutes** anytime via a single In-App Purchase
- The timer only runs once Windows is fully installed and you're actually using it — **the installation itself doesn't consume any of your balance**
- Close the lid, sleep your Mac, or close the WinRun window and the timer stops automatically
- Remaining balance is shown in the title bar at all times, down to the second

**Trying it out**: every new Mac receives **20 free minutes** the first time WinRun is launched — no purchase required, no credit card on file. Since installation doesn't draw from this balance, your free minutes start fresh once Windows is ready, giving you a real chance to try the app you came for and decide whether WinRun fits your workflow.

## Choosing Between WinRun and SubWin

We offer two Windows-on-Mac products. They share the same engine but serve different workflows.

| | **WinRun** | [SubWin](../subwin/) |
|---|---|---|
| Form factor | Windowed Mac app | Menu-bar background app |
| Interaction | Direct keyboard / mouse / display | Microsoft Windows App via RDP |
| Best when | You open Windows occasionally to use a specific app | Windows is part of your daily workflow and needs to stay running |
| Pricing model | Pay-as-you-go (top-up by hours) | One-time purchase, lifetime use |
| Free starter | 20 free minutes on a new Mac | TestFlight trial by invitation |
| USB passthrough | Yes — webcam, iPhone, USB drives | Handled by your RDP client device |
| Clipboard / drag-and-drop | Bidirectional, native | Handled by your RDP client |
| Multi-device access | Single Mac only | Connect from Mac, iPad, iPhone, or any RDP client on your network |
| Family Sharing | Per-Mac balance, not shared | Shared across your Apple Family group |

**Quick rule of thumb**: if Windows is *a place you visit*, choose WinRun. If Windows is *a place you live*, choose SubWin.

## Frequently Asked Questions

**Do I need a Windows license?**
Yes. WinRun runs Windows 11 ARM, but the Windows license itself is yours to obtain (Home, Pro, or Education edition). Download the ARM ISO directly from Microsoft.

**Will my Windows software run on ARM?**
Almost certainly. Windows 11 ARM includes a built-in x86/x64 emulation layer that runs the vast majority of legacy Windows applications transparently. Edge cases are limited to software that ships kernel-level drivers (a small number of anti-cheat games, certain virtual camera plugins).

**Does WinRun stop charging when I close the lid or sleep my Mac?**
Yes. The timer is tied to actual Windows execution time. Close the lid, put the Mac to sleep, or simply close the WinRun window — billing stops automatically and resumes when you come back.

**What happens when my balance runs out?**
WinRun saves your Windows session to a snapshot, exits cleanly, and prompts you to top up the next time you open it. Nothing is lost — you pick up exactly where you stopped.

**Can I share my balance across Macs or Apple IDs?**
No. Balances are stored locally per Mac. This keeps the model honest — you only pay for the time you actually use on the device you're using.

**Why pay-as-you-go instead of a subscription?**
Many people only need Windows a few hours a month. A subscription would charge them for time they don't use. Pay-as-you-go means a $0.99 top-up can last weeks, and you never wonder whether to keep paying.

**How does it differ from Boot Camp or Parallels?**
Boot Camp doesn't exist on Apple Silicon. Parallels is a full virtual-machine platform you configure and manage; WinRun is a single, opinionated Windows that just works as a Mac app. Different philosophy, different price model.

**Can I use WinRun commercially?**
Yes. The standard Mac App Store license permits commercial use. Just make sure your Windows license edition allows it (Pro and Enterprise do; Home does not).

**Is GPU acceleration / 3D / gaming supported?**
WinRun focuses on productivity workflows. 3D acceleration is not currently supported — heavy 3D games or GPU-intensive workloads aren't a fit.

**What if I need to switch Macs?**
Re-download from the App Store on the new Mac using the same Apple ID. The license follows your account, not the device. The free starter minutes are awarded once per Mac, and your remaining balance does not transfer.

## System Requirements

- Apple Silicon Mac (M1 or later)
- macOS 26.0 or later
- Windows 11 ARM ISO (download free from Microsoft)

## Privacy First

Your data stays on your Mac, always. No accounts, no analytics, no server uploads. [Read our Privacy Policy](privacy/).

## Support

For questions, bug reports, or feature ideas, email [support@lonefondness.com](mailto:support@lonefondness.com). We read every email and typically respond within 1–2 business days.
