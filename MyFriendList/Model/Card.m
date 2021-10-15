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
                     Logo:(UIImage *)Logo
                     background:(UIColor *)background
                     position:(NSString *)position{
    if(self = [super init]){
        _companyName = [ companyName copy];
        _personalCode = [personalCode copy];
        _logo = [Logo copy];
        _background = background;
        _position = position;
    }
    return self;
}

- (NSString *)displayName{
    return [NSString stringWithFormat:@"%@", self.companyName];
}

- (NSString *)displayCode{
    return [NSString stringWithFormat:@"%@", self.personalCode];
}

- (NSString *)displayPosition{
    return [NSString stringWithFormat:@"%@", self.position];
}

-(UIColor *)getBackground{
    return self.background;
}

-(UIImage *)getLogo{
    return self.logo;
}
@end
