# Battery
This role targets battery optimization, which is notoriously bad on Linux distros. Applying this role on my Dell XPS 9570 with Ubuntu 22.04, the battery life probably 2x, and my laptop almost never heats up nor uses the fan (except under heavy loads).

This roles sets up battery-related utils such as `tlp`, `acpi` or `powertop`.\
The Dell specific role is centered around using the `cctk` tool to change the battery charging thresholds.

## Changes to default that may impact usual usage

### Disable bluetooth by default
The bluetooth is disabled by default on startup, but can be re-enabled right from the GUI (top-right corner on Ubuntu).

### Disable `docker` network
Docker maintains its virtual network by default, which leads to important power consumption (around 300mW in average with peaks at 2W 😱) even when not used.

**Solution**\
Disable docker network when you don't need `docker` with `ifconfig docker0 down`

**Restarting Docker network**\
`sudo ifconfig docker0 up`

*Source: [https://www.gushiciku.cn/pl/2BLN]()*

### `pulseaudio`
`pulseaudio` may consume a lot of power even when no sound is coming out of your laptop. According to different sources it could come from being plugged to an HDMI screen, or having your mic enabled by default.

## Investigating battery usage
To investigate the power consumption of your laptop, you will need to use `powertop`. At first, you won't obtain the "Power est." column, you will need to let `powertop` run for 15 minutes on battery.\
If this still does not work, you can try to force calibration with `powertop -c`.

## Optimizing battery life over the years
### Current capacity
The capacity of the battery will decrease over years, and its decrease is even faster with poor settings. One can check the current capacity using `acpi -V`:
```Shell
$ acpi -V | grep Battery

Battery 0: Not charging, 98%
Battery 0: design capacity 8508 mAh, last full capacity 3488 mAh = 40%
```
After 6 years of default settings on my Dell XPS, capacity has dropped to 40%.

### Avoiding full charges
To optimize battery life over the years, one should avoid the full charge cycles. This typically means avoiding going down to 0% and avoiding charging to 100%. In this role, I chose a range of 60%-80%, meaning that battery starts charging when it reaches 60% and stops at 80%.

If you plan to use your laptop for a long period without AC, you should change these settings momentarily to allow a full 100% charge.

On Dell XPS, the BIOS settings can be changed using `cctk` also called "Command Configure". On other machines, there are either tools to do this programmatically or BIOS settings to change.\
