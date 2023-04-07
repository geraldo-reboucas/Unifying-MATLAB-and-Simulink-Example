classdef (Abstract) body < slVASPart
    properties
        W   % half of lateral hub displacement from body CG
        L   % half of longitudinal hub displacement from body CG
        Mb  % body mass in kg
        Iyy	% body moment of inertia about y-axis in kgm^2 for pitch moment
        Ixx % body moment of inertia about x-axis in kgm^2 for roll moment
    end

    methods

        function obj = body()
            obj.mdl = 'body_mdl';
            obj.VariantChoices = {obj.mdl};
        end

        function plotHeight(obj)
            plot(obj.Log{1}.Values.plot);
        end
    end
end
% Copyright 2022 The MathWorks, Inc.