//
//  IOSFirstViewController.m
//  IOS7Experiments
//
//  Created by Peter Bødskov on 17/01/14.
//  Copyright (c) 2014 Peter Bødskov. All rights reserved.
//

#import "IOSFirstViewController.h"
#import "IOSSecondViewController.h"

@interface IOSFirstViewController ()
@property (nonatomic, assign) BOOL shouldBeHidingStatusBar;
@end

@implementation IOSFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"First View Controller";
        self.shouldBeHidingStatusBar = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)statusbarButtonTapped:(id)sender {
    self.shouldBeHidingStatusBar = ! self.shouldBeHidingStatusBar;
    [UIView animateWithDuration:0.5 animations:^{
        [self setNeedsStatusBarAppearanceUpdate];
    }];
}

- (IBAction)toPageTwoTapped:(id)sender {
    IOSSecondViewController *secondViewController = [[IOSSecondViewController alloc]init];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (BOOL)prefersStatusBarHidden {
    return self.shouldBeHidingStatusBar;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationSlide;
}
@end
