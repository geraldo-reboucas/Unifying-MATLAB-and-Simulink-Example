classdef slPart < handle & matlab.mixin.CustomDisplay 
    properties (Hidden = true)
        BlockPath char
        Log Simulink.SimulationData.Dataset
    end
    methods
        function obj = maskInit(obj,blk)
            obj.BlockPath = blk;

            % If the block has variants, set active variant based on the object class
            if strcmp(get_param(blk,'Variant'),'on')
                variantChoices = get_param(blk,'VariantChoices'); % Get all variant choices
                if ~isempty(variantChoices)
                    classList = {class(obj),superclasses(obj)}; % Get the list of class and superclasses
                    classList = cat(1,classList{:});
                    matchingChoices = intersect(classList,{variantChoices.Name}); % Find the label that matches the class or closest superclass
                    if ~isempty(matchingChoices)
                        set_param(blk,'LabelModeActiveChoice',matchingChoices{1}); % Apply the first match
                    else
                        disp(['No matching choice found for ' blk]);
                    end
                end
            end
        end
        
        function variantList = getVariantChoices(obj)
            variantList = {};
        end



        % function getVariantChoices(obj)
        % 
        % end


        function obj = getLog(obj,out)
            if not(isempty(out.logsout))
                obj.Log = out.logsout.find('-regexp','BlockPath',[obj.BlockPath '(/.*)?$']);
                props = properties(obj);
                for i = 1:length(props)
                    if isa(obj.(props{i}),'slPart')
                        getLog(obj.(props{i}),out);
                    end
                end
            end
        end

        function evalBlks(obj,blk)
            % Calls Simulink.Block.eval for all slPart blocks in the model
            % in a hierarchical manner. Starts from top most part and walk
            % down the hierarchy. This allows updating the variants at edit
            % time, without a full update diagram
            opts = Simulink.FindOptions;
            opts.LookUnderMasks = 'none';
            opts.MatchFilter = @Simulink.match.internal.filterOutInactiveVariantSubsystemChoices;
            blks = Simulink.findBlocks(blk,'MaskType','slPart',opts);
            for i = 1:length(blks)
                Simulink.Block.eval(blks(i));
                evalBlks(obj,blks(i));
            end

        end
    end

    % methods  (Access = protected)
    %     function str = getHeader(obj)
    %         % Hyperlink to edit the file
    %         str1 = sprintf(['slPart <a href="matlab:edit(''' class(obj) ''')">' class(obj) '</a>\n']);
    %         if isempty(obj.BlockPath)
    %             str2 = sprintf('Instantiated in: --- unset ---');
    %         else
    %             % Hyperlink to open the subsystem where the objec tis being used
    %             str2 = sprintf(['Instantiated in: <a href="matlab:open_system(''' char(obj.BlockPath) ''',''force'')">' char(obj.BlockPath) '</a>\n']);
    %         end
    %         str = [str1 str2 ];
    %     end
    % 
    %     function str = getFooter(obj)
    %         % Display number of logged signals
    %         if isempty(obj.Log)
    %             str = sprintf('No logged data\n');
    %         else
    %             str = sprintf(['Number of logged signals = ' num2str(obj.Log.numElements)]);
    %         end
    %     end
    % end
end
% Copyright 2022 The MathWorks, Inc.


