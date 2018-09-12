//
//  BNRPortfolio.h
//  Stocks
//
//  Created by YASSER ALTAMIMI on 01/01/1440 AH.
//  Copyright © 1440 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRStockHolding;

NS_ASSUME_NONNULL_BEGIN

@interface BNRPortfolio : NSObject


// propersies
@property (nonatomic, copy) NSArray *stockHoldings;
@property (nonatomic) NSString *ownerName;

// methods
-(float)totalValue;
-(void)addStock: (BNRStockHolding *) stock;
-(NSArray *)topThreeHoldings;
-(NSArray *)allStocksSorted;

@end

NS_ASSUME_NONNULL_END
