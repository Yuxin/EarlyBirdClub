//
//  CreateMyPlanViewController.m
//  eralyBirdClub
//
//  Created by YUXIN YANG on 12-6-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CreateMyPlanViewController.h"
#import "ChooseFriendsCell.h"

@interface CreateMyPlanViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *createButton;
@end

@implementation CreateMyPlanViewController
@synthesize createButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"创建早起计划！";
    self.navigationItem.rightBarButtonItem = self.createButton;
    [self.createButton setEnabled:NO];
}

- (void)viewDidUnload
{
    [self setCreateButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
       //选择朋友一行，高度特殊
        return 100.0f;
    }
    return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // todo:
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ChooseDateCellIdentifier = @"ChooseDateCell";
    static NSString *ChooseTimeCellIdentifier = @"ChooseTimeCell";
    static NSString *ChooseBetCellIdentifier = @"ChooseBetCell";
    static NSString *ChooseFriendsCellIdentifier = @"ChooseFriendsCell";
    
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        // 日期选择
        cell = [tableView dequeueReusableCellWithIdentifier:ChooseDateCellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ChooseDateCellIdentifier];
            cell.textLabel.text = @"日期";
            cell.detailTextLabel.text = @"2012-6-12 星期二";
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    } else if (indexPath.row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:ChooseTimeCellIdentifier];
        if (cell == nil) {
            // 时间选择
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ChooseTimeCellIdentifier];
            cell.textLabel.text = @"时间";
            cell.detailTextLabel.text = @"6:30";
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        }
    } else if (indexPath.row == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:ChooseBetCellIdentifier];
        if (cell == nil) {
            // 时间选择
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ChooseBetCellIdentifier];
            cell.textLabel.text = @"下注";
            // 要成为高帅富白富美，还就得下血本，玩儿真的啊！
            cell.detailTextLabel.text = @"10个金币";
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        }
    } else if (indexPath.row == 3){
        cell = [tableView dequeueReusableCellWithIdentifier:ChooseFriendsCellIdentifier];
        if (cell == nil) {
            // 时间选择
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ChooseFriendsCell" owner:self options:nil] objectAtIndex:0];
        }
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        // 修改时间
        NSLog(@"Edit TIME");
    }
}


@end
