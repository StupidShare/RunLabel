//
//  RunLabel.m
//  RunLabel
//
//  Created by MacOS on 2017/3/20.
//  Copyright © 2017年 LiuMingHui. All rights reserved.
//

#import "RunLabel.h"


#define k_SELF_X      self.frame.origin.x
#define k_SELF_Y      self.frame.origin.y
#define k_SELF_SIZE   self.frame.size
#define k_SELF_WIDTH  self.frame.size.width
#define k_SELF_HEIGHT self.frame.size.height

#define k_LABEL_X      self.label.frame.origin.x
#define k_LABEL_Y      self.label.frame.origin.y
#define k_LABEL_SIZE   self.label.frame.size
#define k_LABEL_WIDTH  self.label.frame.size.width
#define k_LABEL_HEIGHT self.label.frame.size.height
#define k_WeakSelf     __typeof(self) weakSelf = self;

@interface RunLabel()
@property (strong,nonatomic) UILabel * label;
@property (strong,nonatomic) NSMutableArray * texts;
@end

@implementation RunLabel

- (void)layoutSubviews{
    self.clipsToBounds = YES;
}

#pragma mark ----- Geter Method ----
- (CGFloat)font{
    if (_font == 0.0) {
        _font = 17;
    }
    return _font;
}
- (CGFloat)duration{
    if (_duration == 0.0) {
        _duration = 5;
    }
    return _duration;
}
- (UIColor *)color{
    if (!_color) {
        _color = [UIColor blackColor];
    }
    return _color;
}
- (UILabel *)label{
    if (!_label) {
        CGRect bounds = self.bounds;
        bounds.origin.x = k_SELF_WIDTH;
        _label = [[UILabel alloc] initWithFrame:bounds];
        _label.font = [UIFont systemFontOfSize:self.font];
        _label.textColor = self.color;
        if (self.labelBackgroundView) {
            [_label addSubview:self.labelBackgroundView];
        }
        [self addSubview:_label];
    }
    return _label;
}
- (NSMutableArray *)texts{
    if (!_texts) {
        _texts = [NSMutableArray array];
    }
    return _texts;
}


#pragma mark ----- Setter Method ----
- (void)setText:(NSString *)text{
    _text = text;
    [self.texts addObject:text];
    [self startAnimate];
}



- (void)startAnimate{
    if (self.texts.count) {
        self.hidden = NO;
        if ((int)k_LABEL_X == (int)k_SELF_WIDTH) {
            self.label.text = self.texts.firstObject;
            [self.texts removeObject:self.texts.firstObject];
            CGSize size = [self.label.text sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:self.font]}];
            CGRect rect = self.label.frame;
            rect.size = size;
            self.label.frame = rect;
            k_WeakSelf
            [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                CGRect frame = weakSelf.label.bounds;
                frame.origin.x = -weakSelf.label.frame.size.width;
                weakSelf.label.frame = frame;
            } completion:^(BOOL finished) {
                self.hidden = YES;
                CGRect frame = weakSelf.label.bounds;
                frame.origin.x = weakSelf.bounds.size.width;
                weakSelf.label.frame = frame;
                [weakSelf startAnimate];
            }];
        }
    }
}


@end
