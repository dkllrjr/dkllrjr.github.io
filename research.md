---
layout: default
title: Research
---

# Research

Here is the research I've worked on or am currently working on.

## Mistral Wind and its Interaction with the Mediterranean Sea (My PhD Thesis)

The Mistral wind is a cool, dry, strong wind that flows out through the Rhône Valley in the southern part of France into the Gulf of Lion. When it flows over the Mediterranean, it cools and evaporates the water near the surface. This does two things: it cools off the water, making it denser, and it converts more liquid water into gaseous water, leaving behind the salt, which again makes the surface water more dense. Now the surface water is denser than the water underneath and it drops, creating a convection cycle. Due to how the Mediterranean circulates, this convective cycling can aid the circulation and mix around the nutrients in the column of water with ecological consequences.

This is what I will be primarily focusing on for the next 3 years at École Polytechnique and LMD. My job is to model the Mistral's interaction with the Mediterranean and the resulting convective cycling.

## Turbulent Fluxes, Planetary Boundary Layers, and Lidars

When you have a sunny, hot day without wind, you may see some gliders/sail planes out and about catching the thermals. In the atmospheric science world, these thermals produce what is known as an unstable planetary boundary layer. The solar radiation is heating up the ground, which heats the air right above it. This air is now warmer and less dense than the air above it and rises. We call it unstable, because less dense air is below more dense air, which nature doesn't jive with. As the newly heated air rises through the denser air, cooler air replaces resulting in a bunch of turbulent mixing. Imagine a pot of boiling water; the bubbles rising are like the thermals in the atmosphere, and the motion of the water is very turbulent.

This mixing in the atmosphere also mixes the aerosols (dust or pollution) or anything else held in suspension, such as water vapor. Since we humans produce a fair amount of pollution, a lot of it accumulates next to the ground until the thermals take it higher into the atmosphere. However, these thermals only go so far before they reach less dense air and/or cool down and just stop climbing. This is known as the height of the unstable planetary boundary layer. This means there is a limit to how far that pollution can easily mix skyward, making an apparent disconnect where the thermals stop, in terms of pollution density. Well, with lidars, you get a lot more backscatter (reflections) off aerosols than you do with clean air. Therefore, you can tell where the thermals stop by looking at them with a lidar. Depending on the temporal (time) resolution of the lidar, you can even see the individual thermals as they rise and fall, which is same as looking at the turbulent mixing and fluxes (vector per area) of the planetary boundary layer with the rest of the atmosphere.

Using a lidar for this purpose can help track air pollution and understand the optical properties of the atmosphere and is another tool in the trade of the atmospheric scientist.

## Superior Mirages

So when you have an atmosphere that has a warm air layer atop a cold air layer, you create a stable condition with the denser air resting below the less dense air. The denser air has a larger refractive index, so light bends toward it when travelling through. This can cause, in extreme conditions, superior mirages, where light rays travelling to the observer (such as you or I) overlap each other. When they overlap, the original image of what you would see normally, is distorted, creating a mirage. It can result in some really interesting images. Here's a video that shows such a mirage in the Alaska winter:

<div class="video-container-box"><div class="video-container"><iframe width="560" height="315" src="https://www.youtube.com/embed/ZBC8VFCMfic" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div></div>

## FOSS Load Cell (My Undergrad Project and Master Thesis)

I made a load cell for my undergraduate degree project and my Master's research. Essentially, a load cell is a device that measures a force applied to it. The way they do this varies from device to device but for the most part, they work by acting as springs with you measuring how much they are compressed or stretched. You measure this compression or stretching, known as deformation in engineer speak, with things called strain gauges. Strain gauges themselves are a deep topic, but the most common one in use is the electrical resistance based strain gauge. Basically, this gauge measures deformation by measuring its change in resistance. Now, to get the force applied to the load cell from all this, you use Hooke's Law. Hooke's law relates the deformation proportionally to the amount of force is applied, and is dependent on the material you use for the load cell. And that's basically how load cells work.

