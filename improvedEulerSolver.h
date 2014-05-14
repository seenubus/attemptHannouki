//
//  improvedEulerSolver.h
//  hannouki
//
//  Created by Guest User on 5/14/14.
//  Copyright (c) 2014 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface improvedEulerSolver : NSObject
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
    //float **BalanceEquationsCall1;
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
