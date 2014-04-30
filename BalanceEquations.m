#import "MassBalance.h"

#define COLUMN 1234
#define ROW 1234

@implementation BalanceEquations

@synthesize rateConstant;

- (id)init {
    self = [super init];
    if (self) {
        
        // Code to initilize the object -
    }
    return self;
}

// trying to compute Kinetics to get qV like in the Matlab Code//


 - (NSMutableArray *) calculateKinetics
 {
 NSMutableArray *kinetic;
 
 [kinetic addObject:(self.species * self.rateConstant)];
 
 return kinetic; 
 
 }
 */



void evaluateBalanceEquations( register float dxdt[], register float x, register float StoichMat [], float kV[], float qV[])
{



    /* inclde call kinetics */
    
    int row, column;
    
    column = row = 0;
    while(row < ROW){
        while (column < COLUMN){
			xdot[row] += kinetic[column] * network[row][column]; 
            column++;
        }
        if (column == COLUMN)
            column = 0;
        row++;
    }
    
    
float ALPHA, XIN, SIN, PIN, YXS, YXP, BETA

ALPHA = kV[0];
XIN = kV[1];
SIN = kV[2];
PIN = kV[3];
YXS = kV[12];
YXP = kV[13];
BETA = kV[14];
/ Mass balances /
	dxdt[0] = (FIN/V)*(XIN - X) + (qV[0] - qV[1])*X;							          /cell mass
	dxdt[1] = (FIN/V)*(SIN - S) - (1/YXS)*(qV[2])*X + (BETA/YXS)*qV[1]*X;		/substrate
	dxdt[2] = (FIN/V)*(PIN - P) + (1/YXP)*qV[3]*X;								          /product
	dxdt[3] = FIN - ALPHA*FIN; 													                    /volume
	
}
	
	
@end
	
