//
//  DetailViewController.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "DetailViewController.h"
#import "CommonUI.h"
#import "Common.h"

@interface DetailViewController ()
@property (nonatomic, strong) UIButton *dismissButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    _dismissButton = [UIButton new];
    [_dismissButton addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:_dismissButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGRect frame = _dismissButton.frame;
    frame.size.height = kGeomButtonSize;
    frame.size.width = kGeomButtonSize;
    frame.origin.x = 20;
    frame.origin.y = 20;
    _dismissButton.frame = frame;
}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
