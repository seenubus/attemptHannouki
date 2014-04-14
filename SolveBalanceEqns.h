//
//  SolveBalanceEquations.h
//  MyHannouki
//
//  Created by labuser on 4/14/14.
//  Copyright (c) 2014 varnerlabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolveBalanceEquations : NSObject
{
    //   id RHS;
@protected
    double _tStart;
    double _tStop;
    double _tStep;
    double _volumetricFlowRateIn;
    float **rateConstantVector;
    float **initialConditionsVector;
    float **stoichiometricMatrix;
    float **measurementIndexVector;
    NSMutableDictionary* _dataFile;
    
    
}

-(void) print;
// Display
@property (assign) double tStep;
@property (assign) double tStart;
@property (assign) double tStop;
@property (retain) NSMutableDictionary *dataFile;

-(void) obtainDataFileValues;

@end
