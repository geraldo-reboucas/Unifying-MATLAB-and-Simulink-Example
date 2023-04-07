classdef lookup < damper.damper
    properties
        dx;
        C;
    end
    methods
        function obj = lookup()
            pts = -5:5;
            obj.dx = 0.1*pts;
            obj.C = -1000*tanh(pts);
            obj.mdl = 'damperLookup';
        end

        function plotForceVsDisplacement(obj)
            h = plot(obj.dx,obj.K);
            h.LineWidth = 2;
            h.Marker = 'o';
            axis([min(obj.dx) max(obj.dx) 1.2*min(obj.K) 1.2*max(obj.K)] )
            title('Force vs Speed')
            xlabel('Speed (m)')
            ylabel('Force (N)')
        end

    end
end
% Copyright 2022 The MathWorks, Inc.