//
//  main.m
//  Stocks
//
//  Created by YASSER ALTAMIMI on 28/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        
        // init three instance of BNRStockHolding and assign to them there costs
        BNRStockHolding *firstBuy = [[BNRStockHolding alloc]init];
        [firstBuy setName:@"GM's"];
        [firstBuy setPurchesedSharePrice:32.55];
        [firstBuy setCurrentSharePrice:64.03];
        [firstBuy setNumberOfShares:22];
        [firstBuy setSymbol:@"GM"];

        BNRStockHolding *secondBuy = [[BNRStockHolding alloc]init];
        [secondBuy setName:@"Tesla"];
        [secondBuy setPurchesedSharePrice:43.15];
        [secondBuy setCurrentSharePrice:22.04];
        [secondBuy setNumberOfShares:55];
        [secondBuy setSymbol:@"TE"];

        BNRStockHolding *thirdBuy = [[BNRStockHolding alloc]init];
        [thirdBuy setName:@"Enbridfe"];
        [thirdBuy setPurchesedSharePrice:22.06];
        [thirdBuy setCurrentSharePrice:44.38];
        [thirdBuy setNumberOfShares:100];
        [thirdBuy setSymbol:@"EN"];

        // init three instance of BNRForginStockHolding and assign to them there costs
        BNRForeignStockHolding *firstForignBuy = [[BNRForeignStockHolding alloc]init];
        [firstForignBuy setName:@"Al-Rajhi"];
        [firstForignBuy setPurchesedSharePrice:72];
        [firstForignBuy setCurrentSharePrice:102];
        [firstForignBuy setNumberOfShares:40];
        [firstForignBuy setSymbol:@"RAJ"];

        BNRForeignStockHolding *secondForignBuy = [[BNRForeignStockHolding alloc]init];
        [secondForignBuy setName:@"Al-Tawoniah"];
        [secondForignBuy setPurchesedSharePrice:30];
        [secondForignBuy setCurrentSharePrice:22];
        [secondForignBuy setNumberOfShares:200];
        [secondForignBuy setSymbol:@"TAW"];

        BNRForeignStockHolding *thirdForignBuy = [[BNRForeignStockHolding alloc]init];
        [thirdForignBuy setName:@"Al-Ahsaa"];
        [thirdForignBuy setPurchesedSharePrice:30];
        [thirdForignBuy setCurrentSharePrice:42];
        [thirdForignBuy setNumberOfShares:200];
        [thirdForignBuy setSymbol:@"AHS"];
        
        // fill an array of these objects
        NSArray *listOfBuys = @[firstBuy, secondBuy, thirdBuy, firstForignBuy, secondForignBuy, thirdForignBuy];

        // create a NSMutableArray instance to keep track of the amounts of difference for each stock to calculate total difference
        NSMutableArray *listOfDifferenc = [[NSMutableArray alloc]init];

        // iterate through the array printing out the value of each
        for (BNRStockHolding *buy in listOfBuys) {

            // store the values of each buy
            float cost = [buy costInDolar];
            float value = [buy valueInDollars];
            float difference = [buy difference];
            NSString *name = [buy name];

            // print the cost in dollars
            NSLog(@"the cost of %@ stock at the time of buying is %.3f$",name,cost);

            // print the value in dolars
            NSLog(@"the value of %@ stock right now is %.3f$",name,value);

            // get the difference
            NSLog(@"the difference is %.3f$",difference);

            // cast the difference to NSNumber so we can add it to the array
            NSNumber *nsDifference = [[NSNumber alloc]initWithFloat:difference];

            // add the difference to the array to be calculated outside the loop
            [listOfDifferenc addObject:nsDifference];

        }

        // float to calculate all the differences
        float finalDifrrence = 0;

        // loop through the difference array
        for (NSNumber *number in listOfDifferenc) {

            // cast them  back to float so we can make math to them
            float fNumber = [number floatValue];

            // add them to get the final result of difference
            finalDifrrence += fNumber;
        }

        NSLog(@"the total difference is %.3f", finalDifrrence);
        
        // second challenge
        // create an array to add profolios to it
        NSMutableArray *portfolios = [[NSMutableArray alloc] init];
        
        // create 3 portfolio
        for (int i = 0; i < 6; i++) {
            
            // create one proflio
            BNRPortfolio *portfolio = [[BNRPortfolio alloc]init];
            
            // get a random number same as listOfBuys count
            NSUInteger randomnumber = random() % [listOfBuys count];
            
            // add random stock to this portfolio
            [portfolio addStock:[listOfBuys objectAtIndex:randomnumber]];
            
            
            // add the porfilio to porfilios list
            [portfolios addObject:portfolio];
        }
        
        // iterate through porfolios and log each one description
        for (BNRPortfolio *portfolio in portfolios) {
            NSLog(@"%@", portfolio);
        }
        
        [portfolios[1] addStock:firstBuy];
        [portfolios[1] addStock:secondBuy];
        [portfolios[1] addStock:thirdBuy];
        [portfolios[1] addStock:firstForignBuy];
        [portfolios[1] addStock:secondForignBuy];
        [portfolios[1] addStock:thirdForignBuy];
        
        // test logs
        NSLog(@"all the stucks in potfolio 1 are: %@", [portfolios[1]stockHoldings]);
        NSLog(@"Top three stucks in potfolio 1 are: %@", [portfolios[1]topThreeHoldings]);
        NSLog(@"all the stucks in potfolio 1 sorted are: %@", [portfolios[1] allStocksSorted]);

        
    }
    return 0;
}
