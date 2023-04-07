classdef slVASPart_maskCB

    methods(Static)

        % Following properties of 'maskInitContext' are avalaible to use:
        %  - BlockHandle 
        %  - MaskObject 
        %  - MaskWorkspace: Use get/set APIs to work with mask workspace.
        function MaskInitialization(h)
            obj = h.MaskWorkspace.get('obj');
            obj.maskInit(gcb);
        end

        % Use the code browser on the left to add the callbacks.

    end
end