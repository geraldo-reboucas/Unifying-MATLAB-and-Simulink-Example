classdef (Abstract) vehicle < slVASPart
    properties
        Suspension 
        Body
    end

        methods
            function obj = vehicle()
                obj.mdl = 'vehicle_mdl';
                obj.VariantChoices = {obj.mdl};
            end

            function plotCG(obj)
                T = obj.Log.extractTimetable;
                stackedplot(T);
            end

            function plotZ(obj)
%                 figure
                T = obj.Log.extractTimetable;
                stackedplot(T,"z")
            end
        end
end
% Copyright 2022 The MathWorks, Inc.