//
//  BalanceEqns.h
//  hannouki
//
//  Created by Guest User on 5/15/14.
//  Copyright (c) 2014 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BalanceEqnsProtocol <NSObject>

void EvaluateBalanceEqns ( register float dxdt[], register float initialConditionsVector [], register float parameterVector[]);
@end

@interface BalanceEqns : NSObject<BalanceEqnsProtocol> {
    
    @private
    NSMutableArray * dxdt;

    @protected
        double _tStart;
        double _tStop;
        double _tStep;
        double _numRates;
        float ** rateConstantVector;
        float ** initialConditionsVector;
        float ** parameterVector;
        NSMutableDictionary * _dataFile;
    
}

-(void) print;
@property (assign) double tStart;
@property (assign) double tStop;
@property (assign) double tStep;
@property (assign) double numRates;
@property (retain) NSMutableDictionary *dataFile;
-(void) obtainDataFileValues;
@property (retain) NSMutableArray *dxdt;

@end
