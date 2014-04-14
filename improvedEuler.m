//
//  improvedEuler.m
//  MyHannouki
//
//  Created by labuser on 4/14/14.
//  Copyright (c) 2014 varnerlabs. All rights reserved.
//

#import "improvedEuler.h"

@implementation improvedEuler
// @synthesize solution = _solution;

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
    // self.solution = nil;
    
}

-(NSMutableDictionary*) calculateSolution
{
    // This is where our main solution scheme works
    NSMutableDictionary *solution = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    NSMutableArray *xMatrix = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray *tVector = [[NSMutableArray alloc] initWithCapacity:10];
    
    // Now here we need to add the logic to set the X,T
    // Here we need to call the massbalance stuff (from the other team)
    
    // Logic to construct dataFile -
    [solution setObject:xMatrix forKey:@"xMatrix"];
    [solution setObject:tVector forKey:@"timeVector"];
    
    // Return to caller -
    return [solution autorelease];
    
    
}
@end
