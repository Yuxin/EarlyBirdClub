//
//  CurrentPlanCell.h
//  eralyBirdClub
//
//  Created by YUXIN YANG on 12-6-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentPlanCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *countDownLabel;
@property (strong, nonatomic) NSDate *targetDate;
@end
