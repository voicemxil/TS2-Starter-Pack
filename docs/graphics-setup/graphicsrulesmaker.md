---
title: Graphics Rules Maker
layout: default
parent: Graphics Setup
nav_order: 1
---

# Graphics Rules Maker (GRM) Setup

This tool is used to patch the game’s Graphics Rules & Video Cards databases for your system.

If you use the Starter Pack, GRM will already be pre-installed into to your Starter Pack folder and will open up during the installation. If you don’t have GRM or have an older version, download here:

### Windows 10+

<span class="fs-3">
[Download 64-bit]([https://github.com/voicemxil/ts2-starter-pack/releases/latest](https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/GRM-legacy-win64.7z)){: .btn .btn-blue }
</span>

### Legacy

<span class="fs-3">
[Download Legacy 64-bit]([https://github.com/voicemxil/ts2-starter-pack/releases/latest](https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/GRM-legacy-win64.7z)){: .btn .btn-blue }
[Download Legacy 32-bit]([https://github.com/voicemxil/ts2-starter-pack/releases/latest](https://raw.githubusercontent.com/voicemxil/TS2-Starter-Pack/v15/components/GRM-legacy-win64.7z)){: .btn .btn-blue }
</span>

## Instructions:

1. Run GRM as Administrator. (The installer should run the program automatically once it’s been downloaded).
1. In the “Game:” dropdown box, select “The Sims 2.” 
  - The folder path should be set to “C:\Program Files (x86)\The Sims 2 Starter Pack” [or equivalent]. It should say in green that the game has been successfully located. 
     - If you don’t have the Starter Pack, it’ll usually be “EA GAMES\The Sims 2.” If you chose a custom folder location in the installer, set it to that instead. 
1. Click the “Auto-detect” button to automatically input the correct texture memory and tweaks for your system.
1. If you have integrated graphics from Intel/AMD CPUs’ onboard, GRM may overestimate the texture memory to 4096. It's a good idea to lower it to a value like 512 or 1024 to avoid crashing, as shared memory on integrated cards will count towards the game’s memory limit.
1. Uncheck 🚫 “Disable Sim shadows” - we will be using either the Sim Shadow Fix or DXVK.
1. Check ✅ “Disable Dirty Rectangle optimizations.” Resolves cases of transparent flickering graphics and fixes the depth buffer for Reshade support.
1. Set both the “Default Resolution” and “Max Resolution” dropdowns to match your monitor (typically the largest resolution on the list).
  - 🛈 The larger you make the resolution, the smaller the in-game UI will appear. You can resolve this by lowering it in-game or upscaling with tools such as Magpie, Borderless Gaming, or Lossless Scaling.
1. Save your changes by clicking “Save files…” at the bottom right.
  - Click “Yes” if GRM asks you to add your graphics card(s) to the database.
  - If you get an error while saving files, make sure you’ve run the program as administrator and check that your game folder has sufficient permissions. Or, you can follow the prompts to move the files manually.
1. To apply the fixes to The Sims 2 Body Shop, select it from the “Game” dropdown and repeat the same steps.

### Next Steps:
If you have **modern AMD Graphics (RX 400+)**, [DXVK setup](/TS2-Starter-Pack/graphics-setup/dxvk) is recommended to prevent AMD issues with the loading screen as well as generally better performance.
For any others, DXVK is **optional/experimental**, and can have either benefits or downsides depending on your hardware. You can read more details or otherwise move on to [Sims2RPCSettings and running the game](/TS2-Starter-Pack/final-setup).
---
