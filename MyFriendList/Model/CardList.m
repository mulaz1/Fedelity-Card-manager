//
//  CardList.m
//  MyFriendList
//
//  Created by simo on 15/09/2021.
//

#import <Foundation/Foundation.h>
#import "CardList.h"
@interface CardList ()
    @property (nonatomic, strong) NSMutableArray *list;
@end

@implementation CardList

- (instancetype)init{
    if(self = [super init]){
       _list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (long)size{
    return self.list.count;
}

- (NSArray *)getAll{
    return self.list;
}

- (void)add:(Card *)c{
    [self.list addObject:c];
}

- (Card *)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

-(void)removeCard:(Card *)card{
    for (Card * cardTemp in self.list){

     if ([cardTemp.displayName isEqualToString: card.displayName])
         [self.list removeObject: cardTemp];
    }
}

@end
