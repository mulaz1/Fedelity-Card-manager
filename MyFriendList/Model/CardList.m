//
//  CardList.m
//  MyFriendList
//
//  Created by simo on 15/09/2021.
//

#import <Foundation/Foundation.h>
#import "CardList.h"

static NSMutableArray *list;

@implementation CardList

- (instancetype)init{
    if(self = [super init]){
        list = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (long)size{
    return list.count;
}

+ (NSArray *)getAll{
    return list;
}

+ (void)add:(Card *)f{
    [list addObject:f];
}

+ (Card *)getAtIndex:(NSInteger)index{
    return [list objectAtIndex:index];
}

+ (void)initList{
    list = [[NSMutableArray alloc] init];
}



@end
