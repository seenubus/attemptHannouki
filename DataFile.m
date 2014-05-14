//
//  DataFile.m
//  hannouki
//
//  Created by Guest User on 5/14/14.
//  Copyright (c) 2014 Guest User. All rights reserved.
//

#import "DataFile.h"

//@implementation DataFile
@interface DataFile ()

-(void)setup;

@end

@implementation DataFile

@synthesize rateConstantVector = _rateConstantVector;
@synthesize initialConditionsVector = _initialConditionsVector;
@synthesize stoichiometricMatrix = _stoichiometricMatrix;
@synthesize measurementIndexVector = _measurementIndexVector;
@synthesize parameterVector = _parameterVector;

@synthesize numRateConstants = _numRateConstants;
@synthesize numSpecies = _numSpecies;
@synthesize numParameters= _numParameters;
@synthesize numStates= _numStates;
@synthesize volumetricFlowRateIn= _volumetricFlowRateIn;

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
    
    //self.numRateConstants = nil;
    //self.numSpecies = nil;
    
    //[super dealloc];
    
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
    [dataFile setObject:[self parameterVector] forKey:@"ParameterVector"];
    
    // Return to caller -
    return [dataFile]; //[dataFile autorelease];
    
}

@end

