//
//  ViewController.m
//  LINFDrawingBoard
//
//  Created by 左凌风 on 15/6/6.
//  Copyright (c) 2015年 左凌风. All rights reserved.
//

#import "ViewController.h"
#import "BoardView.h"
#import "LINFPickView.h"

// 屏幕宽高度
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

// UIButton Tag
#define BUTTON_TAG          100

@interface ViewController ()

@property (nonatomic, strong) BoardView *boardView;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) LINFPickView *pickView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _boardView = [[BoardView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_boardView];
    
    _listArray = [[NSMutableArray alloc] initWithObjects:@"画笔", @"颜色", @"撤销", @"向前", @"保存相册", nil];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, SCREEN_HEIGHT - 44.0f, SCREEN_WIDTH, 44.0f)];
    [self.view addSubview:toolBar];
    
    CGFloat count = _listArray.count, width = SCREEN_WIDTH / count;
    for (int index = 0; index < _listArray.count; index ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = BUTTON_TAG + index;
        button.frame = CGRectMake(width * index, 0.0f, width, 44.0f);
        [button setTitle:_listArray[index] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(firstButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [toolBar addSubview:button];
    }
    
}

- (void) firstButtonAction:(UIButton *)sender {
    switch (sender.tag - BUTTON_TAG) {
        case 0:
            [self showLineWidth];
            break;
            
        default:
            break;
    }
}

- (LINFPickView *)pickView {
    if (!_pickView) {
        _pickView = [[LINFPickView alloc] initWithFrame:CGRectMake(0.0f, SCREEN_HEIGHT - 216.0f - 44.0f - 40.0f, SCREEN_WIDTH, 216.0f + 40.0f)];
        [_pickView showPickString:^(NSString *string) {
            [_boardView setLineWidth:[string floatValue]];
        }];
    }
    return _pickView;
}

- (void) showLineWidth {
    [self.view addSubview:self.pickView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
