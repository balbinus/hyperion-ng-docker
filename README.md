Basic Dockerfile for Hyperion, based off reverse engineering https://hub.docker.com/r/sirfragalot/hyperion.ng.
Uses debian/buster-slim as a base.
Clearly not properly done, I'm no Docker expert.

You cannot make it work with display capture (see https://github.com/hyperion-project/hyperion.ng/issues/764).
However, it's working for me with ws281x LEDs, driven using PWM/GPIO18/DMA10, if I run it in privileged mode.
It may also work by passing it the device /dev/mem, and adding the caps SYS_RAWIO + IPC_LOCK.
I hope it also works with /dev/video0 for USB video capture, but I haven't gotten yet to the point where I could test it.

Auto-discovery-blablabla-magic probably won't work unless you give it host-level networking, since it probably relies on Avahi. I don't know, I haven't bothered with it.
You can simply pass the ports you're interested in (JSON / Protobuf / etc) to whatever needs to remote it, I suppose.
