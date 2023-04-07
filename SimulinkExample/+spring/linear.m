classdef linear < spring.spring
    properties
        K   % stiffness
        x0  % static deformation
    end

    methods
        function obj = linear()
            obj.K = 21000;
            obj.x0 = 0;
            obj.mdl = 'springLinear_mdl';
        end
    end
end
% Copyright 2022 The MathWorks, Inc.