The load cell my project partner Daniel Eagan and I made works in the same manner, apart from one major difference. Instead of using a strain gauge based on the change of electrical resistance to measure the deformation, we use a fiber optic sensor called a fiber Bragg grating. Wait, what? Yep, now we're in optics. A fiber Bragg grating, or FBG for short, is a series of burn marks in a fiber optic cable that reflect a particular wavelength of light when shined upon with a white light (as in the white light is shined down the cable, not at it from the outside!). This reflected wavelength changes proportionally to the amount of deformation the FBG feels. So again, we measure the deformation and use Hooke's law to get the force but now we're just using a different way to measure the deformation. This is what we did for our undergraduate project in mechanical engineering.

Here's what it looked like:

<div style="text-align: center;"><img src="/pictures/load cell final.png" alt="Foss Load Cell" style="width: 50%; height: auto;"></div>

and here's a video:

<div class="video-container-box"><div class="video-container"><iframe width="560" height="315" src="https://www.youtube.com/embed/IN2OMU7ZHjU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div></div>

and a demo:

<div class="video-container-box"><div class="video-container"><iframe width="560" height="315" src="https://www.youtube.com/embed/8XkJwjkDrAY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div></div>

Why did we do this? We did this because electric motors are starting to find their way into aviation and NASA has been playing with them to determine their capabilities for flight. When you are just starting to investigate propulsion devices for flight, you do a lot of ground testing. And one thing in this ground testing is determining how much thrust, which is a force, is produced by the propulsion device. So they use load cells to measure the thrust. Now, a problem arises with electrical motors when you do this. They produce a lot of electromagnetic interference, or EMI, because... magic. Think of antennas, they intentionally radiate and receive electromagnetic waves, such as radio waves. When these waves are unwanted, it's called EMI. Guess what, EVERY electrical circuit acts like an antenna. Part of the FCC's job in the USA is make sure electrical products properly mitigate this so that everything plays nice with each other in the electronics world. It's kind of an issue. So when you take the electrical motor's EMI into account and realize those electrical resistance based strain gauges are fundamentally used in an electrical circuit to work... well they just can't avoid the EMI. The result is the force data you get when doing ground testing, using load cells based on this tech, is trash. FBG's don't have this problem; they don't use an electrical circuit to work. Hence, you get clean data.

My Master's research was to prove experimentally this is true. The videos below show some of the tests I ran:

<div class="video-container-box"><div class="video-container"><iframe width="560" height="315" src="https://www.youtube.com/embed/b2b-zLfIH_s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div></div>

Spoiler: the experiments backed up the reasoning. Here's my publication on it:

[<u>D. Keller</u>, D. R. Eagan, G. J. Fochesatto, R. Peterson, H. M. Chan, A. R. Parker. “Advantages of Fiber Bragg Gratings for Measuring Electric Motor Loadings in Aerospace Application.” _Review of Scientific Instruments_](https://doi.org/10.1063/1.5093556)

## Raman Spectrum Lidar

This was the first research project I had a hand in. The project was Prof. G. J. Fochesatto's Raman backscattering lidar, which was designed to determine the various fractions of the water phases in the air. Solid water (ice), liquid water (clouds and precipiation), and gaseous water (humidity) all reflect different wavelengths of light when they are excited by a laser. They also reflect other wavelengths but we aren't interested in those here. The reflected wavelengths we are interested in are caused by Raman scattering, which is dependent on the particle structures (such as crystalline with ice and not so in liquid and so on). When you're in really cold climates like that you find in Fairbanks, Alaska, you can have ice particles pretty low in the atmosphere (creating something called ice fog at times). This is of interest for research because not many places experience this phenomenon.

Backing up a minute, a lidar is just like a radar but uses a laser instead of radio waves. So with that in mind, a laser is shot out into the sky, impacts the different particles in the air, such as water, and is reflected back to its source. The reflections are called backscatter. With Raman scattering, the backscattering can also come back in different polarization states. You can split the returning scattering with a cube beam splitter, and just look at one polarization or the other. What I did with this project in particular, was to make a holder for the cube beam splitter in the lidar design. Below is a picture:

<div style="text-align: center;"><img src="/pictures/bs_holder.png" alt="Beam Splitter Block" style="width: 40%; height: auto;"></div>