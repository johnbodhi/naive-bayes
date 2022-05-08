function [ mD ] = minimumDistance( RGB )

    global N D RA

    ALPHAD = 10;  BETAD = 10;  GAMMAD = 10; 
    
    ALPHAN = -10; BETAN = 10;  GAMMAN = 10;
    
    ALPHAO = -10; BETAO = -10; GAMMAO = 10;
   
    ALPHAR = 10;  BETAR = -10;  GAMMAR = 10;
  
    ALPHAS = -10; BETAS = -10;  GAMMAS = -10; 

    ALPHANS = 10; BETANS = -10;  GAMMANS = 10; 

    ALPHA = [ ALPHAD ALPHAN ALPHAO ALPHAR ALPHAS ALPHANS ];

    BETA = [ BETAD BETAN BETAO BETAR BETAS BETANS ];

    GAMMA = [ GAMMAD GAMMAN GAMMAO GAMMAR GAMMAS GAMMANS ];

    LAMBDA = [ ALPHA' BETA' GAMMA' ];

    rAve  = [ RA( 1, 1 )  RA( 2, 1 ) RA( 3, 1 ) RA( 4, 1 ) RA( 5, 1 ) RA( 6, 1 ) ];
    
    gAve = [ RA( 1, 2 )  RA( 2, 2 ) RA( 3, 2 ) RA( 4, 2 ) RA( 5, 2 ) RA( 6, 2 ) ]; 
    
    bAve = [ RA( 1, 3 )  RA( 2, 3 ) RA( 3, 3 ) RA( 4, 3 ) RA( 5, 3 ) RA( 6, 3 ) ];

    for p = 1:3
        for i = 1:N    
            Z( i,p ) = floor( abs( ...
                ( LAMBDA( i, 1 ) * rAve( 1, i )  - RGB( 1, 1 ) )^p +...
                ( LAMBDA( i, 2 ) * gAve( 1, i ) - RGB( 1, 2 ) )^p +...
                ( LAMBDA( i, 3 ) * bAve( 1, i ) - RGB( 1, 3 ) )^p )^( 1 / p ) );    
        end
        L( p ) = min( Z( :,p ) );
    end
    
    [ mD, ~ ] = min( L ); mD = floor( mod( mD, D ) );
end