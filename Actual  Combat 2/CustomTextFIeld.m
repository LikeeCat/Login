
//
//  CustomTextFIeld.m
//  Actual  Combat 2
//
//  Created by 樊树康 on 16/8/16.
//  Copyright © 2016年 懒懒的猫鼬鼠. All rights reserved.
//

#import "CustomTextFIeld.h"

@implementation CustomTextFIeld

-(void)setCornerRadius{
    self.layer.borderWidth = 1;
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 5;
    
    
     UIColor *color = [UIColor colorWithRed:127.0/255 green:255.0/255  blue:212.0/255 alpha:0.9];
    
    self.layer.borderColor = color.CGColor;
}



@end

