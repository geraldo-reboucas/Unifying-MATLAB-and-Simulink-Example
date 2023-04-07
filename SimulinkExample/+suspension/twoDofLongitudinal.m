classdef twoDofLongitudinal < suspension.vehicleSuspension
    properties
        Front
        Rear
    end

    methods
        function obj = twoDofLongitudinal()
            obj.mdl = 'suspensionTwoDOFLongitudinal';
            obj.Front = suspension.springDamperLinear;
            obj.Rear = suspension.springDamperLinear;
        end
    end
end
% Copyright 2022 The MathWorks, Inc.