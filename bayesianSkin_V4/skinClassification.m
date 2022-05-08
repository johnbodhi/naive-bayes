function [ X, DECISIONS, ERRORS ] = skinClassification( dataSetRandomized,skinObservation,trainingN,testN, C )
    
    global i n N M RA...
        pixelMatrixRPA pixelMatrixBPA pixelMatrixGPA pixelMatrixDA...
        pixelMatrixAA pixelMatrixMAD pixelMatrixDMPRU pixelMatrixMD...
        pixelMatrixMP pixelMatrixCD... 
        PMFRPA PMFBPA PMFGPA PMFDA PMFAA PMFMAD...
        PMFDMPRU PMFMD PMFMP PMFCD... 
        skinOccurance 

    DECISIONS = 0; ERRORS = 0; % Set decisions and errors to begin accumulation.

    confusionMatrix = zeros( N, N );
    
     % Classification stage...

    for i = trainingN+1:trainingN+testN

        n = skinObservation( i );

        skinOccurance( n ) = skinOccurance( n )+1;

        RGB = dataSetRandomized( i, 1:C-1 );        

        % FEATURES
        
        pA = pixelAmplitudes( RGB ); % Individual pixel amplitudes.

        dA = dominantAmplitude( RGB ); % Maximum amplitude of RGB tuple.

        aA = averageAmplitude( RGB ); % Average amplitude of RGB tuple.

        aD = meanAmplitudeDistance( RGB ); %  Average dissimilarity between pixel values.

        mP = maxPowerMultiplication( RGB ); % Closest distance to average pixel multiplication.

        dP = distanceFromMaxPower( RGB, C ); % Euclidean distance from max DFT value.

        mD = minimumDistance( RGB ); % Minimum euclidean distance from known mean vector.

        cD = chebyshevDistance( RGB ); % Maximize Lp norm over p.

        % Use optimum Bayesian classifier to predict random sample...

         decidedObservation = bayesianClassifier( pA, dA, aA, aD, mP, dP, mD, cD ); 

         % Accumulate successful decisions made...

         DECISIONS = DECISIONS + 1;

         % Compare decision with true value of random sample to
         % accumulate errors...

        if ( decidedObservation ~= n )
            ERRORS = ERRORS + 1;
        end        

        confusionMatrix( n, decidedObservation ) = confusionMatrix( n, decidedObservation )+1;
        
        % Accumulate for respective feature PMFs to improve predictive
        % performance...

        RA = runningAverage( RGB );
        
        pixelMatrixRPA( n, pA(1,1)+1) = pixelMatrixRPA( n, pA(1,1)+1)+1; 
        pixelMatrixBPA( n, pA(1,2)+1) = pixelMatrixBPA( n, pA(1,2)+1)+1; 
        pixelMatrixGPA( n, pA(1,3)+1) = pixelMatrixGPA( n, pA(1,3)+1)+1; 

        pixelMatrixMD( n, mD(1,1)+1) = pixelMatrixMD( n, mD(1,1)+1)+1;
        
        pixelMatrixDA( n, dA(1,1)+1) = pixelMatrixDA( n, dA(1,1)+1)+1; 

        pixelMatrixAA( n, aA(1,1)+1) = pixelMatrixAA( n, pA(1,1)+1)+1;    
        
        pixelMatrixMAD( n, aD(1,1)+1)  = pixelMatrixMAD( n, aD(1,1)+1)+1; 

        pixelMatrixDMPRU( n, dP(1,1)+1) = pixelMatrixDMPRU( n, dP(1,1)+1)+1;

        pixelMatrixMP( n, mP(1,1)+1) = pixelMatrixMP( n, mP(1,1)+1)+1;

        pixelMatrixCD( n, cD(1,1)+1)  = pixelMatrixCD( n, cD(1,1)+1)+1; 

       for n = 1:N             
            % Pixel counting by color PMFs...
            
            PMFRPA( n, 1:M) = pixelMatrixRPA( n, 1:M ) / skinOccurance( n );
            PMFBPA( n, 1:M ) = pixelMatrixBPA( n, 1:M ) / skinOccurance( n );
            PMFGPA( n, 1:M ) = pixelMatrixGPA( n, 1:M ) / skinOccurance( n );

            PMFMD( n, 1:M ) = pixelMatrixMD( n, 1:M ) / skinOccurance( n );
                        
            PMFDA( n, 1:M ) = pixelMatrixDA( n, 1:M ) / skinOccurance( n );

            PMFAA( n, 1:M ) = pixelMatrixAA( n, 1:M ) / skinOccurance( n ); 
            
            PMFMAD( n, 1:M ) = pixelMatrixMAD( n, 1:M ) / skinOccurance( n );

            PMFMP( n, 1:M ) = pixelMatrixMP( n, 1:M ) / skinOccurance( n );

            PMFDMPRU( n, 1:M ) = pixelMatrixDMPRU( n, 1:M ) / skinOccurance( n );

            PMFCD( n, 1:M ) = pixelMatrixCD( n, 1:M ) / skinOccurance( n );
            
       end      
    end
    
    X = ERRORS / DECISIONS;
end
