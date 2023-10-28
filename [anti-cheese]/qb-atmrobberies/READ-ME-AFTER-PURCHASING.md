ONLINE DOCUMENTATION: https://wx-anticheat.gitbook.io/docs/
ONLINE DOCUMENTATION: https://wx-anticheat.gitbook.io/docs/
ONLINE DOCUMENTATION: https://wx-anticheat.gitbook.io/docs/
ONLINE DOCUMENTATION: https://wx-anticheat.gitbook.io/docs/
ONLINE DOCUMENTATION: https://wx-anticheat.gitbook.io/docs/

Reading this is VS Code? Right click the file tab and select "Open Preview"


### Hello! Thank you for purchasing this anticheat! I can asure you that you will hopefully NOT regret it.
 If this is your first time using this script, I recommend you reading this through, if you're coming from version 2.0, you should do the same thing!

# Installation Guide

Before you begin, make sure you have all the dependencies installed! The most essential one is discord-screenshot. If you're planning using the admin menu, also install the ox_lib and menuv (If you already don't)

https://github.com/jaimeadf/discord-screenshot

https://github.com/overextended/ox_lib

https://github.com/ThymonA/menuv/

1. Download the .zip file of wx_anticheat adn wx_heartbeat from https://keymaster.fivem.net/assets
2. Unzip those files
3. Go to your server **resources** folder and create a folder **[wx]**
4. Drag the unzipped folders in the newly created folder
5. (Optional, but recommended step) Rename the wx_anticheat folder to something less suspicious. I recommend names like vehicle models (ex. nissantitan2017)
6. (If you followed step 5) Go to wx_heartbeat folder, open the config and edit the `heartbeat.AntiCheatResource` value to the SAME NAME as you renamed your wx_anticheat.
Example:
If your wx_anticheat is named 'definetely-not-anticheat', your config file should look like `heartbeat.AntiCheatResource = 'definetely-not-anticheat'`
7. Open your anticheat folder and edit the config (please, just take your time to do this)
8. Also don't forget to setup the webhooks
9. Upload the INSERT-THIS.sql to your database if this is your first time. If you're coming from 2.0 or older, run the MIGRATE-DB-FROM-2.0.sql
10. RESTART YOUR SERVER!

> This was just the INSTALLATION and a small SETUP, you will need one more thing to do:
1. Go to your server.cfg and add the following line there:


    `add_ace group.ADMINGROUPNAME wxAC.bypass allow # Bypass detections`

    OR

    `add_ace identifier.identifier:type wxAC.bypass allow # Bypass detections`

You can also edit these permissions in the config file

# Exports

You can also use the built-in banning system in any other resource as long as wx_anticheat is started!

## Server Side

`exports['wx_anticheat']:Ban(playerId,reason)`

### Examples:
`exports['wx_anticheat']:Ban(source,"Trying to cheat")`

or

`exports['wx_anticheat']:Ban(13,"Cheater")`


# Commands

Go to your server console (via txAdmin oááár RCON, doesn't matter) and run the following command: `wx`
This command will give you help menu and commands like `wx ban/unban` etc.

# Important Notices

If you have enabled NoClip, GodMode or FreeCam detections, please do NOT restart the anticheat on a live server with players! Players would need to be respawned for the detections to work again!

# Troubleshooting
> If you have ANY problem with this anticheat, feel free to contact me on Discord! @0wx_ or join support discord server: https://discord.gg/9kmNFFxFpS

### Frequent issues
| Issue | Solution                               |
|-------------------------------------|----------------------------|
| High resmon       | Disable admin menu                 |
| Lots of timeout messages      | Disable screenshots                 |
| Error parsing script / Failed to load script      | Make sure your server artifact version is ABOVE 5181                 |
| False detections  | Set the punish type to 'LOG' and watch the logs for detections, that are false positives, then disable them  |
| "You lack the required entitlement to use wx_anticheat"                | Make sure the server owner is the same as the account that the anticheat was purchased for. Also do not forgot to restart your server after installation! Sharing keymaster assets is not possible!      |
