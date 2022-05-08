function [ F ] = NPointDFT( RGB, K, N, C )

    BINS = K; X = zeros( BINS, C-1 ); F = zeros(1,C-1);

    for z = 1:C-1
        for k = 1:BINS
            for n = 1:N
                    X( k, z ) = X( k, z ) + RGB( z ) * exp( -1j * 2 * pi * ( k - 1 ) * ( n - 1 ) / N );
            end
        end        
        F( 1, z ) = sum( X( 1:BINS, z ) );        
    end
end