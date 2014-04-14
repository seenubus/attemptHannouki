//
//  DataFile.m
//  MyHannouki
//
//  Created by labuser on 4/14/14.
//  Copyright (c) 2014 varnerlabs. All rights reserved.
//
//Needs More Work.. How to construct DataFile?? This is from Github

#import "DataFile.h"

@interface DataFile ()

-(void)setup;

@end

@implementation DataFile
@synthesize stoichiometricMatrix = _stoichiometricMatrix;
@synthesize rateConstantVector = _rateConstantVector;
//@synthesize numberOfParameters = _numberOfParameters = length(k))
//@synthesize numberOfStates = _numberOfStates = length(IC)
//@synthesize numberOfRates = _numberOfRates
//@synthesize parameterVector = _kV
//@synthesize volumetricFlowRateIn = _volumetricFlowRateIn
//@synthesize measurementSelectionVector = 1:numberOfStates (This can't be written like this in xCode?)
@synthesize initialConditionsVector = _initialConditionsVector;
@synthesize measurementIndexVector = _measurementIndexVector;
@synthesize numRateConstants = _numRateConstants;
@synthesize numSpecies = _numSpecies;

- (id)init {
    self = [super init];
    if (self) {
        
        // Code to initialize the object -
        [self setup];
        
    }
    return self;
}

- (void)setup
{
    //
}

- (void)dealloc {
    
    // Clean up my iVars -
    self.rateConstantVector = nil;
    self.initialConditionsVector = nil;
    self.stoichiometricMatrix = nil;
    self.measurementIndexVector = nil;
    self.numRateConstants = nil;
    self.numSpecies = nil;
    [super dealloc];
    
}

- (NSMutableDictionary *) constructDataStructure
{
    
    // Methods variables -
    NSMutableDictionary *dataFile = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    // Logic to construct dataFile -
    [dataFile setObject:[self rateConstantVector] forKey:@"RateConstantVector"];
    [dataFile setObject:[self initialConditionsVector] forKey:@"InitialConditionsVector"];
    [dataFile setObject:[self stoichiometricMatrix] forKey:@"StoichiometricMatrix"];
    [dataFile setObject:[self measurementIndexVector] forKey:@"MeasurementIndexVector"];
    
    // Return to caller -
    return [dataFile autorelease];
    
}

@end
