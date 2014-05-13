//
//  improvedEuler.h
//  
//
//  Created by labuser on 4/15/14.
//
//

#import <Foundation/Foundation.h>

@interface improvedEuler : NSObject

    
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
