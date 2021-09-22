//
//  AddNewCardController.h
//  MyFriendList
//
//  Created by simo on 14/09/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface  AddNewCardController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

- (IBAction)TealButtonPressed:(id)sender;
- (IBAction)RedButtonPressed:(id)sender;
- (IBAction)OrangeButtonPressed:(id)sender;
- (IBAction)GreenButtonPressed:(id)sender;
- (IBAction) addCardToList:(id)sender;

@end

NS_ASSUME_NONNULL_END
