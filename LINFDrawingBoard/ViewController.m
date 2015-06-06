//
//  ViewController.m
//  LINFDrawingBoard
//
//  Created by 左凌风 on 15/6/6.
//  Copyright (c) 2015年 左凌风. All rights reserved.
//

#import "ViewController.h"
#import "BoardView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    BoardView *view = [[BoardView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
