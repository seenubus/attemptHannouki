//
//  kinetics.m
//  hannouki
//
//  Created by Guest User on 5/15/14.
//  Copyright (c) 2014 Guest User. All rights reserved.
//

#import "kinetics.h"

@implementation kinetics
@synthesize rV;
@synthesize dataFile = _dataFile;
@synthesize tStart = _tStart;
@synthesize tStop = _tStop;
@synthesize tStep = _tStep;
@synthesize numRates = _numRates;


//code to initialize object
-(id) init{
    self [[super init]];
                  if (self) {NSMutableArray * rV [ [ NSMutableArray alloc] init];
                                  NSNumber * rateVector = [ NSNumber numberWithFloat:0.2f];
                      [rV addObject:rateVector];
                  }
                  return self;
                  }


-(void) obtainDataFileValues
{
    //how to store float type objects in these vectors/arrays???
    //that's what i'm trying to do here...
    
    rateConstantVector = [self.dataFile valueForKey:"RateConstantVector"];
    NSNumber *num = [NSNumber numberWithFloat:0.2f];
    [rateConstantVector addObject:num];
    
    initalConditionsVector = [self.dataFile valueForKey:"InitialConditionsVector"];
    NSNumber *fum = [NSNumber numberWithFloat:0.2f];
    [initalConditionsVector addObject:fum];
    
    parameterVector = [self.dataFile valueForKey:"ParameterVector"];
    NSNumber *gum = [NSNumber numberWithFloat:0.2f];
    [parameterVector addObject:gum];
    
    
}

void evaluateKinetics( register float rV[], register float initialConditionsVector[], register float parameterVector[])
{
    int numRates;
    float X, S, P, V, mu_g_max, KGS, KI, P_MAX, TOLERANCE_ORDER, kd, TOLERANCE;
    float GROWTH_RATE, CELL_DEATH, SUBSTRATE_UPTAKE, PRODUCT_FORMATION;
    
    //
    X = initialConditionsVector[0];
    S = initialConditionsVector[1];
    P = initialConditionsVector[2];
    V = initialConditionsVector[3];
    
    //
    mu_g_max = parameterVector[4];
    KGS = parameterVector[5];
    KIG = parameterVector[6];
    P_MAX = parameterVector[7];
    TOLERANCE_ORDER = parameterVector[8];
    kd = parameterVector[9];
    
    TOLERANCE = (1-P/P_MAX)^(TOLERANCE_ORDER);
    if (TOLERANCE<0) {
        TOLERANCE = 0.0;
        }

    rV[0] = mu_g_max*(S/(S+KGS+S^2/KIG)*TOLERANCE);
    GROWTH_RATE = rV[0];
    rV[1] = kd;
    CELL_DEATH = rV[1];
    rV[2] = rV[0];
    SUBSTRATE_UPTAKE = rV[2];
    rV[3] = rV[0];
    PRODUCT_FORMATION = rV[3];
    
    return;
}

    
@end
