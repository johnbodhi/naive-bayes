function [ PREC, REC, ACC, F1 ] = fMeasure( DECISIONS, ERRORS )
    
        TP = ( DECISIONS - ERRORS );
        
        FP = ( ERRORS );
        
        TN = 0;
        
        FN = 0;
        
        PREC = TP / ( TP + FP );
        
        REC = TP / ( TP + FN );
        
        ACC  = ( TP + TN ) / ( TP + TN + FP + FN );
        
        F1 = TP / ( TP + 0.5 * ( FP + FN ) );            
end