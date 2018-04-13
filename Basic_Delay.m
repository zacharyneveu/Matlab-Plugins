classdef Basic_Delay < audioPlugin % inherit from audioPlugin base class
    properties      % Stores public data for class
        Gain = 1.5  % gain of echo
        Delay = 0.5 % Time in s of echo
    end
    properties (Access = private) % Store circular buffer privately
        CircularBuffer = zeros(192001,2);
        BufferIndex = 1;
        NSamples = 0;
    end
    properties (Constant) % add interface to plugin
        PluginInterface = audioPluginInterface(...
            audioPluginParameter('Gain',...
            'DisplayName', 'Echo Gain',...
            'Mapping',{'lin',0,3}),...
            audioPluginParameter('Delay',...
            'DisplayName', 'Echo Delay',...
            'Label','seconds'))
    end
    methods
        function out = process(plugin, in)
            out = zeros(size(in));
            writeIndex = plugin.BufferIndex;
            readIndex = writeIndex - plugin.NSamples;
            if readIndex <= 0
                readIndex = readIndex + 192001;
            end

            for i = 1:size(in,1)
                % write input to circular buffer at start
                plugin.CircularBuffer(writeIndex,:) = in(i,:);

                % set echo to read part of circular buffer
                echo = plugin.CircularBuffer(readIndex,:);

                % assign out=in+echo
                out(i,:) = in(i,:) + echo * plugin.Gain;

                writeIndex = writeIndex + 1;
                % stop overflow if need be
                if writeIndex > 192001
                    writeIndex = 1;
                end

                readIndex = readIndex + 1;
                % stop overflow if need be
                if readIndex > 192001
                    readIndex = 1;
                end
            end
            plugin.BufferIndex = writeIndex;
        end
        function set.Delay(plugin, val)
            plugin.Delay = val;
            % Samp/sec * sec = samples
            plugin.NSamples = floor(getSampleRate(plugin)*val);
        end
        function reset(plugin)
            plugin.CircularBuffer = zeros(192001,2);
            plugin.NSamples = floor(getSampleRate(plugin)*plugin.Delay);
        end
    end
end