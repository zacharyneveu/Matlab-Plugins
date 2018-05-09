classdef Headphone_Pan_Knob < audioPlugin
    % A simple pan knob that implements a HRTF.  This has several advantages
    %   + Distinguish whether sounds are forwards or backwards of listener
    %   + 
    %{
        @startuml
        (*) --> "Get azimuth, elevation, distance"
        --> "Apply gain change/filtering/delay for distance"
        --> "Retreive HRTF data for each ear"
        --> "Convolve signal by HRTF impulse response"
        --> "Output convolved signals"
        --> (*)
        @enduml
    %}
    
    properties
        % Source distance in meters from listener
        SourceDist = 1;
        % Source angle in degrees (0=front, 90=left, 180=back, 270=right)
        SourceAngle = 0;
    end
    properties (Access = private)
        % Use this section to initialize properties that the end-user does not
        % interact with directly.
    end
    properties (Constant)
        PluginInterface = audioPluginInterface(...
        audioPluginParameter('Distance',...
        'DisplayName','Source Distance',...
        'Mapping',{'lin',1,50}),...
        audioPluginParameter('Angle',...
        'DisplayName','Source Angle',...
        'Label','degrees (0=center, increment counter-clockwise)',...
        'Mapping',{'lin',0,360}))
    end
    methods
        function out = process(plugin, in)
            % This section contains instructions to process the input audio
            % signal. Use plugin.MyProperty to access a property of your
            % plugin.
        end
        function reset(plugin)
            % This section contains instructions to reset the plugin between
            % uses or if the environment sample rate changes.
        end
        function set.MyProperty(plugin, val)
            % This section contains instructions to execute if the
            % specified property is modified. Properties associated with
            % parameters are updated automatically. Use the set method to
            % execute more complicated instructions.
        end
    end
end