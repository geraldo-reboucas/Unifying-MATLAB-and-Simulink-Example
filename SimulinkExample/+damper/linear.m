classdef linear < damper.damper
    properties
        C
    end

    methods
        function obj = linear()
            obj.C = 2500;
            obj.mdl = 'damperLinear';
        end
    end
end
% Copyright 2022 The MathWorks, Inc.