//
//  CardList.h
//  MyFriendList
//
//  Created by simo on 15/09/2021.
//

#ifndef CardList_h
#define CardList_h

#import "Card.h"

@interface CardList : NSObject

+ (long)size;
+ (NSArray *)getAll;
+ (void)add:(Card *)f;
+ (Card *)getAtIndex:(NSInteger)index;
+ (void) initList;
@end

#endif /* CardList_h */
