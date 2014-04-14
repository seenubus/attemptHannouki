//
//  DataFile.h
//  MyHannouki
//
//  Created by labuser on 4/14/14.
//  Copyright (c) 2014 varnerlabs. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface DataFile : NSObject {
@private
    NSMutableArray *_rateConstantVector;
    NSMutableArray *_initialConditionsVector;
    NSMutableArray *_stoichiometricMatrix;
    NSMutableArray *_measurementIndexVector;
    NSInteger _numRateConstants;
    NSInteger _numSpecies;
}

// Properties -
@property (retain) NSMutableArray *rateConstantVector;
@property (retain) NSMutableArray *initialConditionsVector;
@property (retain) NSMutableArray *stoichiometricMatrix;
@property (retain) NSMutableArray *measurementIndexVector;
@property (assign) NSInteger numRateConstants;
@property (assign) NSInteger numSpecies;

// Methods -
- (NSMutableDictionary *)constructDataStructure;

@end

