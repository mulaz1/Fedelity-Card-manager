//
//  FriendTableDetailTableViewController.h
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import <UIKit/UIKit.h>

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendTableDetailTableViewController : UITableViewController

@property (nonatomic, strong) Card *theCard;

@end

NS_ASSUME_NONNULL_END
