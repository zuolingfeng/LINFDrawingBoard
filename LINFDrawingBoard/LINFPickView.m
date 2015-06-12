//
//  LINFPickView.m
//  LINFDrawingBoard
//
//  Created by Linf on 15/6/12.
//  Copyright (c) 2015年 左凌风. All rights reserved.
//

#import "LINFPickView.h"

// 屏幕宽高度
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface LINFPickView ()  <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *listWidth;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSString *confirmString;

@end

@implementation LINFPickView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _listWidth = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",
                      @"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",nil];
        _confirmString = _listWidth[0];
        
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 40.0f, frame.size.width, 216.0f)];
        _pickerView.backgroundColor = [UIColor clearColor];
        _pickerView.showsSelectionIndicator=YES;
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        [self addSubview:_pickerView];
        
        UIButton *hide = [UIButton buttonWithType:UIButtonTypeCustom];
        hide.frame = CGRectMake(0.0f, 0.0f, 60.0f, 40.0f);
        [hide setTitle:@"hide" forState:UIControlStateNormal];
        [hide setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [hide addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:hide];
        
        UIButton *confirm = [UIButton buttonWithType:UIButtonTypeCustom];
        confirm.frame = CGRectMake(SCREEN_WIDTH - 80.0f, 0.0f, 80.0f, 40.0f);
        [confirm setTitle:@"confirm" forState:UIControlStateNormal];
        [confirm setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [confirm addTarget:self action:@selector(confirmView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:confirm];
        
    }
    return self;
}

- (void) showPickString:(showPickView)show {
    _showPickView = [show copy];
}

- (void) hideView {
    [self removeFromSuperview];
}

- (void) confirmView {
    [self removeFromSuperview];
    _showPickView(_confirmString);
}

// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _listWidth.count;
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return SCREEN_WIDTH;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _confirmString = _listWidth[row];
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _listWidth[row];
}

@end
