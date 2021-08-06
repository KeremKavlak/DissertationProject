# Dissertation project

This was a project to test if it was possible to bypass anti cheat methods via a hardware based solution.
To replicate this you will need an Arduino Uno and to refer to the fritzing diagram for the hardware setup.

The Arduino IDE is required in order to upload the code
To run the backend the processing IDE is required.

This was developed (originally) to test against the following games:

Halo: The Master Chief Collection - (Halo: Reach)
Counter Strike: Global Offensive
RuneScape - unable to of been implemented.

Note that not all functions work.

In order to use this by default it will load with the Halo: Reach config.
To cycle through the configs press the fifth button
To cancel an action press the fourth button (pressing the fifth button can also do this but it will change the config)
There is a total of three configs (more can be added). However the third one is blank.

Halo: Reach buttons:
button 1 - jumpcrouch (the action of rapidly jumping and crouching at the same time to disort the hitbox)
button 2 - strafe (it will automatically strafe for you using random timings)
button 3 - melee shot (it will perform the melee action then shoot after the melee, this doesn't work as intended)

Counter Strike: Global Offensive:
button 1 - tapshoot (it will fire your weapon with controlled bursts with random timings)
button 2 - bunnyhop (it will bunnyhop for you - does not work as intended)
