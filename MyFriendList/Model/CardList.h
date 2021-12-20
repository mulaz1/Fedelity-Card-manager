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

- (long)size;
- (NSArray *)getAll;
- (void)add:(Card *)c;
- (Card *)getAtIndex:(NSInteger)index;
- (void) removeCard:(Card *)card;
@end

#endif /* CardList_h */
