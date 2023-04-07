classdef lookup2D < damper.damper
    properties
        x;
        dx;
        C;
    end
    methods
        function obj = lookup2D()
            pts = -5:5;
            obj.x = 0.1*pts;
            obj.dx = 1*pts;
            [X,DX] = meshgrid(obj.x,obj.dx);
            obj.C = -10000*tanh(X).*abs(tanh(DX));
            obj.mdl = 'damperLookup2D';
        end
    end
end
% Copyright 2022 The MathWorks, Inc.