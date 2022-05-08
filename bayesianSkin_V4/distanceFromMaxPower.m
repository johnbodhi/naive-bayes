function [ dP ] = distanceFromMaxPower( RGB, C )

        global M

        K = 10;  N = 10; 
        
        F = NPointDFT( RGB, K, N, C );
           
        mP( 1, 1:C-1 ) = F( 1, 1:C-1 );
                
        [ maxP, u ] = max( real( mP( 1, : ) ) );  [ minP, v ] = min( real( mP( 1, : ) ) );
        
        for i = 1:C-1            
            if( i ~= u && i ~= v ) % Determin index that is not a minimum or a maximum to find distances.
                break
            end  
        end
        
        Dmax= mod( floor( abs( maxP( 1, 1 ) - minP( 1, 1 ) ) ), M ); 
        
        Dmin = mod( floor( abs( minP( 1, 1 ) - mP( 1, i ) ) ), M );

        dP= [ Dmax, Dmin ];
end
