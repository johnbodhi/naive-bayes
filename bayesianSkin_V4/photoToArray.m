function photoToArray( )
    
    dryDir = "C:\Users\johnm\(11) Spring 2022\ELE 658\Assignments\Skin\bayesianSkin_V6\Data\Image Data\Dry";  
    
    normalDir = "C:\Users\johnm\(11) Spring 2022\ELE 658\Assignments\Skin\bayesianSkin_V6\Data\Image Data\Normal";
    
    oilyDir = "C:\Users\johnm\(11) Spring 2022\ELE 658\Assignments\Skin\bayesianSkin_V6\Data\Image Data\Oily";
    
    redDir = "C:\Users\johnm\(11) Spring 2022\ELE 658\Assignments\Skin\bayesianSkin_V6\Data\Image Data\Red";
    
    scalyDir = "C:\Users\johnm\(11) Spring 2022\ELE 658\Assignments\Skin\bayesianSkin_V6\Data\Image Data\Scaly";
    
    notSkinDir = "C:\Users\johnm\(11) Spring 2022\ELE 658\Assignments\Skin\bayesianSkin_V6\Data\Image Data\Not Skin";
    
    directoryArr = [ dryDir normalDir oilyDir redDir scalyDir notSkinDir ];
    
    str1_ = [ "dry-skin (" "normal-skin (" "oily-skin (" "red-skin (" "scaly-skin (" "not-skin (" ];
    
    for j = 1:size(str1_,2)
        cd( directoryArr( j ) );
        Images = dir('*.jpg'); numImages( j )= numel( Images );
        for i = 1:numImages( j )    
            str1 = str1_( j );  
            str2 = num2str( i ); 
            str3 = ").jpg";
        
            IMAGES( i, j ) = append( str1, str2, str3 );
        end    
    end
    
    Nr = 58; Mr = 58;

    NN = 0; sampleSize = Nr * Mr; l = 1;
    
    for p = 1:size( IMAGES, 2 )
    
         cd( directoryArr( p ) )
        
        for k = 1:numImages( p )
        
            RGB = imread( IMAGES( k, p ) ); 
        
            RGB = imresize( RGB, [ Nr, Mr ] );
            
             I = rgb2gray(RGB);
        
            BW  = edge( I, 'Canny' );    
        
            h = imshow( IMAGES( k, p ) );
            
            im = imagemodel( h );    
        
            % Resized RGB vector...
           
            for j = 1:Nr
                for i = 1:Mr          
                    pixels( l, 1:3 ) = getPixelValue( im, i, j );
                    pixels( l, 4:4 ) = p;
                    l = l + 1;
                end
            end 
        
           % 3-D Binarized array....
            
%            N = size( BW, 1 ); M = size( BW, 2 );
%         
%            BWV = reshape( BW, [1, N * M ] )'; BWV_ = BWV( 1:sampleSize );
%         
%            BWV_M = reshape( BWV_, [ N, M ] );
%         
%            BWV_MZ( :, :, k, p ) = BWV_M( :, : );
    
          % 3-D Grayscale array....
    
%            N = size( I, 1 ); M = size( I, 2 );
%         
%            IV = reshape( I, [ 1, N * M ] )'; IV_ = IV( 1:sampleSize );
%         
%            IV_M = reshape( IV_, [ N, M ] );
%         
%            IV_MZ( :, :, k, p ) = IV_M( :, : );
    
        end    
    
          cd("C:\Users\johnm\(11) Spring 2022\ELE 658\Assignments\Skin\bayesianSkin_V6\MATLAB Code");

%           GS_PERM_BIN( :, :, :, p ) = matrixPermutation( BWV_MZ );   
%           GS_PERM_GRAY( :, :, :, p ) = matrixPermutation( IV_MZ );    
    end
    dataSet = pixels;