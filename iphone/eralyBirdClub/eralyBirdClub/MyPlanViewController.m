//
//  MainViewController.m
//  eralyBirdClub
//
//  Created by YUXIN YANG on 12-6-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyPlanViewController.h"
#import "CreateCurrentPlanCell.h"
#import "CreateMyPlanViewController.h"
#import "CurrentPlanCell.h"

@interface MyPlanViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *planHistoryTableView;
@end

@implementation MyPlanViewController
@synthesize planHistoryTableView;
@synthesize historyItemArray = _historyItemArray;
@synthesize hasCurrentPlan = _hasCurrentPlan;

- (IBAction)createNewPlan:(id)sender {
    CreateMyPlanViewController *createPlanViewController = [[CreateMyPlanViewController alloc] initWithNibName:@"CreateMyPlanViewController" bundle:nil];
    [self.navigationController pushViewController:createPlanViewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"我的早安计划";
    
    [self.planHistoryTableView reloadData];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    _hasCurrentPlan = NO;
    // todo: demo 历史记录数据
    // @""
    // 1天前成功，2天前成功，3天前失败
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
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        // 如果当前有plan，那么就显示当前的Plan
        if (self.hasCurrentPlan) {
            CurrentPlanCell *currentPlanCell = [tableView dequeueReusableCellWithIdentifier:CurrentPlanIdentifier];
            if (currentPlanCell == nil) {
                currentPlanCell = [[[NSBundle mainBundle] loadNibNamed:@"CurrentPlanCell" owner:self options:nil] objectAtIndex:0];
                currentPlanCell.accessoryType = UITableViewCellAccessoryNone;
                NSDate *targetDate = [NSDate dateWithTimeIntervalSinceNow:10000.0f];
                // 开始时间默认就8小时之前吧
                currentPlanCell.targetDate = targetDate;
                cell = currentPlanCell;
            }
        } else{
            // 否则，创建currentPlan
            cell = (CreateCurrentPlanCell *)[tableView dequeueReusableCellWithIdentifier:CurrentPlanIdentifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"CreateCurrentPlanCell" owner:self options:nil] objectAtIndex:0];
                cell.accessoryType = UITableViewCellAccessoryNone;
                // todo: 判断当前是不是睡觉模式，如果是，那就更改模式，默认是创建新计划模式
            }
        }
        
    }
    return cell;
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
