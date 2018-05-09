function ITD(soundAngle, headWidth)
    % ITD Get interaural time delay from angle and head width
    %   soundAngle: angle of incoming sound in radians
    %   headWidth: width between ears of listener
    return headWidth / SOUNDSPEED * (soundAngle + sin(soundAngle))