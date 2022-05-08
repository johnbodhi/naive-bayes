function [ cD ] = chebyshevDistance( RGB )

    global N D RA    
   
    rAve  = [ RA( 1, 1 )  RA( 2, 1 ) RA( 3, 1 ) RA( 4, 1 ) RA( 5, 1 ) RA( 6, 1 ) ];
    
    gAve = [ RA( 1, 2 )  RA( 2, 2 ) RA( 3, 2 ) RA( 4, 2 ) RA( 5, 2 ) RA( 6, 2 ) ]; 
    
    bAve = [ RA( 1, 3 )  RA( 2, 3 ) RA( 3, 3 ) RA( 4, 3 ) RA( 5, 3 ) RA( 6, 3 ) ];
    
    for p = 1:3
        for i = 1:N        
            Z( i, p ) = floor( abs( ...
                (  rAve( 1, i ) - RGB( 1, 1 ) )^p +...
                ( gAve( 1, i ) - RGB( 1, 2 ) )^p +...
                ( bAve( 1, i ) - RGB( 1, 3 ) )^p )^( 1 / p ) );        
        end
        L( p ) = max( Z( : , p ) );
    end
    
    [ cD, ~ ] = max( L ); cD = floor( mod( cD, D ) );
end
