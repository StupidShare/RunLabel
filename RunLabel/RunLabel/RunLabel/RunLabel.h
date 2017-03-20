//
//  RunLabel.h
//  RunLabel
//
//  Created by MacOS on 2017/3/20.
//  Copyright © 2017年 LiuMingHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RunLabel : UIView
/** 耗时 默认5秒*/
@property (nonatomic,assign) CGFloat duration;
/** 字体大小 默认17*/
@property (nonatomic,assign) CGFloat font;
/** 需要播放的文字 */
@property (nonatomic,copy) NSString * text;
@property (nonatomic,strong)UIColor * color;
/** Label背景UIView的子类 */
@property (nonatomic,strong)UIView * labelBackgroundView;
@end
