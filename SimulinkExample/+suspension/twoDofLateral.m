classdef twoDofLateral < suspension.vehicleSuspension
    properties
        Left
        Right
    end

    methods
        function obj = twoDofLateral()
            obj.mdl = 'suspensionTwoDOFLateral';
            obj.Left = suspension.springDamperLinear;
            obj.Right = suspension.springDamperLinear;
        end
    end
end
% Copyright 2022 The MathWorks, Inc.