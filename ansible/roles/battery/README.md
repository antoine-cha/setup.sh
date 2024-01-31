# Battery
This role targets battery optimization, which is notoriously bad on Linux distros. Applying this role on my Dell XPS 9570 with Ubuntu 22.04, the battery life probably 2x, and my laptop almost never heats up nor uses the fan (except under heavy loads).

This roles sets up battery-related utils such as `tlp`, `acpi` or `powertop`.\
The Dell specific role is centered around using the `cctk` tool to change the battery charging thresholds.



## Additional steps to improve battery life
To investigate the power consumption of your laptop, you will need to use `powertop`. At first, you won't obtain the "Power est." column, you will need to let `powertop` run for 15 minutes on battery.\
If this still does not work, you can try to force calibration with `powertop -c`.

### Disable `docker` network
Docker maintains its virtual network by default, which leads to important power consumption (around 300mW in average with peaks at 2W 😱) even when not used.

**Solution**\
Disable docker network when you don't need `docker` with `ifconfig docker0 down`

Source: [https://www.gushiciku.cn/pl/2BLN]()

### `pulseaudio`
`pulseaudio` may consume a lot of power even when no sound is coming out of your laptop. According to different sources it could come from being plugged to an HDMI screen, or having your mic enabled by default.
