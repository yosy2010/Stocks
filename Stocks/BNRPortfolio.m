//
//  BNRPortfolio.m
//  Stocks
//
//  Created by YASSER ALTAMIMI on 01/01/1440 AH.
//  Copyright © 1440 YASSER ALTAMIMI. All rights reserved.
//

#import "BNRPortfolio.h"
#import "BNRStockHolding.h"

@interface BNRPortfolio ()
{
    NSMutableArray *_stockHoldings;
}

@end

@implementation BNRPortfolio

// setter and getter
// set the passed NSArray to the NSMutableArray _stockHoldings behind the sceincs
- (void)setStockHoldings:(NSArray *)stockHoldings
{
    _stockHoldings = [stockHoldings mutableCopy];
}

// return the NSMutableArray copied into NSArray
- (NSArray *)stockHoldings
{
    return [_stockHoldings copy];
}

// calculate the total value of all the stocks in the portfilio
- (float)totalValue
{
    float stocksValue = 0;
    
    // get the array through accesors
    NSMutableArray *stockHoldings = [[self stockHoldings] mutableCopy];
    
    for (BNRStockHolding *stock in stockHoldings) {
        stocksValue += [stock valueInDollars];
    }
    return stocksValue;
}

// add a stock to the portfilio
- (void)addStock:(id)stock
{
    if (!_stockHoldings) {
        _stockHoldings = [[NSMutableArray alloc] init];
    }
    [_stockHoldings addObject:stock];
}

- (NSArray *)topThreeHoldings
{
    // get all the holdings
    NSMutableArray *allHoldings = [[self stockHoldings] mutableCopy];
    
    // create sorter by value
    NSSortDescriptor *sorterByValue = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars" ascending:YES];
    
    // create a sorter by symbol
    NSSortDescriptor *sorterBySymbol = [NSSortDescriptor sortDescriptorWithKey:@"symbol" ascending:YES];
    
    // sort all holdings
    [allHoldings sortUsingDescriptors:@[sorterByValue, sorterBySymbol]];
    
    // sort the top three holdings
    NSArray *top3 = [allHoldings subarrayWithRange:NSMakeRange(0, 3)];
    
    return top3;
}

- (NSArray *)allStocksSorted
{
    //get the array
    NSMutableArray *allHoldings = [[self stockHoldings] mutableCopy];
    
    // create sorter
    NSSortDescriptor *sorterAlpha = [NSSortDescriptor sortDescriptorWithKey:@"symbol" ascending:YES];
    
    // sort it alphabitaclly
    [allHoldings sortUsingDescriptors:@[sorterAlpha]];
    
    // store it in an NSArray
    NSArray *sorted = [allHoldings copy];
    
    // return it
    return sorted;
}

// override the description method
- (NSString *)description
{
    // number of stocks
    NSUInteger numberOfStocks = [_stockHoldings count];
    
    // value of all the stocks
    float valueOfStocks = [self totalValue];
    
    return [NSString stringWithFormat:@"this portfolio has %lu stocks with total value of %f", numberOfStocks, valueOfStocks];
}

@end
