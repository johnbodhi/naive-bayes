function [ RA ] = runningAverage( RGB )

global i n R G B
    
    R( n, i ) = RGB( 1,1 ); G( n, i ) = RGB( 1, 2 ); B( n, i ) = RGB( 1, 3 );
    
    RA = [  mean( R( 1, : ) )  mean( G( 1, : ) ) mean( B( 1, : ) ) 
                mean( R( 2, : ) )  mean( G( 2, : ) ) mean( B( 2, : ) ) 
                mean( R( 3, : ) )  mean( G( 3, : ) ) mean( B( 3, : ) ) 
                mean( R( 4, : ) )  mean( G( 4, : ) ) mean( B( 4, : ) ) 
                mean( R( 5, : ) )  mean( G( 5, : ) ) mean( B( 5, : ) ) 
                mean( R( 6, : ) )  mean( G( 6, : ) ) mean( B( 6, : ) ) ];
end
