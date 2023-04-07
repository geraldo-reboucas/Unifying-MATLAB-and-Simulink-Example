classdef lookup < spring.spring
    properties
        x;
        K;
        x0;
    end
    methods
        function obj = lookup()
            pts = -5:5;
            obj.x = 0.5*pts;
            obj.K = -12000*tanh(pts);
            obj.x0 = 0;
            obj.mdl = 'springLookup_mdl';
        end

        function plotForceVsDisplacement(obj)
            % My Description
            h = plot(obj.x,obj.K);
            h.LineWidth = 2;
            h.Marker = 'o';
            axis([min(obj.x) max(obj.x) 1.2*min(obj.K) 1.2*max(obj.K)] )
            title('Force vs Deformation')
            xlabel('Deformation (m)')
            ylabel('Force (N)')
        end

    end
end
% Copyright 2022 The MathWorks, Inc.