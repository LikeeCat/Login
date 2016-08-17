# Login
一个简单的注册界面
# ###简介
这几天一直在写一个注册登陆界面,其中用到了下面的一些知识 分享给大家 


#Segue 转场的使用
   
 ##转场前的准备
 - 建立一个转场 (这个就不用说了吧)
 - 如果我们需要使用segue转场,那么我们需要指定Segue
![segue](http://upload-images.jianshu.io/upload_images/2239937-95b7372426551972.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 - 接着我们需要给这个Segue设置一个 Identifier
![设置转场的IdentIfier](http://upload-images.jianshu.io/upload_images/2239937-dce59291ff58487e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##开始转场
- 我们就可以在代码中来对转场进行控制
     - 如果我们需要在转场前做一些传值等的准备工作 可以声明这个方法
           -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
           if (self.message==nil)
           {
             self.message=[[Data alloc]init];
           }
            //封装
             self.message.username = self.nameField.text;
            self.message.password = self.passworldField.text;
   
            if ([segue.identifier isEqualToString:@"showStep2"]) {
               Step2ViewController *st2 = (Step2ViewController     *)segue.destinationViewController;
               st2.message = self.message;    
                }
           }
  使用这个方法可以在转场前进行传值,做一些必要的准备工作(我这里写的是一个自己的传值例子.里面所写的第二个if判断是是否传值需要的条件)
- 接下来我们就可以进行转场了,我是用按钮触发的转场
      - (IBAction)Show:(id)sender {
         [self performSegueWithIdentifier:@"showStep2" sender:sender];
      }

  这就是一个简单的正向转场

## Segue反向转场
     
  首先我们需要在你要返回的那个Scene对应的ViewController中实现这个方法
      
    -(IBAction)unwindForSegue:(UIStoryboardSegue *)segue{

    if([segue.identifier isEqualToString:@"backStep1"]){

        Step2ViewController *Step2 = (Step2ViewController *)segue.sourceViewController;
        
        self.message = Step2.message;

       }
    
    }
 注:里面的方法需要在指定好转场的触发控件,还有指定了Sugue的Identifier才可以使用
 接下来需要在StoryBoard中,你需要进行反向转场的Sence上触发这个方法
   1. 在需要进行反向转场的Sence中 点击Ctr 拖动按钮到界面最顶上的Exit
![Button 触发转场](http://upload-images.jianshu.io/upload_images/2239937-9c68af72d00fd71e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
2.选择我们在要需要返回的Scene 的ViewController 中指定好的方法,这个时候你的Sence的大纲视图中中会出现这个

![点击设置转场的identifier](http://upload-images.jianshu.io/upload_images/2239937-a7d7aab3af5f2458.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![设置转场的Identifier](http://upload-images.jianshu.io/upload_images/2239937-c99da889a3c0c131.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
3.接下来我们就可以去实现unwindForSegue方法了

##使用StoryBoard 在两个Sense 之间跳转 
 首先我们需要在知道你要跳转的 Sence 在哪
               
     UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
 
接下来我们必须初始化一个跳转到得界面,因为我们并不知道你要跳转到的界面是StoryBoard的那个Scene 所以我们需要给他一个Storyboard ID
  点击你需要跳转到得界面的sence 指定Storyboard id
![ 指定 Storyboard id](http://upload-images.jianshu.io/upload_images/2239937-1e3f8a3340d774ea.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) 

接下来我们用这个Storyboard id 来初始化一个ViewController    
          
       ViewController * step1 = [story instantiateViewControllerWithIdentifier:@"step1"];

最后把这个ViewController 展现出来
     
    [self presentViewController:step1 animated:YES completion:nil];

##传值封装
   
如果一个一个创建变量,然后再赋值(⊙o⊙)…,效率太低,还要多写好多代码.所以我封装了一个类来对场景之间的值进行处理

    #import <Foundation/Foundation.h>

    @interface Data : NSObject
    @property(nonatomic,copy) NSString *name;
    @property(nonatomic,copy) NSString *password;
    @property(nonatomic,copy)NSString *username;
    @property(nonatomic,copy)NSString *email;
    @end

接着在每个类中使用这个数据的模型

    @interface ViewController : UIViewController
    @property (nonatomic,strong)Data * message;
    @end

  因为用到了属性的一些修饰符,所以整理一下关于属性的修饰的一些解释
  ###属性修饰符 
  1. assgin 适用于对基本数据类型（int,float等）的简单赋值操作

  2. strong 这个属性特质表示一种拥有的关系，setter方法设置新值的时候会先保留属性的新值，然后释放旧值，最后将新值赋值给属性

  3. weak   表示一种非拥有的关系。setter方法设置新值的时候不会先保留属性的新值，也不会释放旧值，只是将新值赋值给属性，与assign不同的是该内存管理特性会在属性所指的对象销毁时，将属性置为nil，更加安全

  4. unsafe_unretained  与assign类型类似。适用于"对象"类型的赋值，表达的是一种非拥有(unretained)的关系，当属性所指的对象被销毁时，属性值不会自动被自动清空；

  5. copy 如字面意思，该特质的setter方法不会保留新值，而是将其拷贝，当属性类型为NSString时候，可以用这个特质来确保属性的值不会被其他对象修改。

##自定义TextField
   
  当我们选择一个TextField 控件并且拖拽到屏幕上时,这时我们并不可以自己去设置TextField的高度.这个时候,我们需要考虑不用默认的BorderStyle 默认是最后一个,我选了第一个,这个时候就可以愉快的设置高度了O(∩_∩)O哈哈~
![设置BorderStyle](http://upload-images.jianshu.io/upload_images/2239937-30c8d97a3ae5a2fd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![设置TextField属性](http://upload-images.jianshu.io/upload_images/2239937-0a52ac3c4e67004b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

在做完了这些之后,因为我想让效果更好.我将textfield的view背景设置为ClearColor 然后做了一个View 来对这些控件进行一下包装.

因为这个时候我的输入框的背景已经完全透明了,所以就找不到输入框了...接下来我们自定义类去解决这些(其实也可以用Category来解决,不过我用了自定义的类)
这是.h文件
    #import <UIKit/UIKit.h>
    
    @interface CustomTextFIeld : UITextField
     
    -(void)setCornerRadius;

    @end
这是.m文件
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

在这个类中,我为TextField 自定了一个描边和设置圆角的方法,来让控件可见

对了 在使用UIColor设置颜色的时候需要注意一件事(那就是他的r,g,b都是小数,所以我们应该这么写 
  举个栗子
    这样写就是错误的,如果你这么写了,你会发现这样出来的不是你预期的颜色
          
     UIColor *color = [UIColor colorWithRed:127/255 green:255/255  blue:212/255 alpha:0.9];

  正确的是这么写的O(∩_∩)O哈哈~ 必须是xxx.0/255

    UIColor *color = [UIColor colorWithRed:127.0/255 green:255.0/255  blue:212.0/255 alpha:0.9];

##最后分享一下把状态栏设置样式的代码

在AppDelegate的didFinishLaunchingWithOption 加入如下代码
    
     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //让状态栏变白色

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
       return YES;
     }
做完这些之后在运行,我们的代码好像并没有生效,状态栏样式还是黑色的...

 我们需要在Info 文件中添加一个设置
![Info界面](http://upload-images.jianshu.io/upload_images/2239937-c39e47f8efbb8c84.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 点击任意一个"+' 输入ViewController -based status bar后面还有就不写了 ,反正就是这个属性 ,将值设置为NO 这个时候在运行就得到我们想要的效果啦
![status bar 属性](http://upload-images.jianshu.io/upload_images/2239937-c5a776b127c0a414.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


最后贴上完成图给大家看看
![步骤一](http://upload-images.jianshu.io/upload_images/2239937-b78de00443b9e365.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![步骤二](http://upload-images.jianshu.io/upload_images/2239937-566b3c83a1111f23.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![步骤三](http://upload-images.jianshu.io/upload_images/2239937-637dc4bf89ac4e4a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


如果你有什么问题可以留言,大家一起交流啊 (*^__^*) 嘻嘻……


