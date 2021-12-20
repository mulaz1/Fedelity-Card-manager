#import "CardTableDetailTableViewController.h"
#import "CardList.h"
#import <CoreLocation/CoreLocation.h>


@interface CardTableDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *Code;
@property (weak,nonatomic) IBOutlet UIImageView *QRresizeImage;
@property (weak,nonatomic) IBOutlet UIImageView *Logo;

@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation CardTableDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.companyName.text = self.theCard.displayName;
    self.Code.text = self.theCard.displayCode;
    self.Logo.image = self.theCard.getLogo;
    self.QRresizeImage.image = [UIImage imageWithCIImage: [self generateBarcode: self.theCard.displayCode]];
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

-(IBAction) removeCard:(UIBarButtonItem* )sender{
//    [CardList removeCard:self.theCard];
//    [self.navigationController popViewControllerAnimated:YES];
}

@end
