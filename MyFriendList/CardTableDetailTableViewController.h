#import <UIKit/UIKit.h>

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardTableDetailTableViewController : UITableViewController

@property (nonatomic, strong) Card *theCard;

- (IBAction) removeCard:(id)sender;

@end

NS_ASSUME_NONNULL_END
