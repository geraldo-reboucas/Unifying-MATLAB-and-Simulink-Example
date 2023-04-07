classdef oneDof < suspension.vehicleSuspension
    properties
        Suspension
    end

    methods
        function obj = oneDof()
            obj.mdl = 'suspensionOneDOF';
            obj.Suspension = suspension.springDamperLinear;
        end
    end
end
% Copyright 2022 The MathWorks, Inc.