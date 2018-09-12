//
//  BNRStockHolding.m
//  Stocks
//
//  Created by YASSER ALTAMIMI on 28/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

// setter and getter:


- (float)costInDolar
{
    //get the instance variables through accessors and return the cost in dollar
    float purchesedSharePrice = [self purchesedSharePrice];
    float numberOfShares = [self numberOfShares];
    return purchesedSharePrice * numberOfShares;
}

- (float)valueInDollars
{
    //get the instance variables through accessors and return the value in dollar
    float currentSharePrice = [self currentSharePrice];
    float numberOfShares = [self numberOfShares];
    return currentSharePrice * numberOfShares;
}

- (float)difference {
    float price = [self costInDolar];
    float value = [self valueInDollars];
    
    return value - price;
}

- (NSString *)description
{
    // get the symbol and value
    NSString *symbol = [self symbol];
    float value = [self valueInDollars];
    
    return [NSString stringWithFormat:@"Stouck: %@  Value: %.2f", symbol, value];
}



@end
