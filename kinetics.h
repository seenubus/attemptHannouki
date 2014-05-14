#import <Foundation/Foundation.h>

@interface kinetics : NSObject
@protocol MassBalanceProtocol <NSObject>

/* calculatekinetic () */
void evaluatekinetics(register float xdot[],register float state[],register float network[][COLUMN],);

@end

@interface MassBalance : NSObject <MassBalanceProtocol> {
@private
    NSMutableArray *rateConstant;
}

@property(retain) NSMutableArray *rateConstant;
@end
