classdef (Abstract) vehicleSuspension < slVASPart
    methods
        function obj = vehicleSuspension()
            obj.VariantChoices = {'suspensionOneDOF',...
                'suspensionTwoDOFLateral',...
                'suspensionTwoDOFLongitudinal',...
                'suspensionThreeDOF'};
        end
    end
end
% Copyright 2022 The MathWorks, Inc.