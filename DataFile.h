//
//  DataFile.h
//  hannouki
//
//  Created by Guest User on 5/14/14.
//  Copyright (c) 2014 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataFile : NSObject{
@private
NSMutableArray *_rateConstantVector;
NSMutableArray *_initialConditionsVector;
NSMutableArray *_stoichiometricMatrix;
NSMutableArray *_measurementIndexVector;
NSMutableArray *_parameterVector;
    
NSInteger _numRateConstants;
NSInteger _numSpecies;
NSInteger _numParameters;
NSInteger _numStates;
NSInteger _volumetricFlowRateIn;
    
}

// Properties -
@property (retain) NSMutableArray *rateConstantVector;
@property (retain) NSMutableArray *initialConditionsVector;
@property (retain) NSMutableArray *stoichiometricMatrix;
@property (retain) NSMutableArray *measurementIndexVector;
@property (retain) NSMutableArray *parameterVector;
@property (assign) NSInteger numRateConstants;
@property (assign) NSInteger numSpecies;
@property (assign) NSInteger numParameters;
@property (assign) NSInteger numStates;
@property (assign) NSInteger volumetricFlowRateIn;

// Methods -
- (NSMutableDictionary *)constructDataStructure;

@end
