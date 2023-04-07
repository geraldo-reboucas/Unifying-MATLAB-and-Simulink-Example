classdef slVASPart < handle

    properties
        VariantChoices cell
        BlockPath
        VASMode = 'active'; % Can be set to "all", "active" or "none"
        Log Simulink.SimulationData.Dataset
    end

    properties
        mdl char
    end
    methods

        % function obj = slVASPart()
        %     disp('slVASPart - constructor')
        %     class(obj)
        % end


        function list = getVariantChoices(obj)

            if ~isempty(obj.VASMode)
                switch obj.VASMode
                    case 'all'
                        list = obj.VariantChoices;
                    case 'active'
                        list = {obj.mdl};
                    case 'none'
                        list = {};
                    otherwise
                        list = obj.VariantChoices;
                end
            else
                list = obj.VariantChoices;
            end

        end

        function obj = maskInit(obj,blk)
            obj.BlockPath = blk;
            try
                set_param(blk,'LabelModeActiveChoice',obj.mdl)
            catch ME
                disp([blk ' - Could not set LabelModeActiveChoice']);
            end
        end

        function obj = getLog(obj,out)
            if not(isempty(out.logsout))
                obj.Log = out.logsout.find('-regexp','BlockPath',[obj.BlockPath '(/.*)?$']);
                props = properties(obj);
                for i = 1:length(props)
                    if isa(obj.(props{i}),'slVASPart')
                        getLog(obj.(props{i}),out);
                    end
                end
            end
        end
    end
end