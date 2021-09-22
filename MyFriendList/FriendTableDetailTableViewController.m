//
//  FriendTableDetailTableViewController.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "FriendTableDetailTableViewController.h"

@interface FriendTableDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak,nonatomic) IBOutlet UIImageView *QRresizeImage;

@end

@implementation FriendTableDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.theCard.displayName;
    self.firstnameLabel.text = self.theCard.companyName;
    self.lastnameLabel.text = self.theCard.personalCode;
    
    self.QRresizeImage.image = [UIImage imageWithCIImage: [self generateBarcode:@"123456789"]];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch(section){
        case 0: return @"Fronte";
        case 1: return @"Retro";
        default: return nil;
    }
}

-(CIImage*)generateBarcode:(NSString*)dataString{

CIFilter *barCodeFilter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
NSData *barCodeData = [dataString dataUsingEncoding:NSASCIIStringEncoding];
[barCodeFilter setValue:barCodeData forKey:@"inputMessage"];
[barCodeFilter setValue:[NSNumber numberWithFloat:0] forKey:@"inputQuietSpace"];

CIImage *barCodeImage = barCodeFilter.outputImage;
return barCodeImage;
}

@end
