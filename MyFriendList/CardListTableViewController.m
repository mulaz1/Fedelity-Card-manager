#import "CardListTableViewController.h"
#import "CardList.h"
#import "Card.h"
#import "CardTableDetailTableViewController.h"
#import "Model/DBConnection.h"
#import "Model/Database.h"
#import <CoreLocation/CoreLocation.h>

@interface CardListTableViewController ()<CLLocationManagerDelegate>

    @property (nonatomic, strong) CardList *cards;
    @property (nonatomic,strong) CLLocationManager *locationManager;
    @property (nonatomic, strong) NSString *Address;

@end

@implementation CardListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.title = @"Le mie carte";
    
    self.cards = [[CardList alloc] init];
    
    //Configuro il location menager, setto il delegate e faccio partire l'updating della posizione
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;  //non la migliore geolocalizzazione perche' non interessa la precisione in questo caso
     self.locationManager.distanceFilter = 100;
     self.locationManager.delegate = self;
     [self.locationManager startUpdatingLocation];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
        
    [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(receiveTestNotification:)
            name:@"NewCardData"
            object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(receiveTestNotification:)
            name:@"DeleteCard"
            object: nil];
    
   // [self.cards add:[[Card alloc] initWithCompanyName: @"ciao" personalCode: @"lol" Logo: nil background: UIColor.blueColor  position: @"ciao"]];
}

-(void)viewWillAppear:(BOOL)animated
{
 [super viewWillAppear:animated];
 NSLog(@"view will Appear");
 [self.tableView reloadData];
 //NSLog([NSString stringWithFormat:@"%d",self.cards.size]);

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cards.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    Card *c = [self.cards getAtIndex:indexPath.row];
    cell.textLabel.text = c.displayName;
    cell.detailTextLabel.text = c.displayPosition;
    
    cell.backgroundColor = c.getBackground;
    cell.textLabel.textColor  = UIColor.whiteColor;
    cell.detailTextLabel.textColor = UIColor.whiteColor;
    cell.imageView.image = c.getLogo;
   
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowCardDetail"]){
        if([segue.destinationViewController isKindOfClass:[CardTableDetailTableViewController class]]){
            CardTableDetailTableViewController *vc = (CardTableDetailTableViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Card *f = [self.cards getAtIndex:indexPath.row];
            vc.theCard = f;
        }
   }
}

- (CLLocationManager *)locationManager{
    if(!_locationManager) _locationManager = [[CLLocationManager alloc] init];
    return _locationManager;
   }

- (void) receiveTestNotification:(NSNotification *) notification {

    NSDictionary *cardInfo = notification.userInfo;
    
    NSLog(@"%@",cardInfo);
    if ([[notification name] isEqualToString:@"NewCardData"]){
        Card *card = [cardInfo objectForKey:@"NewCard"];
        [self.cards add:card];
    }
    
    else if ([[notification name] isEqualToString:@"DeleteCard"]){
        Card *card = [cardInfo objectForKey:@"DeleteCard"];
        [self.cards removeCard:card];
    }
    
}

@end
