function [ aD ] = meanAmplitudeDistance( RGB )

    aD = floor( sqrt( ( RGB(1,1) - RGB(1,2) )^2 + ( RGB(1,1) - ...
        RGB(1,3) )^2 + ( RGB(1,2) - RGB(1,3) )^2 ) / 3 );

end
