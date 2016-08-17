//
//  ViewController.m
//  Actual  Combat 2
//
//  Created by 樊树康 on 16/8/15.
//  Copyright © 2016年 懒懒的猫鼬鼠. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet CustomTextFIeld *nameField;
@property (weak, nonatomic) IBOutlet CustomTextFIeld *passworldField;
@property (weak, nonatomic) IBOutlet UIView *LoginView;

@end

@implementation ViewController
- (IBAction)Show:(id)sender {
    [self performSegueWithIdentifier:@"showStep2" sender:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // UIImageView *iconImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"setup-head-default"]];
    
   // iconImg.frame = CGRectMake(100, 169,40, 40);
  

    
  
    
    self.LoginView.clipsToBounds = YES;
    self.LoginView.layer.cornerRadius = 30;
    
  self.LoginView.layer.borderWidth = 2.01;
    
    UIColor *color = [UIColor colorWithRed:127.0/255 green:255.0/255  blue:212.0/255 alpha:0.9];
    
    [self.nameField setCornerRadius];
    [self.passworldField setCornerRadius];

    self.LoginView.layer.borderColor = color.CGColor;


    // Do any additional setup after loading the view, typically from a nib.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
 
    if (self.message==nil)
    {
        self.message=[[Data alloc]init];
    }
    //封装
    
   self.message.username = self.nameField.text;
    self.message.password = self.passworldField.text;
  
   
    if ([segue.identifier isEqualToString:@"showStep2"]) {
        Step2ViewController *st2 = (Step2ViewController *)segue.destinationViewController;
           st2.message = self.message;    
    }
}

-(IBAction)unwindForSegue:(UIStoryboardSegue *)segue{
    
    if([segue.identifier isEqualToString:@"backStep1"]){
            Step2ViewController *Step2 = (Step2ViewController *)segue.sourceViewController;
        
        self.message = Step2.message;
        NSLog(@"hello is %@",self.message.email);
    }


    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
