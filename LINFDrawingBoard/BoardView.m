//
//  BoardView.m
//  LINFDrawingBoard
//
//  Created by 左凌风 on 15/6/6.
//  Copyright (c) 2015年 左凌风. All rights reserved.
//

#import "BoardView.h"

@interface BoardView ()

@property (nonatomic, strong) NSArray *pointArray;
@property (nonatomic, strong) NSMutableArray *nowPointArray;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIBezierPath *bezierPath;

@end

@implementation BoardView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _pointArray = [[NSArray alloc] init];
        _nowPointArray = [[NSMutableArray alloc] init];
        _lineColor = [UIColor blackColor];
        _lineWidth = 2.0f;
        _bezierPath = [UIBezierPath bezierPath];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [_lineColor set];
    _bezierPath.lineWidth = _lineWidth;
    [_bezierPath removeAllPoints];
    if (_nowPointArray.count < 2) return;
    
    for (int i = 0; i < _pointArray.count; i ++) {
        NSArray *array = _pointArray[i];
        for (int j = 0; j < array.count - 1; j ++) {
            [_bezierPath moveToPoint:[(NSValue *)array[j] CGPointValue]];
            [_bezierPath addLineToPoint:[(NSValue *)array[j + 1] CGPointValue]];
        }
        [_bezierPath stroke];
    }
    
    for (int index = 0; index < _nowPointArray.count - 1; index ++) {
        [_bezierPath moveToPoint:[(NSValue *)_nowPointArray[index] CGPointValue]];
        [_bezierPath addLineToPoint:[(NSValue *)_nowPointArray[index + 1] CGPointValue]];
    }
    [_bezierPath stroke];
}

- (BOOL) isMultipleTouchEnabled {
    return NO;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    _nowPointArray = [[NSMutableArray alloc] init];
    CGPoint point = [[touches anyObject] locationInView:self];
    [_nowPointArray addObject:[NSValue valueWithCGPoint:point]];
    [self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    [_nowPointArray addObject:[NSValue valueWithCGPoint:point]];
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    _pointArray = [_pointArray arrayByAddingObject:_nowPointArray];
    [self setNeedsDisplay];
}


@end
