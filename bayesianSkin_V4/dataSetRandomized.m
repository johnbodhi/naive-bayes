function [ X ] = dataSetRandomized(dataSet,R,C)

    if ( isfile( 'dataSetRandomized.csv' ) )

        X = csvread('dataSetRandomized.csv');

    else

        dataSetRandomized = zeros( R, C ); 

        i = zeros(R,1);

        for k = 1:R

            i( k ) = randi( [1, R ] );

            while ( find( i( 1:k-1, 1 ) == i( k ) ) )
                i( k ) = randi( [ 1, R ] );      
            end

            dataSetRandomized( k, 1:C )  = dataSet( i( k ), 1:C );
        end        

            csvwrite('dataSetRandomized.csv',dataSetRandomized);

            X = dataSetRandomized;

    end    
end