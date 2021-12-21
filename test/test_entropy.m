classdef test_entropy < entropy_base_test_class
    
    properties
    end
    
    
    methods (Test)
        
        function test_generate_synthetic_signal(test_case)
            
            adjusted_dist = .01;
            max_patt_len = 2;
            patterns = [0 0; 1 .95; 0 0; 1 0]';
            entropy_vals = compute_entropy(patterns, max_patt_len, adjusted_dist);
            test_case.assertEqual(entropy_vals, -log(0.5), 'AbsTol', 1e-12);
            
          
        end
        
    end
    
end
