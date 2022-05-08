function  [ pA ] = pixelAmplitudes( RGB )

    Ra = RGB(1,1);
    
    Ba = RGB(1,2);
    
    Ga = RGB(1,3);
    
    pA = [ Ra, Ga, Ba ];

end
