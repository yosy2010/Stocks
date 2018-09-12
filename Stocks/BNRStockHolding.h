//
//  BNRStockHolding.h
//  Stocks
//
//  Created by YASSER ALTAMIMI on 28/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRStockHolding : NSObject



// properties
@property (nonatomic) float purchesedSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) float numberOfShares;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSString *symbol;

// methods
-(float)costInDolar;
-(float)valueInDollars;
-(float)difference;


@end

NS_ASSUME_NONNULL_END
