//
//  improvedEuler.m
//  
//
//  Created by labuser on 4/15/14.
//
//

#import "improvedEuler.h"


@implementation improvedEuler

@synthesize tStep = _tStep;
@synthesize tStop = _tStop;
@synthesize tStart = _tStart;
@synthesize dataFile = _dataFile;

- (id)init {
    self = [super init];
    if (self) {
        
        // Code to initialize the object -
        [self setup];
        
    }
    return self;
}

-(void)setup
{
    //
}

- (void)dealloc {
    
    // Clean up my iVars -
    self.dataFile = nil;
    [super dealloc];
    
}








- (void) obtainDataFileValues
{
    // We need to add the resize bit to all of these
    rateConstantVector = [Utill convertNSArrayToFloat:[self.dataFile valueForkey:"RateConstantVector"]];
    initialConditionsVector = [Utill convertNSArrayToFloat:[self.dataFile valueForkey:"InitialConditionsVector"]];
    stoichiometricMatrix = [Utill convertNSArrayToFloat:[self.dataFile valueForkey:"StoichiometricMatrix"]];
    measurementIndexVector = [Utill convertNSArrayToFloat:[self.dataFile valueForkey:"MeasurementIndexVector"]];
    
}

-(NSMutableDictionary*) calculateSolution
{
    // This is where our main solution scheme works
    NSMutableDictionary *solution = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    NSMutableArray *xOutputMatrix = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray *timeOutputVector = [[NSMutableArray alloc] initWithCapacity:10];
    
    
    float xdot, xCurr, xNext,TSIM;
    int neqn, timeStepIndex;
    
    // Step 1: Get the initial conditions, To, Tf, Ts, Number of steps
    
    int numberOfSteps = (_tStop - _tStart)/_tStep;
    
    // Step 2: Preset some things for simulation
    
    xCurr = initialConditionsVector;
    neqn = Count(xCurr);
    xOutputMatrix(1:neqn,1) = xCurr;
    t0 = _tStart;
    
    
    //timeOutputVector (_tStart:_tStop,_tStep) = TSIM;
    
    // Step 3: Actual part of the code
    for timeStepIndex = 1:numberOfSteps
        
        t = TSIM(timeStepIndex)
        
        BalanceEquations(float xdot, float t, float xCurr, float DF, float stoichiometricMatrix, float kV);
    
    BalanceEquationsCall1 = xdot;
    
    timeSecondEval = t0 + (_tStep);
    xModified = xCurr+_tStep*xdot;
    
    BalanceEquations(float timeSecondEval, float xModified, float DF, float stoichiometricMatrix)
    
    BalanceEquationsCall2 = xdot;
    
    xNext = xCurr + 0.5*(BalanceEquationsCall1+BalanceEquationsCall2*_tStep)
    
    
    x0 = x0 + BalanceEquationsCall2;
    
    t0 = t0 + _tStep;
    
    
    
    // Append solution to the xCompile
    xOutputMatrix(1:neqn,timeStepIndex+1) = xCurr;
    
    end
    
    // Logic to construct dataFile -
    [solution setObject:xOutputMatrix forKey:@"xMatrix"];
    [solution setObject:timeOutputVector forKey:@"timeVector"];
    
    // Now take care of memory management
    
    // Return to caller -
    [release pool];
    
    return [solution autorelease];
    
    
}
@end

