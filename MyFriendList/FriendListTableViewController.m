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

@interface FriendListTableViewController ()

    @property (nonatomic, strong) CardList *cards;

@end

@implementation FriendListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.title = @"Le mie carte";
    
    [CardList initList];
        
    [CardList add:[[Card alloc] initWithCompanyName:@"CONAD" personalCode:@"12344567654" ImageCode:1 backgroundCode: 1 position: @"Via emilia 60B"]];
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
    // Configure the cell...
    cell.textLabel.text = f.displayName;
    cell.detailTextLabel.text = f.displayPosition;
    
    switch(f.getBackgroundCode){
        case 1:
            cell.backgroundColor = UIColor.systemTealColor;
            break;
        case 2:
            cell.backgroundColor = UIColor.systemRedColor;
            break;
        case 3:
            cell.backgroundColor = UIColor.systemOrangeColor;
            break;
        case 4:
            cell.backgroundColor = UIColor.systemGreenColor;
            break;
        default:
            cell.backgroundColor = UIColor.systemGrayColor;
    }

    cell.textLabel.textColor  = UIColor.whiteColor;
    cell.detailTextLabel.textColor = UIColor.whiteColor;
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowFriendDetail"]){
        if([segue.destinationViewController isKindOfClass:[FriendTableDetailTableViewController class]]){
            FriendTableDetailTableViewController *vc = (FriendTableDetailTableViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Card *f = [CardList getAtIndex:indexPath.row];
            vc.theCard = f;
        }
   }
}

@end
