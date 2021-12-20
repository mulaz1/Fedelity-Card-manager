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
@property(nonatomic) UIColor *background;
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
}

- (IBAction)RedButtonPressed:(id)sender{
    self.selectColor.backgroundColor = UIColor.redColor;
}

- (IBAction)OrangeButtonPressed:(id)sender{
    self.selectColor.backgroundColor = UIColor.orangeColor;
}

- (IBAction)GreenButtonPressed:(id)sender{
    self.selectColor.backgroundColor = UIColor.systemGreenColor;
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
    self.logo = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction) addCardToList:(id)sender{
    
    id card = [[Card alloc] initWithCompanyName: self.companyName.text personalCode: self.code.text Logo: self.logo  background: self.selectColor.backgroundColor position: self.position.text];
    NSLog(@"Elemento aggiunto");
    
    //notifica al controller CardListTableViewController
    NSDictionary *cardInfo = [NSDictionary dictionaryWithObject:card forKey:@"NewCard"];
    [[NSNotificationCenter defaultCenter] postNotificationName: @"NewCardData" object:nil userInfo:cardInfo ];
    
}

@end
