//
//  CurrentPlanCell.m
//  eralyBirdClub
//
//  Created by YUXIN YANG on 12-6-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CurrentPlanCell.h"

@interface CurrentPlanCell()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation CurrentPlanCell
@synthesize countDownLabel = _countDownLabel;
@synthesize targetDate = _targetDate;
@synthesize timer = _timer;

/*
 *在text视图中显示时间
 */
- (void)showTime:(double)time
{
	int inputSeconds = (int)time;
	int hours =  inputSeconds / 3600;
	int minutes = ( inputSeconds - hours * 3600 ) / 60; 
	int seconds = inputSeconds - hours * 3600 - minutes * 60; 
	NSString *strTime = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", hours, minutes, seconds];
	self.countDownLabel.text = strTime;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    if (newWindow != nil) {
        double deltaTime = [[NSDate date] timeIntervalSinceDate:self.targetDate];
        NSLog(@"%f", deltaTime);
        double remainTime = [self.targetDate timeIntervalSinceNow] - deltaTime;        
        if (remainTime < 0.0f) {
            // todo: over...
        }
        [self showTime:remainTime];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
