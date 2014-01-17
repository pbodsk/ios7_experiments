//
//  IOSSecondViewController.m
//  IOS7Experiments
//
//  Created by Peter Bødskov on 17/01/14.
//  Copyright (c) 2014 Peter Bødskov. All rights reserved.
//

#import "IOSSecondViewController.h"

@interface IOSSecondViewController ()

@end

@implementation IOSSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Second View Controller";
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

@end
