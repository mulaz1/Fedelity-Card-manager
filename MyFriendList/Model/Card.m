//
//  Card.m
//  MyFriendList
//
//  Created by simo on 15/09/2021.
//

#import "Card.h"

@implementation Card

- (instancetype)initWithCompanyName:(NSString *)companyName
                       personalCode:(NSString *)personalCode
                          ImageCode:(NSInteger)ImageCode
                     backgroundCode:(NSInteger)backgroundCode
                     position:(NSString *)position{
    if(self = [super init]){
        _companyName = [ companyName copy];
        _personalCode = [personalCode copy];
        _Imagecode = ImageCode;
        _backgroundCode = backgroundCode;
        _position = position;
    }
    return self;
}

- (NSString *)displayName{
    return [NSString stringWithFormat:@"%@", self.companyName];
}

- (NSString *)displayPosition{
    return [NSString stringWithFormat:@"%@", self.position];
}

-(NSInteger)getBackgroundCode{
    return self.backgroundCode;
}

@end
