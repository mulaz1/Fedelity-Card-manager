//
//  AddNewCardController.m
//  MyFriendList
//
//  Created by simo on 14/09/2021.
//

#import "AddNewCardController.h"
#import "Model/DBConnection.h"
#import "Model/Database.h"
#import "CardList.h"

@interface AddNewCardController ()

@property (weak,nonatomic) IBOutlet UIImageView *selectColor;
@property (weak,nonatomic) IBOutlet UITextField *companyName;
@property (weak,nonatomic) IBOutlet UITextField *code;
@property (weak,nonatomic) IBOutlet UIImageView *logoImage;
@property (weak,nonatomic) IBOutlet UITextField *position;

//image code to save on database
@property(nonatomic) NSInteger codeImage;
@property(nonatomic,strong) UIImage *logo;
@property(nonatomic,strong) NSString *companyNameString;
@property(nonatomic,strong) NSString *userCodeString;

@end

@implementation AddNewCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)TealButtonPressed:(id)sender{
    self.selectColor.backgroundColor = UIColor.systemTealColor;
    self.codeImage = 1;
}

- (IBAction)RedButtonPressed:(id)sender{
    self.selectColor.backgroundColor = UIColor.redColor;
    self.codeImage = 2;
}

- (IBAction)OrangeButtonPressed:(id)sender{
    self.selectColor.backgroundColor = UIColor.orangeColor;
    self.codeImage = 3;
}

- (IBAction)GreenButtonPressed:(id)sender{
    self.selectColor.backgroundColor = UIColor.systemGreenColor;
    self.codeImage = 4;
}

- (IBAction)imageSelectButtonPressed:(id<UINavigationControllerDelegate,
                                      UIImagePickerControllerDelegate>)sender{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    // output image
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.logoImage.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction) addCardToList:(id)sender{
    [CardList add:[[Card alloc] initWithCompanyName:@"COOP" personalCode:@"12344567654" ImageCode:1 backgroundCode: 1 position: @"Via dal mio prato 60B"]];
    NSLog(@"Elemento aggiunto");
}

@end
