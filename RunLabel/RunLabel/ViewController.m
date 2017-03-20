//
//  ViewController.m
//  RunLabel
//
//  Created by MacOS on 2017/3/20.
//  Copyright © 2017年 LiuMingHui. All rights reserved.
//

#import "ViewController.h"
#import "RunLabel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet RunLabel *runLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)addText:(UIButton *)sender {
    static int i = 0;
    i++;
    self.runLabel.text = [NSString stringWithFormat:@"添加滚动文字%d",i];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
