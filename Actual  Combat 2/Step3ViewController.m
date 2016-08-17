//
//  Step3ViewController.m
//  Actual  Combat 2
//
//  Created by 樊树康 on 16/8/15.
//  Copyright © 2016年 懒懒的猫鼬鼠. All rights reserved.
//

#import "Step3ViewController.h"

@interface Step3ViewController ()
@property (weak, nonatomic) IBOutlet CustomTextFIeld *usernameFiled;
@property (weak, nonatomic) IBOutlet CustomTextFIeld *passwordField;
@property (weak, nonatomic) IBOutlet CustomTextFIeld *emailField;
@property (weak, nonatomic) IBOutlet UIView *Step3View;
@property (weak, nonatomic) IBOutlet CustomTextFIeld *nameFiled;

@end

@implementation Step3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.nameFiled.text = self.message.name;
    self.passwordField.text =self.message.password;
    self.usernameFiled.text = self.message.username;
    self.emailField.text = self.message.email;

    [self.usernameFiled setCornerRadius];
    [self.emailField setCornerRadius];
    [self.nameFiled setCornerRadius];
    
    [self.passwordField setCornerRadius];
    //可以设置圆角

    self.Step3View.clipsToBounds = YES;
    //设置圆角
   
    self.Step3View.layer.cornerRadius = 10;
    //描边
   
    self.Step3View.layer.borderWidth = 2;
    
    //描边颜色
    UIColor *color = [UIColor colorWithRed:127.0/255 green:255.0/255  blue:212.0/255 alpha:0.9];
    
    self.Step3View.layer.borderColor = color.CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)accomplish:(id)sender {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的账户即将创建完成,请点击下一步确认" preferredStyle:UIAlertControllerStyleAlert];
    UITextField * name = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 150, 35)];
    name.text = self.usernameFiled.text;
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler: ^(UIAlertAction * _Nonnull action) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
      ViewController * step1 = [story instantiateViewControllerWithIdentifier:@"step1"];
  
        
        [self presentViewController:step1 animated:YES completion:nil];
        
      
    }];
    
    UIAlertAction *no = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:yes];
    [alert addAction:no];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = name.text;
        textField.userInteractionEnabled = NO;
    }];
    [self presentViewController:alert animated:YES completion:nil];
    
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
