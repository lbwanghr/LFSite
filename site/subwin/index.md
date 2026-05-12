---
title: SubWin
---

Run a headless Windows 11 virtual machine on your Apple Silicon Mac — access it anytime via Remote Desktop, from any device on your network.

## How It Works

Grab a Windows 11 ARM ISO from [Microsoft](https://www.microsoft.com/en-us/software-download/windows11arm64), point SubWin to it, and pick the Windows username and password you want to use — they're yours, never defaults baked in, never sent anywhere. SubWin runs the entire Windows 11 installation in the background and then settles into your menu bar, ready to connect in seconds whenever you need it. From there, connect to `localhost:3389` from any RDP client whenever you need Windows — Microsoft's free [Windows App](https://apps.apple.com/app/windows-app/id1295203466) works great, on macOS, iPad, iPhone, or another Mac.

No windows. No dock icon. Just a lean VM that's always there.

## Who It's For

SubWin is built for people who want a Windows machine **always running in the background**, ready to connect to whenever they need it — not something they launch and quit each time.

- **Cross-platform developers** — Mac is your primary machine, but you keep a Windows environment running for compiling, testing, or CI work
- **Finance, quant, and trading professionals** — Your trading terminals, market data tools, or backtesting platforms are Windows-only and need to stay up around the clock
- **Remote-first workers** — Your employer issued a Windows-based environment, but you'd rather work on a Mac and connect into Windows when needed
- **Power users** — You spend most of your day in Windows software and want a clean, quiet Windows that never gets in the way of macOS
- **Multi-Mac households** — A Mac mini at home, a MacBook on the road — you want one purchase to cover all of them

If Windows is **a tool you reach for occasionally**, take a look at [WinRun](../winrun/) instead — it's a windowed app priced by the hour. SubWin is for when Windows is a workspace you live in.

## Key Features

- **Menu Bar App** — Runs quietly in your menu bar. No windows, no dock clutter.
- **Always-On Remote Desktop** — Connect via RDP at `localhost:3389` (or your LAN IP) from any device that runs an RDP client.
- **One-Time Purchase** — Pay once, use forever. No subscriptions, no usage limits, no upsells.
- **Family Sharing Ready** — Share with up to six family members via Apple's Family Sharing.
- **Privacy Friendly** — Runs entirely on your Mac. No accounts, no cloud, no data leaves your device.
- **Native Performance** — Built on Apple's Hypervisor framework, with CPU and memory tuned to your Mac. Single-core performance is on par with native Snapdragon X Elite hardware.
- **App Store Sandboxed** — Full macOS sandbox for system-level security.

## Pricing & Trial Access

SubWin is a one-time purchase on the Mac App Store — no subscriptions, no recurring charges. Apple Family Sharing means a single license covers your household; the same Apple ID covers all your own Macs.

**Want to try before you buy?** SubWin uses TestFlight on an invitation-only basis — we don't publish a public link. The process is simple:

1. Email **[support@lonefondness.com](mailto:support@lonefondness.com)** with a few words about your intended use (developer environment, trading workstation, remote-work setup, etc.)
2. Our team reviews each request and sends back a **TestFlight invitation**
3. Install via TestFlight on your own Mac, on your own time, with no obligation

We typically reply within 1–2 business days.

## Choosing Between WinRun and SubWin

We offer two Windows-on-Mac products. They share the same engine but serve different workflows.

| | [WinRun](../winrun/) | **SubWin** |
|---|---|---|
| Form factor | Windowed Mac app | Menu-bar background app |
| Interaction | Direct keyboard / mouse / display | Microsoft Windows App via RDP |
| Best when | You open Windows occasionally to use a specific app | Windows is part of your daily workflow and needs to stay running |
| Pricing model | Pay-as-you-go (top-up by hours) | One-time purchase, lifetime use |
| Free starter | 20 free minutes on a new Mac | TestFlight trial by invitation |
| Peripherals | Built-in webcam, microphone, and audio output — no setup | Routed through your RDP client (Microsoft Windows App supports audio and mic) |
| Clipboard / drag-and-drop | Bidirectional, native | Handled by your RDP client |
| Multi-device access | Single Mac only | Connect from Mac, iPad, iPhone, or any RDP client on your network |
| Family Sharing | Per-Mac balance, not shared | Shared across your Apple Family group |

**Quick rule of thumb**: if Windows is *a place you visit*, choose WinRun. If Windows is *a place you live*, choose SubWin.

## Frequently Asked Questions

**Do I need a Windows license?**
Yes. SubWin automatically installs Windows 11 Pro ARM, but the Windows license itself is yours to obtain. Download the ARM ISO directly from Microsoft.

**Will my Windows software run on ARM?**
Almost certainly. Windows 11 ARM includes a built-in x86/x64 emulation layer that runs the vast majority of legacy Windows applications transparently. Edge cases are limited to software that ships kernel-level drivers (a small number of anti-cheat games, certain virtual camera plugins).

**Can I access SubWin from my iPad or iPhone?**
Yes. SubWin listens on `0.0.0.0:3389`, so any device on your local network can connect — we recommend Microsoft's free [Windows App](https://apps.apple.com/app/windows-app/id1295203466) from the App Store as the RDP client. You can also expose port 3389 on your Mac to the public internet to reach SubWin from anywhere.

**How does it differ from Boot Camp or Parallels?**
Boot Camp doesn't exist on Apple Silicon. Parallels is a full virtual-machine platform you configure and manage; SubWin is a single, opinionated Windows that just runs in the background. Different philosophy, different price model.

**What happens to my data if SubWin is updated or removed?**
Your Windows VM lives in the app's sandbox on your Mac. App updates preserve it. If you uninstall SubWin, macOS removes the sandbox along with it — back up anything important from inside Windows first.

**Can I use SubWin commercially?**
Yes. The standard Mac App Store license permits commercial use, and the Windows 11 Pro edition that SubWin installs allows commercial use as well — just make sure your Windows license itself is properly obtained.

**Is GPU acceleration / 3D / gaming supported?**
SubWin focuses on productivity and remote-desktop workflows. 3D acceleration is not currently supported — heavy 3D games or GPU-intensive workloads aren't a fit.

**What if I need to switch Macs?**
Re-download from the App Store on the new Mac using the same Apple ID. The license follows your account, not the device. You will need to reinstall Windows on the new Mac (about 5–10 minutes).

## System Requirements

- Apple Silicon Mac (M1 or later)
- macOS 26.0 or later
- Windows 11 ARM ISO (download free from Microsoft)
- An RDP client on whichever device you use to connect (Microsoft's [Windows App](https://apps.apple.com/app/windows-app/id1295203466) is free)

## Privacy First

Your data stays on your Mac, always. No accounts, no analytics, no server uploads. [Read our Privacy Policy](privacy/).

## Support

We read every email.

- **Trial requests** — Email **[support@lonefondness.com](mailto:support@lonefondness.com)** with a short note on your intended use; we'll send a TestFlight invitation if it's a fit.
- **Existing customers** — Same address for help, bug reports, or how-to questions.
- **Feature ideas** — We genuinely welcome them. Tell us what would make SubWin more useful for your workflow.

We typically respond within 1–2 business days.
