#import <Foundation/Foundation.h>

#define ROW 1234
#define COLUMN 1234

@protocol MassBalanceProtocol <NSObject>

/* calculatekinetic () */
void evaluateMassBalance(register float xdot[],register float state[],register float network[][COLUMN]);

@end

@interface MassBalance : NSObject <MassBalanceProtocol> {
@private
    NSMutableArray *rateConstant;
}

@property(retain) NSMutableArray *rateConstant;

@end
