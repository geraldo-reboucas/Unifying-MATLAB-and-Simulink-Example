classdef (Abstract) damper < slVASPart
    methods
        function obj = damper()
            obj.VariantChoices = {'damperLinear','damperLookup','damperLookup2D'};
        end
    end
end
% Copyright 2022 The MathWorks, Inc.