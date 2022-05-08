clc; clear all; close all; tic
% John Garofalo
% ELE 658 - Artificial Intelligence
% Dr. Liu

% Dry = 1, Normal = 2, Oily = 3, Red = 4, Scaly = 5, Not Skin = 6...

dataSet = readmatrix( 'skinRGB.csv' );  

R = size( dataSet, 1 ); C  =  size( dataSet, 2 ); totalN = R;

dataSetRandomized = dataSetRandomized( dataSet, R, C );

skinObservation = dataSetRandomized( :, C );

trainingN = floor( 0.6 * totalN ); testN = floor( 0.4 * totalN ); 

skinClassifierTrainning( dataSetRandomized, trainingN, totalN, skinObservation, C );

[ PERROR, DECISIONS, ERRORS ] = skinClassification( dataSetRandomized, skinObservation, trainingN, testN, C );

[ PREC, REC, ACC, F1 ] = fMeasure( DECISIONS, ERRORS );

toc