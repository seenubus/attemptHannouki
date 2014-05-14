//
//  kinetics.m
//  hannouki
//
//  Created by Guest User on 5/14/14.
//  Copyright (c) 2014 Guest User. All rights reserved.
//

#import "kinetics.h"

@implementation kinetics
@synthesize rateConstant;

- (id)init {
    self = [super init];
    if (self) {
        
        // Code to initilize the object -
    }
    return self;
}

/*
 
 - (NSMutableArray *) calculateKinetics
 {
 NSMutableArray *kinetic;
 
 [kinetic addObject:(self.species * self.rateConstant)];
 
 return kinetic;
 
 }
 */




// What is going on Lewis - this doesn't compile!!!
void evaluateMassBalance(register float xdot[],register float state,register float network[][COLUMN], float kinetic[])
{
    
    /* inclde call kinetics */
    float X, S, P, V, mu_g_max, KGS, KIG, P_MAX, TOLERANCE_ORDER, kd, TOLERANCE;
    
    X = stateVector(1,1);
    S = stateVector(2,1);
    P = stateVector(3,1);
    V = stateVector(4,1);
    
    mu_g_max = ParameterVector(5,1);
	KGS = ParameterVector(6,1);
	KIG = ParameterVector(7,1);
	P_MAX = ParameterVector(8,1);
	TOLERANCE_ORDER = ParameterVector(9,1);
	kd = ParameterVector(10,1);
    
    
    TOLERANCE = (1 - P/P_MAX)^(TOLERANCE_ORDER);
	if (TOLERANCE<0)
		TOLERANCE = 0.0;
	
    
	// Rate 1 - growth rate
	rV(1,1) = mu_g_max*(S/(S + KGS + S^2/KIG))*TOLERANCE;
    
	// Rate 2 - cell death
	rV(2,1) = kd;
    
	// Rate 3 - susbtrate uptake -
	rV(3,1) = rV(1,1);
    
	// Rate 4 - product formation -
	rV(4,1) = rV(1,1);
    
    
    
}

-(void) dealloc
{
    self.species = nil;
    self.rateConstant = nil;
    [super dealloc];
}
@end
