//
//  Friend.h
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Friend : NSObject

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname
                            email:(NSString *)email
                            background:(NSString *)background;

- (instancetype)initWithFirstname:(NSString *)firstname
                         lastname:(NSString *)lastname;

@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *background;

@property (nonatomic, readonly) NSString *displayName;
@property (nonatomic, readonly) void *displayBackground;

@end

NS_ASSUME_NONNULL_END
