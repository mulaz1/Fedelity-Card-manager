//
//  Card.h
//  MyFriendList
//
//  Created by simo on 15/09/2021.
//

#ifndef Card_h
#define Card_h

#import <Foundation/Foundation.h>

@interface Card : NSObject

- (instancetype)initWithCompanyName:(NSString *)companyName
                        personalCode:(NSString *)personalCode
                          ImageCode:(NSInteger)ImageCode
                     backgroundCode:(NSInteger)backgroundCode
                     position:(NSString *)position;

@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *personalCode;
@property (nonatomic, strong) NSString *position;
@property (nonatomic) NSInteger Imagecode;
@property (nonatomic) NSInteger backgroundCode;

@property (nonatomic, readonly) NSString *displayName;
@property (nonatomic, readonly) NSString *displayPosition;
@property (nonatomic, readonly) NSInteger getBackgroundCode;

@end

#endif /* Card_h */
