function [ mP ] = maxPowerMultiplication( RGB )
    
    global D

    mP = max( [ mod( RGB( 1, 1 ) * RGB( 1, 2 ) , D )...
        mod( RGB( 1, 1 ) * RGB( 1, 3 ) , D )...
        mod( RGB( 1, 2 ) * RGB( 1, 3 ) , D ) ] );  
    
end
