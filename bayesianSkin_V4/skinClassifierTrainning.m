function skinClassifierTrainning( dataSetRandomized,trainingN,totalN,skinObservation,C )

global i n N M D RA R G B...
    pixelMatrixRPA pixelMatrixBPA pixelMatrixGPA pixelMatrixDA...
    pixelMatrixAA pixelMatrixMAD pixelMatrixDMPRU pixelMatrixMD...
    pixelMatrixMP pixelMatrixCD... 
    PMFRPA PMFBPA PMFGPA PMFDA PMFAA PMFMAD...
    PMFDMPRU PMFMD PMFMP PMFCD... 
    skinOccurance 

   % Pre-allocate accumulators for speed and availability...

   N = 6; M = 6000; D = 1; 

    pixelMatrixRPA = zeros( N, M ); 
    pixelMatrixBPA = zeros( N, M ); 
    pixelMatrixGPA = zeros( N, M ); 
    
    pixelMatrixMD = zeros( N, M ); 
    
    pixelMatrixDA = zeros( N, M );
    
    pixelMatrixAA = zeros( N, M ); 
    
    pixelMatrixMAD = zeros( N, M ); 
    
    pixelMatrixMP = zeros( N, M ); 
    
    pixelMatrixCD = zeros( N, M ); 
    
    pixelMatrixDMPRU = zeros( N, M ); 
    
    skinOccurance = zeros( 1, N );  

    R = zeros( N, totalN ); G = zeros( N, totalN ); B = zeros( N, totalN ); RA = zeros( N, 3 );

    % Classifier training stage...

    for i = 1:trainingN                    

        n = skinObservation( i ); % We can sacrifice memory storage space for computational speed.

        skinOccurance( n ) = skinOccurance( n )+1; % Accumulate occurance of the true value of the random sample.
        
        RGB = dataSetRandomized( i, 1:C-1 );  

        RA = runningAverage( RGB );
        
        % FEATURES
        
        pA = pixelAmplitudes( RGB ); % Individual pixel amplitudes.

        dA = dominantAmplitude( RGB ); % Maximum amplitude of RGB tuple.

        aA = averageAmplitude( RGB ); % Average amplitude of RGB tuple.

        aD = meanAmplitudeDistance( RGB ); %  Average dissimilarity between pixel values.

        mP = maxPowerMultiplication( RGB ); % Closest distance to average pixel multiplication.

        dP = distanceFromMaxPower( RGB, C ); % Euclidean distance from max DFT value.

        mD = minimumDistance( RGB ); % Minimum Lp norm over p..

        cD = chebyshevDistance( RGB ); % Maximize Lp norm over p.
        
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

    end

    % Generate PMFs for all features using data in the training stage.

       for n = 1:N             
            % Pixel PMFs...
            
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
