---
layout: page
title: Private Server Guide - Lone Fondness
---

## What is a game server?

In an online game, a **central coordination server** is used to synchronize game state between players.
By default, *Lone Fondness* uses public servers maintained by us. However, you can also host your own **private server** for more control and a smoother connection.

---

## Why run a private server?

1. **Better connectivity** — While we provide public servers across several continents, some users may experience high latency or unreachable networks due to local restrictions.
2. **Guaranteed availability** — Public servers have limited computing resources. During peak hours, you may not be able to create a new game.
3. **Full control** — A private server gives you stable performance, faster response time, and a self-managed environment with no dependency on our infrastructure.

---

## How to set up a private server

### Step 1: Run the server

Download the server binary for your platform, extract it, and run the executable:

```bash
# extract
tar xzf lfserver-1.0-linux-amd64.tar.gz
# run
./lfserver
```

> The server runs with no configuration on supported platforms.
> Supported architectures: **Linux x86_64 (amd64)** and **Linux ARM64**.


### Step 2: Connect from the app

On the game's **main scene**, click the pot to access the server list.

- Enter your server's IP address or domain name.
- Then **select it as your active server** before creating or joining any game.

> **Important:** Every player in the same game must connect to the **same private server**.
> If even one player uses a different server, the game will fail to start.

---

## Downloads

- [lfserver-1.0-linux-amd64.tar.gz](https://github.com/LoneFondness/LFSite/releases/download/v1.0.0/lfserver-1.0-linux-amd64.tar.gz)
- [lfserver-1.0-linux-arm64.tar.gz](https://github.com/LoneFondness/LFSite/releases/download/v1.0.0/lfserver-1.0-linux-arm64.tar.gz)

---

## Privacy

The private server binary is identical to our public version.
It collects no analytics, stores no player data, and uses minimal system resources.
