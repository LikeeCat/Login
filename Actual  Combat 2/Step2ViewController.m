//
//  Step2ViewController.m
//  Actual  Combat 2
//
//  Created by 樊树康 on 16/8/15.
//  Copyright © 2016年 懒懒的猫鼬鼠. All rights reserved.
//

#import "Step2ViewController.h"

@interface Step2ViewController ()
@property (weak, nonatomic) IBOutlet CustomTextFIeld *nameFiled;
@property (weak, nonatomic) IBOutlet CustomTextFIeld *emailFiled;

@property (weak, nonatomic) IBOutlet UIView *step2View;
@property (weak, nonatomic) IBOutlet CustomTextFIeld *usernameFiled;
@end

@implementation Step2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.usernameFiled.text = self.message.username;
    self.emailFiled.text = self.message.email;
    
    self.nameFiled.text = self.message.name;

    [self.nameFiled setCornerRadius ];
    [self.emailFiled setCornerRadius];
    [self.usernameFiled setCornerRadius];
    //可以设置圆角
//    self.usernameFiled.clipsToBounds = YES;
//    self.emailFiled.clipsToBounds = YES;
//    self.nameFiled.clipsToBounds = YES;
    self.step2View.clipsToBounds = YES;
    //设置圆角
//    self.usernameFiled.layer.cornerRadius = 5;
//    self.emailFiled.layer.cornerRadius = 5;
//    self.nameFiled.layer.cornerRadius = 5;
    self.step2View.layer.cornerRadius = 10;
    //描边
//    self.usernameFiled.layer.borderWidth = 1;
//    self.emailFiled.layer.borderWidth = 1;
//    self.nameFiled.layer.borderWidth = 1;
    self.step2View.layer.borderWidth = 2;

    //描边颜色
     UIColor *color = [UIColor colorWithRed:127.0/255 green:255.0/255  blue:212.0/255 alpha:0.9];
    
//    self.usernameFiled.layer.borderColor = color.CGColor;
//    self.nameFiled.layer.borderColor = color.CGColor;
//    self.emailFiled.layer.borderColor = color.CGColor;
    self.step2View.layer.borderColor = color.CGColor;

    // Do any additional setup after loading the view.
}
#pragma mark -- Back Segue --
- (IBAction)backStep1:(id)sender {
    
    self.message.email = self.emailFiled.text;
    self.message.name = self.nameFiled.text;
    [self performSegueWithIdentifier:@"backStep1" sender:sender];
}


#pragma mark -- Go Segue --
- (IBAction)Go:(id)sender {
    self.message.email = self.emailFiled.text;
    self.message.name = self.nameFiled.text;
    [self performSegueWithIdentifier:@"showStep3" sender:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showStep3"]){
        Step3ViewController *step3 = (Step3ViewController *)segue.destinationViewController;
        
        step3.message = self.message;
        
    }
}

-(IBAction)unwindtToStep2:(UIStoryboardSegue *)segue{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
