classdef (Abstract) spring < slVASPart
    methods
        function obj = spring(obj)
            obj.VariantChoices = {'springLinear_mdl','springLookup_mdl'};
        end
    end
end
% Copyright 2022 The MathWorks, Inc.