
# YWHUDManager

# 介绍
*封装成了加载，成功，失败，警告，文字，自定义视图，自定义视图按钮，隐藏视图等几大板块，并且全部支持回调，另外提供了接口允许修改所有默认属性，使用灵活，而且使用该框架不会出现在同一视图叠加问题，就是说在同一个父视图上显示不会统一显示两个提示框 方便调用*

#### 视图显示

* 显示加载                                                                   
![image](https://github.com/china-han/YWHUDManager/blob/master/img/4.gif) 
* 显示成功                                                                   
![image](https://github.com/china-han/YWHUDManager/blob/master/img/5.gif) 
* 显示失败                                                                   
![image](https://github.com/china-han/YWHUDManager/blob/master/img/6.gif) 
* 显示警告                                                                   
![image](https://github.com/china-han/YWHUDManager/blob/master/img/7.gif) 
* 显示文字                                                                   
![image](https://github.com/china-han/YWHUDManager/blob/master/img/8.gif) 
* 显示自定义视图                                                                   
![image](https://github.com/china-han/YWHUDManager/blob/master/img/9.gif) 
* 显示自定义视图和按钮                                                                   
![image](https://github.com/china-han/YWHUDManager/blob/master/img/10.gif) 

# 用法
下载zip,把其中的YWHudManager拖入到你的项目中，记得点击允许copy
导入HUDManager.h
```
#import "HUDManager.h"
```

## 显示加载  
```
#pragma mark - 加载
-(void)showLoading{
    [HUDManager showLoadingHud:nil];
    [self hidenHud];
}

-(void)showLoadingOnView{
    [HUDManager showLoadingHud:@"加载中..." onView:self.view];
    [self hidenHudFromView];
}

-(void)showLoadingAndCompletionBlock{
    [HUDManager showLoadingHud:nil onView:nil completionBlock:^{
        NSLog(@"不指定视图加载完成");
    }];
   
    [self hidenHud];
}

-(void)showLoadingAndCompletionBlockOnView{
    [HUDManager showLoadingHud:@"加载中..." onView:self.view completionBlock:^{
        NSLog(@"指定视图加载完成");
    }];
   [self hidenHudFromView];
 
}
```
## 显示成功
```
-(void)showSuccess{
    [HUDManager showStateHud:nil state:HUDStateTypeSuccess];
}

-(void)showSuccessView{
    [HUDManager showStateHud:nil state:HUDStateTypeSuccess onView:self.view];
}

-(void)showSuccessTimeView{
    [HUDManager showStateHud:@"这是成功了" state:HUDStateTypeSuccess afterDelay:2 onView:self.view];
}

-(void)showSuccessTime{
    [HUDManager showStateHud:@"这是成功了" state:HUDStateTypeSuccess afterDelay:5];
}

-(void)showSuccessTimeImgName{
    [HUDManager showStateHud:nil state:HUDStateTypeSuccess imgName:@"微笑 _小" afterDelay:1.5];
}

-(void)showSuccessTimeImgNameView{
    [HUDManager showStateHud:nil state:HUDStateTypeSuccess imgName:nil afterDelay:1 onView:self.view];
}

-(void)showSuccessTimeImgNameViewBlock{
    [HUDManager showStateHud:nil state:HUDStateTypeSuccess imgName:nil afterDelay:2 onView:nil completionBlock:^{
         NSLog(@"成功回调");
    }];
}
```
## 显示失败
```
-(void)showFail{
    [HUDManager showStateHud:nil state:HUDStateTypeFail];
}

-(void)showFailView{
    [HUDManager showStateHud:nil state:HUDStateTypeFail onView:self.view];
}

-(void)showFailTimeView{
    [HUDManager showStateHud:@"这是失败了" state:HUDStateTypeFail afterDelay:2 onView:self.view];
}

-(void)showFailTime{
    [HUDManager showStateHud:@"这是失败了" state:HUDStateTypeFail afterDelay:5];
}

-(void)showFailTimeImgName{
    [HUDManager showStateHud:nil state:HUDStateTypeFail imgName:@"哭" afterDelay:1.5];
}

-(void)showFailTimeImgNameView{
    [HUDManager showStateHud:nil state:HUDStateTypeFail imgName:nil afterDelay:1 onView:self.view];
}

-(void)showFailTimeImgNameViewBlock{
    [HUDManager showStateHud:nil state:HUDStateTypeFail imgName:nil afterDelay:2 onView:nil completionBlock:^{
        NSLog(@"失败回调");
    }];
}
```
## 显示警告
```
-(void)showWarning{
    [HUDManager showStateHud:nil state:HUDStateTypeWarning];
}

-(void)showWarningView{
    [HUDManager showStateHud:nil state:HUDStateTypeWarning onView:self.view];
}

-(void)showWarningTimeView{
    [HUDManager showStateHud:@"这是警告了" state:HUDStateTypeWarning afterDelay:2 onView:self.view];
}

-(void)showWarningTime{
    [HUDManager showStateHud:@"这是警告了" state:HUDStateTypeWarning afterDelay:5];
}

-(void)showWarningTimeImgName{
    [HUDManager showStateHud:nil state:HUDStateTypeWarning imgName:@"哭" afterDelay:1.5];
}

-(void)showWarningTimeImgNameView{
    [HUDManager showStateHud:nil state:HUDStateTypeWarning imgName:nil afterDelay:1 onView:self.view];
}

-(void)showWarningTimeImgNameViewBlock{
    [HUDManager showStateHud:nil state:HUDStateTypeWarning imgName:nil afterDelay:2 onView:nil completionBlock:^{
        NSLog(@"警告回调");
    }];
}
```
## 显示文字
```
-(void)showText{
    [HUDManager showTextHud:@"这是展示的文字"];
}

-(void)showTextTime{
    [HUDManager showTextHud:@"这是展示的文字" afterDelay:2];
}

-(void)showTextView{
    [HUDManager showTextHud:@"这是展示的文字" onView:self.view];
}

-(void)showTextTimeView{
    [HUDManager showTextHud:@"这是展示的文字" afterDelay:2 onView:self.view];
}

-(void)showTextTimeViewBlock{
    [HUDManager showTextHud:@"这是展示的文字" afterDelay:2 onView:self.view completionBlock:^{
         NSLog(@"展示的文字回调");
    }];
}
```
## 显示自定义视图
```
-(void)showCustomView{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"warning"]];
    [HUDManager showHudCustomView:imgView];
    
}

-(void)showCustomViewToView{
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"自定义按钮视图" forState:UIControlStateNormal];
    [HUDManager showHudCustomView:btn onView:self.view];
}

-(void)showCustomViewMaskViewToView{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"warning"]];
    [HUDManager showHudCustomView:imgView isShowMaskView:YES onView:self.view];
}

-(void)showCustomViewMaskViewTime{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"微笑"]];
    [HUDManager showHudCustomView:imgView isShowMaskView:YES afterDelay:3];
}

-(void)showCustomViewMaskViewTimeToView{
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"自定义leble";
    [HUDManager showHudCustomView:lable isShowMaskView:YES afterDelay:2 onView:self.view];
}

-(void)showCustomViewMaskViewTimeViewTextBlock{
   UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"微笑"]];
    [HUDManager showHud:@"自定义视图" customView:imgView isShowMaskView:YES afterDelay:3 onView:self.view completionBlock:^{
        NSLog(@"自定义视图回调");
    }];
}
```
## 显示自定义按钮视图
```
-(void)showBtnHud{
    
    [HUDManager showHud:@"自定义视图按钮" customImgView:nil btnTitle:@"确定" btnFont:[UIFont systemFontOfSize:18] btnTitleColor:nil btnBackColor:nil Target:self action:@selector(clickSure) isShowMaskView:YES afterDelay:3 isHide:YES onView:self.view completionBlock:^{
         NSLog(@"自定义带按钮的视图设置显示时间");
    }];
}

-(void)clickSure{
    [HUDManager hidenHudFromView:self.view];
}

-(void)showBtnHudTime{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"warning"]];
    [HUDManager showHud:@"自定义视图按钮" customImgView:imgView btnTitle:@"取消" btnFont:[UIFont systemFontOfSize:18] btnTitleColor:nil btnBackColor:nil Target:self action:@selector(clickCancle) isShowMaskView:YES  isHide:NO onView:self.view completionBlock:^{
        NSLog(@"自定义带按钮的视图");
    }];
}

-(void)clickCancle{
    [HUDManager hidenHudFromView:self.view];
}
```
## 隐藏
```
-(void)hidenHud{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUDManager hidenHud];
    });
}

-(void)hidenHudFromView{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUDManager hidenHudFromView:self.view];
    });
}
```
## 自定义默认属性
你可以在程序启动的时候一次性定义，也可以在使用的时候临时定义，但是如果使用临时定义你最好在其他地方使用的时候也定义，以避免出现提示混乱
```
/**
 设置加载提示语
 
 @param logingMessage 加载提示语
 */
+ (void)setYWLoadingMessage:(NSString *)logingMessage;

/**
 设置成功提示语
 
 @param successMessage 成功提示语
 */
+ (void)setYWSuccessMessage:(NSString *)successMessage;

/**
 设置成功提示图片
 
 @param successImgName 成功提示图片
 */
+ (void)setYWSuccessImgName:(NSString *)successImgName;

/**
 设置失败提示语
 
 @param failMessage 成功提示语
 */
+ (void)setYWFailMessage:(NSString *)failMessage;

/**
 设置失败提示图片
 
 @param failImgName 失败提示图片
 */
+ (void)setYWFailImgName:(NSString *)failImgName;

/**
 设置警告提示语
 
 @param warningMessage 警告提示语
 */
+ (void)setYWWarningMessage:(NSString *)warningMessage;

/**
 设置警告提示图片
 
 @param warningImgName 警告提示图片
 */
+ (void)setYWWarningImgName:(NSString *)warningImgName;

/**
 设置视图展示时间 
 
 @param showTime 视图展示时间
 */
+ (void)setYWShowTime:(NSTimeInterval)showTime;


/**
 设置遮罩颜色

 @param white 遮罩颜色
 */
+(void)setYWWhite:(CGFloat)white;


/**
 设置遮罩透明度

 @param alpha 遮罩透明度
 */
+(void)setYWAlpha:(CGFloat)alpha;
```


