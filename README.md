<img align="left" width="60" height="60" src="https://github.com/voicemxil/TS2-Starter-Pack/assets/69059862/a9e022b0-277d-45ce-adb9-9bf210cc970a" alt="SP icon">

<h1>The Sims 2 Starter Pack</h1> 

![GitHub all releases](https://img.shields.io/github/downloads/voicemxil/TS2-Starter-Pack/total?label=total%20downloads) ![Current Version](https://img.shields.io/github/v/release/voicemxil/TS2-Starter-Pack?label=current%20version) [![Discord](https://img.shields.io/discord/912700195249197086?color=fa807a&label=osab%27s%20TS2%20Community%20Discord%20Server&logo=Discord&logoColor=white)](https://discord.com/ts2community)

The Starter Pack is an all-in-one source for obtaining, installing, and optimizing TS2 Ultimate Collection on modern hardware! 
The Ultimate Collection is the free 2014 Origin release, which includes the base game & all packs/updates.

## Flavors:

[<img align="left" width="40" height="40" src="https://github.com/voicemxil/TS2-Starter-Pack/assets/69059862/e5233181-2abd-4c40-a9f5-e4ba4ce76b68" alt="Web Installer icon">](https://github.com/voicemxil/TS2-Starter-Pack/releases/download/v14/TS2StarterPack-WebInstaller.x64.exe)
### [Web Installer](https://github.com/voicemxil/TS2-Starter-Pack/releases/latest) (Recommended) ![GitHub file size in bytes](https://img.shields.io/github/size/voicemxil/TS2-Starter-Pack/bin/Web%20Installer/TS2StarterPack-WebInstaller.x64.exe?branch=v13)
- Lightweight NSIS-based web installer
- Downloads The Sims 2 Ultimate Collection with Sims2RPC & fixes via GitHub
- Automates Touchup/install process based on the install directory

[<img align="left" width="40" height="40" src="https://github.com/voicemxil/TS2-Starter-Pack/assets/69059862/4f869b5b-9e36-40c8-9704-d135e55f12bc" alt="Standalone Installer icon">](https://github.com/voicemxil/TS2-Starter-Pack/releases/download/v14/TS2StarterPack-StandaloneInstaller.x64.exe)
### [Standalone Installer](https://github.com/voicemxil/TS2-Starter-Pack/releases/latest) (Offline Version) ![GitHub file size in bytes](https://img.shields.io/github/size/voicemxil/TS2-Starter-Pack/bin/Standalone%20Installer/TS2StarterPack-StandaloneInstaller.x64.exe?branch=v13)
- Lightweight NSIS-based installer 
- Game files not included. Performs offline install on manually extracted Ultimate Collection game files (works with G4tW)
- Automates Touchup/install process based on the install directory, includes same fixes as Web Installer

  
## Usage/Instructions:
### The [Full Guide on Google Docs](https://docs.google.com/document/d/1UT0HX3cO4xLft2KozGypU_N7ZcGQVr-54QD9asFsx5U/edit) is available for detailed instructions.

### Basic steps:
- _(**Standalone only**)_ Before proceeding, obtain the [Ultimate Collection game files](https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/tag/v12) and extract them to a new folder for the game called "The Sims 2 Starter Pack" (usually `C:\Program Files (x86)\The Sims 2 Starter Pack`). Make sure to direct the installer to this folder.
- 🐧 Linux/Steam Deck users should follow these steps in conjunction with the [Linux-specific setup steps](https://github.com/voicemxil/TS2-Starter-Pack/wiki/Linux-Specifc-Setup-Steps).
1. Download your chosen installer from the latest Release (64-bit or 32-bit). Run using an administrator user account.
    - If you get a "Windows protected your PC" popup, click "More details" followed by "Run Anyway."
    - If antivirus interferes for some reason, try temporarily disabling it to launch the installer, or make an exception for your game folder.
1. Follow the prompts in the installer to proceed, selecting the location for your game folder & choosing desired components. 
   - The default location of "The Sims 2 Starter Pack" folder in Program Files (x86) is recommended.
   - On modern AMD graphics card generations such as RX 400 (Polaris) series and later, enabling the DXVK component is recommended to resolve bugs such as an extremely long launch wait time and loading screen.
1. After Installation, you must correctly configure Graphics Rules Maker and Sims2RPCSettings to set up the game for your system. Full detailed instructions are in the Google Doc guide.
1. You can then run the game using Sims2RPC.exe or "The Sims 2" shortcuts in the Start Menu/Desktop, if enabled. 
    - Once in-game you will be prompted with a custom content dialog due to included fixes and features, such as the CEP - this doesn't indicate any issue with the game. It's recommended that you choose "Enable Custom Content" to take advantage of these included features. You then can disable the prompt from showing up via the in-game settings.


## Featured Fixes/Dependencies 
- Included:
  - [Sims2RPC Launcher & Bright CAS Fix by Lazy Duchess](lazyduchess.tumblr.com)
  - Visual C++ Redist (x86)
  - .NET Framework (required for RPC)
  - [Graphics Rules Maker from SimsNetwork](https://www.simsnetwork.com/tools/graphics-rules-maker)
  - [Sim Shadow Fix by SimNopke](https://simnopke.tumblr.com/post/136184612377/sim-shadow-fix)
  - CEP (Color Enable Package) by Numenor
  - Pie Menu Text String Fix by LdDarcy
  - AL/MG UI Font Fix by DanTheMann15 patched in
  - Localized Music Unlocked by spockthewok (Web Installer)
- Optional:
  - DXVK (not toggled by default)
  - Clean Hood Templates: [CroconawSims](https://modthesims.info/m/10269790) (PV, VV, RH, DV, Universities, Bluewater Village), [Dorsal Axe](https://modthesims.info/m/6990975) (ST), [MeetMe2TheRiver](https://meetme2theriver.livejournal.com/) (Downtown, Stealth Hoods), and [TheNeonPlumb](https://theneonplumb.tumblr.com/post/656712498541723648/clean-template-belladonna-cove-with-townies) (BC)
  - Store/Pre-order Content
 


## Resources & Support:
- For help with your TS2 game, there are various resources such as our #ts2-faq and #ts2-help forums in the [TS2 Community Discord](https://discord.gg/ts2community), or the [r/Sims2Help Reddit](reddit.com/r/sims2help)! 
- Our members also share gameplay, CC/Mods, and plenty of other useful resources.
### Join TS2 Community here:
[<img src="https://discordapp.com/api/guilds/912700195249197086/widget.png?style=banner3" alt="">](https://discord.gg/ts2community)
