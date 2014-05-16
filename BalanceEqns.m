//
//  BalanceEqns.m
//  hannouki
//
//  Created by Guest User on 5/15/14.
//  Copyright (c) 2014 Guest User. All rights reserved.
//

#import "BalanceEqns.h"
//#import "computeInputFlowRate"

@implementation BalanceEqns
@synthesize dxdt;
@synthesize numRates = _numRates;
@synthesize dataFile = _dataFile;

-(id) init
{
    self = [super init];
    if (self)
    {
        NSMutableArray *dxdt = [[NSMutableArray alloc] init];
        NSNumber *DXDT = [NSNumber numberWithFloat:0.2f];
        [dxdt addObject:DXDT];
    }
    return self;
}

//Do I have to obtainDataFileValues again???
-(void) obtainDataFileValues
{
    //how to store float type objects in these vectors/arrays???
    //that's what i'm trying to do here...
    self.dataFile = [[DataFile alloc] init];
    NSMutableDictionary *dictionary = [[self dataFile] constructDataStructure];
    
    
    rateConstantVector = [dictionary objectForKey:@"RateConstantVector"];
    NSNumber *num = [NSNumber numberWithFloat:0.2f];
    [rateConstantVector addObject:num];
    
    initialConditionsVector = [self.dataFile valueForKey:@"InitialConditionsVector"];
    NSNumber *fum = [NSNumber numberWithFloat:0.2f];
    [initialConditionsVector addObject:fum];
    
    parameterVector = [self.dataFile valueForKey:"ParameterVector"];
    NSNumber *gum = [NSNumber numberWithFloat:0.2f];
    [parameterVector addObject:gum];
    
    
}


void EvaluateBalanceEqns (register float dxdt[], register float initialConditionsVector[], register float parameterVector[])
{
    float rV;
    float FIN, X, S, P, V, ALPHA, XIN,SIN, PIN, YXS, YXP, BETA;
    
    evaluateKinetics ( register float rV[], register float initialConditionsVector[], register float parameterVector[]);

    
    FIN =0;// ComputeInputFlowRate( );
  
    
    X = initialConditionsVector[0];
    S = initialConditionsVector[1];
    P = initialConditionsVector[2];
    V = initialConditionsVector[3];
                          
    ALPHA = parameterVector [0];
    XIN = parameterVector [1];
    SIN = parameterVector [2];
    PIN = parameterVector [3];
    YXS = parameterVector [10];
    YXP = parameterVector [11];
    BETA = parameterVector[12];
 
    //CellMass
    dxdt[0] = (FIN/V)*(XIN-X) + (rV[0] - rV[1])*X;
    //Substrate
    dxdt[1] = (FIN/V)*(SIN-S) + (1/YXS)*(rV[2])*X + (BETA/YXS)*rV[1]*X;
    //Product
    dxdt[2] = (FIN/V)*(PIN-P) + (1/YXP)*rV[3]*X;
    //volume
    dxdt[3] = FIN - ALPHA*FIN;
    
    
    
    return;
                      }

@end
