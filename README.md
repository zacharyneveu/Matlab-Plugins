About This Repo
=====
This repository contains source code for VST plugins created with MATLAB.  The 
eventual goal for this repository is to create one or more entries for the AES
student design competition in New York (Fall 2018).

Plugin Ideas
============
+ AI Drum Sequencer
    + Use AI/ML to categorize input sounds as similar to a type of drum
    + Sort samples into standard drum pad configuration
    + Manage sequencer/sampler functions for a track
    + Perhaps pull random audio samples from freesound to create spontaneous kits.
+ Vocal Remover
    + Remove Vocals from songs for use in ads, unofficial remixes etc.
    + Deemed as a crucial need by Jim Anderson.
    + Could be extended to remove microphone bleed in recordings
    + Could be extended to break a track into stems - bass, drums, guitar, etc.
    + Good problem for deep learning perhaps
        + Conventional programming methods have failed (mostly)
        + Fuzzy solution - vocals reduced by ~30dB is plenty good
+ HRTF Pan Knob
    + When mixing for headphones, panning does not indicate whether sound is front or back
    + Using HRTFs and a 360 degree pan knob can mimic the ear's natural response to speakers or musicians in front/behind listener.
    + Could be combined with spatial audio placement for simple 2D GUI.
