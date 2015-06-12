//
//  LINFPickView.h
//  LINFDrawingBoard
//
//  Created by Linf on 15/6/12.
//  Copyright (c) 2015年 左凌风. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^showPickView)(NSString *string);

@interface LINFPickView : UIView {
    showPickView _showPickView;
}

- (void) showPickString:(showPickView)show;

@end
