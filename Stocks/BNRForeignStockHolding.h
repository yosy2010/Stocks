//
//  BNRForeignStockHolding.h
//  Stocks
//
//  Created by YASSER ALTAMIMI on 29/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRStockHolding.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRForeignStockHolding : BNRStockHolding

@property (nonatomic) float conversionRate;

@end

NS_ASSUME_NONNULL_END
