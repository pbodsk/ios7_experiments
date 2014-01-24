//
//  IOSFirstViewController.m
//  IOS7Experiments
//
//  Created by Peter Bødskov on 17/01/14.
//  Copyright (c) 2014 Peter Bødskov. All rights reserved.
//

#import "IOSFirstViewController.h"
#import "IOSSecondViewController.h"
#import <QuartzCore/QuartzCore.h>

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
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(doSomething)];

    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(doSomething)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)doSomething {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)getSnapShot
{
    UIView *screenDump = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
    UIView *cutedScreenDump = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    [cutedScreenDump addSubview:screenDump];
    
    UIView *toaster = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    toaster.backgroundColor = [UIColor orangeColor];
    [cutedScreenDump addSubview:toaster];
    
    cutedScreenDump.clipsToBounds = YES;
    
    return cutedScreenDump;
}

- (IBAction)statusbarButtonTapped:(id)sender {
    self.shouldBeHidingStatusBar = ! self.shouldBeHidingStatusBar;
    [UIView animateWithDuration:0.5 animations:^{
        [self setNeedsStatusBarAppearanceUpdate];
    }];
    
    
    if (self.shouldBeHidingStatusBar) {
        
        [[[[UIApplication sharedApplication] delegate]window] addSubview:[self getSnapShot]];
        
        self.navigationController.navigationBar.translucent = YES;
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 64.0, self.view.frame.size.width, self.view.frame.size.height);
        
    } else {
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 64.0, self.view.frame.size.width, self.view.frame.size.height);
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
        self.navigationController.navigationBar.translucent = NO;
        
        [self performSelector:@selector(removeImage) withObject:nil afterDelay:0.07];
    }
}


- (void) removeImage {
    
    [[[[[[UIApplication sharedApplication] delegate]window] subviews] lastObject] removeFromSuperview];
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
