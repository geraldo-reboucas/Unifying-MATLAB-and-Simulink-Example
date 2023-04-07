classdef (Abstract) springDamper < slVASPart
    properties
        Spring
        Damper
    end

    methods
        function obj = springDamper()
            obj.mdl = 'suspension';
            obj.VariantChoices = {obj.mdl};
            obj.Spring = spring.linear;
            obj.Damper = damper.linear;
        end
    end
end
% Copyright 2022 The MathWorks, Inc.