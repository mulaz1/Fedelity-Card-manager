//
//  Database.h
//  MyFriendList
//
//  Created by simo on 15/09/2021.
//

#ifndef Database_h
#define Database_h

#import <Foundation/Foundation.h>
#import "CardList.h"
#import "Card.h"

@interface Database : NSObject

@property (nonatomic, strong) NSMutableArray *list;

+(void)addNewCardIntoDatabase:(NSString *)name code:(NSString *)code ColorCode:(NSInteger)ColorCode ImageColor:(NSInteger)ImageColor position:(NSString *) Position;
+(CardList *)getAllCards;

@end
#endif /* Database_h */


