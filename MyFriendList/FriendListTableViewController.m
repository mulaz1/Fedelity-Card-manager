//
//  FriendListTableViewController.m
//  MyFriendList
//
//  Created by Simone Cirani on 23/04/21.
//

#import "FriendListTableViewController.h"
#import "CardList.h"
#import "Card.h"
#import "FriendTableDetailTableViewController.h"
#import "Model/DBConnection.h"
#import "Model/Database.h"
#import <CoreLocation/CoreLocation.h>

@interface FriendListTableViewController ()<CLLocationManagerDelegate>

    @property (nonatomic, strong) CardList *cards;
    @property (nonatomic,strong) CLLocationManager *locationManager;
    @property (nonatomic, strong) NSString *Address;

@end

@implementation FriendListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.title = @"Le mie carte";
    
    [CardList initList];
    
    //Configuro il location menager, setto il delegate e faccio partire l'updating della posizione
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;  //non la migliore geolocalizzazione perche' non interessa la precisione in questo caso
     self.locationManager.distanceFilter = 100;
     self.locationManager.delegate = self;
     [self.locationManager startUpdatingLocation];
    
    //creo una carda temporanea di prova alla inizializzazione
    [CardList add:[[Card alloc] initWithCompanyName:@"Prova" personalCode:@"12344567654" Logo: nil background: UIColor.grayColor position: @"Via emilia 60B"]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 NSLog(@"view will Appear");
 [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CardList size];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    Card *f = [CardList getAtIndex:indexPath.row];
    cell.textLabel.text = f.displayName;
    cell.detailTextLabel.text = f.displayPosition;
    
    cell.backgroundColor = f.getBackground;
    cell.textLabel.textColor  = UIColor.whiteColor;
    cell.detailTextLabel.textColor = UIColor.whiteColor;
    cell.imageView.image = f.getLogo;
   
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowCardDetail"]){
        if([segue.destinationViewController isKindOfClass:[FriendTableDetailTableViewController class]]){
            FriendTableDetailTableViewController *vc = (FriendTableDetailTableViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Card *f = [CardList getAtIndex:indexPath.row];
            vc.theCard = f;
        }
   }
}

- (CLLocationManager *)locationManager{
    if(!_locationManager) _locationManager = [[CLLocationManager alloc] init];
    return _locationManager;
   }


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *currentLocation = [locations lastObject];
    //scorro la lista delle carte
    NSInteger count;
    while(count < self.cards.size){
        
    }
    
    //converto la posizione in coordinate
    CLGeocoder *geocoding = [[CLGeocoder alloc] init];
    [geocoding geocodeAddressString:.displayPosition completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%lu", (unsigned long)[placemarks count]);
            for(CLPlacemark *myStr in placemarks) {
                NSLog(@"%@", myStr);
        }
    }
    }];
}

@end
