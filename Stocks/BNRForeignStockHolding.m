//
//  BNRForeignStockHolding.m
//  Stocks
//
//  Created by YASSER ALTAMIMI on 29/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding

// override to convert to dollars
- (float)costInDolar
{
    float costInLocalCurrency = [super costInDolar];
    return costInLocalCurrency * 3.75;
}

// override to convert to dollar
- (float)valueInDollars
{
    float valueInLocalCurrency = [super valueInDollars];
    return valueInLocalCurrency * 3.75;
}

@end
