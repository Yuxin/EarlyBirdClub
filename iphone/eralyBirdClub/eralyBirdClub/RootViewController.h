//
//  ViewController.h
//  eralyBirdClub
//
//  Created by YUXIN YANG on 12-6-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPlanViewController.h"
#import "FriendsViewController.h"

@interface RootViewController : UITabBarController
@property (strong, nonatomic) IBOutlet MyPlanViewController *mainViewController;
@property (strong, nonatomic) IBOutlet FriendsViewController *friendsViewController;

@end
