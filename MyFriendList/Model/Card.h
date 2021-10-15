//
//  Card.h
//  MyFriendList
//
//  Created by simo on 15/09/2021.
//

#ifndef Card_h
#define Card_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Card : NSObject

- (instancetype)initWithCompanyName:(NSString *)companyName
                        personalCode:(NSString *)personalCode
                          Logo:(UIImage *)Logo
                     background:(UIColor *)background
                     position:(NSString *)position;

@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *personalCode;
@property (nonatomic, strong) NSString *position;
@property (nonatomic) UIImage *logo;
@property (nonatomic) UIColor *background;

@property (nonatomic, readonly) NSString *displayName;
@property (nonatomic, readonly) NSString *displayPosition;
@property (nonatomic, readonly) NSString *displayCode;
@property (nonatomic, readonly) UIColor *getBackground;
@property (nonatomic, readonly) UIImage *getLogo;


@end

#endif /* Card_h */
