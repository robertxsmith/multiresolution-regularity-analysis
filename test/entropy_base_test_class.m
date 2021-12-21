classdef entropy_base_test_class < matlab.unittest.TestCase
    
    properties
        unit_test_data_dir
    end
    
    methods(TestMethodSetup)
        function obj = entropy_base_test_class(varargin)

            obj.unit_test_data_dir = fullfile(entropy_root, 'test');
            
        end
    end
    
end
