//
//  MainViewController.m
//  eralyBirdClub
//
//  Created by YUXIN YANG on 12-6-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyPlanViewController.h"
#import "MyCurrentPlanCell.h"
#import "CreateMyPlanViewController.h"

@interface MyPlanViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *planHistoryTableView;
@end

@implementation MyPlanViewController
@synthesize planHistoryTableView;

- (IBAction)createNewPlan:(id)sender {
    CreateMyPlanViewController *createPlanViewController = [[CreateMyPlanViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:createPlanViewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"我的早起计划";
    
    [self.planHistoryTableView reloadData];
}

- (void)viewDidUnload
{
    [self setPlanHistoryTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -- UITableViewDataResource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 88.0f;
    } else {
        return 44.0f;
    }
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Dequeue or if necessary create a RecipeTableViewCell, then set its recipe to the recipe for the current row.
    static NSString *CurrentPlanIdentifier = @"CurrentPlanIdentifier";
    static NSString *HistoryItemIdentifier = @"HistoryItemIdentifier";
    
    MyCurrentPlanCell *currentPlanCell = (MyCurrentPlanCell *)[tableView dequeueReusableCellWithIdentifier:CurrentPlanIdentifier];
    if (currentPlanCell == nil) {
        currentPlanCell = [[[NSBundle mainBundle] loadNibNamed:@"MyCurrentPlanCell" owner:self options:nil] objectAtIndex:0];
        currentPlanCell.accessoryType = UITableViewCellAccessoryNone;
    }    
    return currentPlanCell;
}

#pragma mark - UITableViewController Delegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return nil;
    } else {
        return indexPath;
    }
}

@end
