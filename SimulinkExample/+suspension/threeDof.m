classdef threeDof < suspension.vehicleSuspension
    properties
        FrontLeft
        FrontRight
        RearLeft
        RearRight
    end

    methods
        function obj = threeDof()
            obj.mdl = 'suspensionThreeDOF';
            obj.FrontLeft = suspension.springDamperLinear;
            obj.FrontRight = suspension.springDamperLinear;
            obj.RearLeft = suspension.springDamperLinear;
            obj.RearRight = suspension.springDamperLinear;
        end
    end
end
% Copyright 2022 The MathWorks, Inc.