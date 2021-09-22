//
//  Friend.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "Friend.h"

@implementation Friend

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email
                         background:(NSString *)background{
    if(self = [super init]){
        _firstname = [firstname copy];
        _lastname = [lastname copy];
        _email = [email copy];
        _background = [background copy];
    }
    return self;
}

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname{
    return [self initWithFirstname:firstname
                          lastname:lastname
                             email:@""
                          background:@""];
}

- (NSString *)displayName{
    return [NSString stringWithFormat:@"%@ %@", self.firstname, self.lastname];
}

- (NSString *)memberOfDisplayBackground{
    return [NSString stringWithFormat:@"%@",self.background];
}

@end
