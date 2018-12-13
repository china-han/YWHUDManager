//
//  HUDManager.m
//  YWHUDManager
//
//  Created by hyw on 2018/8/14.
//  Copyright © 2018年 bksx. All rights reserved.
//

#import "HUDManager.h"

//windows
#define KeyWindow [UIApplication sharedApplication].keyWindow


//static NSString *const YWLoadingMessage = @"loading...";
///* 默认成功提示，可在这统一修改 */
//static NSString *const YWSuccessMessage = @"加载成功";
///* 默认简短提示语显示的时间，在这统一修改 */
//static CGFloat const   YWShowTime  = 1.5f;


/* 默认网络提示*/
static NSString         *YWLoadingMessage = @"loading...";

/* 默认成功提示*/
static NSString         *YWSuccessMessage = @"加载成功";
/* 默认成功显示图片*/
static NSString         *YWSuccessImgName = @"MBProgressHUD.bundle/success";

/* 默认失败提示*/
static NSString         *YWFailMessage = @"加载失败";
/* 默认失败显示图片*/
static NSString         *YWFailImgName = @"MBProgressHUD.bundle/error";

/* 默认警告提示*/
static NSString         *YWWarningMessage = @"警告警告";
/* 默认警告显示图片*/
static NSString         *YWWarningImgName = @"MBProgressHUD.bundle/warning";

/*默认简短提示语显示的时间*/
static NSTimeInterval   YWShowTime = 1.5f;

/*默认遮罩颜色*/
static CGFloat   YWWhite = 0.3f;

/*默认遮罩透明度*/
static CGFloat   YWAlpha = 0.5f;

@implementation HUDManager

#pragma mark - 属性设置
+ (void)setYWLoadingMessage:(NSString *)logingMessage{
    YWLoadingMessage = logingMessage;
}

+ (void)setYWSuccessMessage:(NSString *)successMessage{
    YWSuccessMessage = successMessage;
}

+ (void)setYWSuccessImgName:(NSString *)successImgName{
    YWSuccessImgName = successImgName;
}

+ (void)setYWFailMessage:(NSString *)failMessage{
    YWFailMessage = failMessage;
}

+ (void)setYWFailImgName:(NSString *)failImgName{
    YWFailImgName = failImgName;
}

+ (void)setYWWarningMessage:(NSString *)warningMessage{
    YWWarningMessage = warningMessage;
}

+ (void)setYWWarningImgName:(NSString *)warningImgName{
    YWWarningImgName = warningImgName;
}

+ (void)setYWShowTime:(NSTimeInterval)showTime{
    YWShowTime = showTime;
}

+(void)setYWWhite:(CGFloat)white{
    YWWhite = white;
}

+(void)setYWAlpha:(CGFloat)alpha{
    YWAlpha = alpha;
}

#pragma mark - 加载显示
+(void)showLoading{
    [self showLoadingHud:nil];
}

+ (void)showLoadingHud:(NSString *)message{
    [self showLoadingHud:message onView:nil];
}

+ (void)showLoadingHud:(NSString *)message onView:(UIView *)view{
    [self showLoadingHud:message onView:view completionBlock:nil];
}

+ (void)showLoadingHud:(NSString *)message onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock{
    if (view == nil) view = KeyWindow;
    //预想中一个视图上不应该出现两个以上的提示，因此调用一下隐藏方法
    [MBProgressHUD hideHUDForView:view animated:YES];
    //添加新的hud
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.color = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = message ? message:YWLoadingMessage;
    // 隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    hud.completionBlock = completionBlock;
}

#pragma mark - 显示状态
+ (void)showStateHud:(NSString *)message state:(HUDStateType)state{
    [self showStateHud:message state:state afterDelay:YWShowTime];
}

+ (void)showStateHud:(NSString *)message state:(HUDStateType)state  onView:(UIView *)view{
    [self showStateHud:message state:state afterDelay:YWShowTime onView:view];
}

+ (void)showStateHud:(NSString *)message state:(HUDStateType)state  afterDelay:(NSTimeInterval)delay onView:(UIView *)view{
    [self showStateHud:message state:state imgName:nil afterDelay:delay onView:view];
}

+ (void)showStateHud:(NSString *)message state:(HUDStateType)state afterDelay:(NSTimeInterval)delay{
    [self showStateHud:message state:state imgName:nil afterDelay:delay];
}

+ (void)showStateHud:(NSString *)message state:(HUDStateType)state imgName:(NSString *)imgName afterDelay:(NSTimeInterval)delay{
    [self showStateHud:message state:state imgName:imgName afterDelay:delay onView:nil];
}

+ (void)showStateHud:(NSString *)message state:(HUDStateType)state imgName:(NSString *)imgName afterDelay:(NSTimeInterval)delay onView:(UIView *)view{
    [self showStateHud:message state:state imgName:imgName afterDelay:delay onView:view completionBlock:nil];
}

+ (void)showStateHud:(NSString *)message state:(HUDStateType)state imgName:(NSString *)imgName afterDelay:(NSTimeInterval)delay onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock{
    NSString *title;
    NSString *imgString;
    switch (state) {
        case HUDStateTypeSuccess:
            title = message ? message:YWSuccessMessage;
            imgString = imgName?imgName:YWSuccessImgName;
            break;
         case HUDStateTypeFail:
            title = message ? message:YWFailMessage;
            imgString = imgName?imgName:YWFailImgName;
            break;
        case HUDStateTypeWarning:
            title = message ? message:YWWarningMessage;
            imgString = imgName?imgName:YWWarningImgName;
            break;
        default:
            break;
    }
    UIImageView *successImgView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:imgString]];
    [self showHud:title customImgView:successImgView Mode:MBProgressHUDModeCustomView isShowMaskView:NO afterDelay:delay onView:view completionBlock:completionBlock];
}

#pragma mark - 显示文字
+(void)showTextHud:(NSString *)message{
    [self showTextHud:message afterDelay:YWShowTime];
}

+(void)showTextHud:(NSString *)message  onView:(UIView *)view{
    [self showTextHud:message afterDelay:YWShowTime onView:view];
}

+(void)showTextHud:(NSString *)message afterDelay:(NSTimeInterval)delay{
    [self showTextHud:message afterDelay:delay onView:nil];
}

+(void)showTextHud:(NSString *)message afterDelay:(NSTimeInterval)delay onView:(UIView *)view{
    [self showTextHud:message afterDelay:delay onView:view completionBlock:nil];
}

+(void)showTextHud:(NSString *)message afterDelay:(NSTimeInterval)delay onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock{
     [self showHud:message customImgView:nil Mode:MBProgressHUDModeText isShowMaskView:NO afterDelay:delay onView:view completionBlock:completionBlock];
}

#pragma mark - 自定义视图显示

+ (void)showHudCustomView:(UIView *)customView{
    [self showHudCustomView:customView onView:nil];
}

+ (void)showHudCustomView:(UIView *)customView  onView:(UIView *)view{
    [self showHudCustomView:customView isShowMaskView:NO onView:view];
}

+ (void)showHudCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView  onView:(UIView *)view{
    [self showHudCustomView:customView isShowMaskView:isShowMaskView afterDelay:YWShowTime onView:view];
}

+ (void)showHudCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay{
    [self showHudCustomView:customView isShowMaskView:isShowMaskView afterDelay:delay onView:nil];
}

+ (void)showHudCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay onView:(UIView *)view{
     [self showHud:nil customView:customView isShowMaskView:isShowMaskView afterDelay:delay onView:view completionBlock:nil];
}

+ (void)showHud:(NSString *)message customView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock{
    [self showHud:message customImgView:customView Mode:MBProgressHUDModeCustomView isShowMaskView:isShowMaskView afterDelay:delay onView:view completionBlock:completionBlock];
}

+ (void)showHud:(NSString *)message customImgView:(UIView *)customImgView Mode:(MBProgressHUDMode)mode isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock{
    if (view == nil) view = KeyWindow;
    //预想中一个视图上不应该出现两个以上的提示，因此调用一下隐藏方法
    [MBProgressHUD hideHUDForView:view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = mode;
    if (mode == MBProgressHUDModeCustomView) {
         hud.customView  = customImgView;
    }
    //hud.mode = MBProgressHUDModeCustomView;
   
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    
    hud.label.text = message;
    hud.label.textColor = [UIColor whiteColor];
    //如果只想显示一行，后面的用。。。显示，可以注释这一行
    hud.label.numberOfLines = 0;
    
    //detailsLabel和上面的lable差不多，如果想用detailsLabel可以上面设置lable的注释
    //    hud.detailsLabel.text = message;
    //    hud.detailsLabel.textColor = [UIColor whiteColor];
    //    hud.detailsLabel.font = [UIFont boldSystemFontOfSize:17];
    
    
    hud.contentColor = [UIColor whiteColor];
    hud.completionBlock = completionBlock;
    if (isShowMaskView) {
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.backgroundView.color = [UIColor colorWithWhite:YWWhite alpha:YWAlpha];
    }
    // 隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // delay秒后隐藏
    [hud hideAnimated:YES afterDelay:delay>0?delay:YWShowTime];
}

//#pragma mark - 自定义视图和按钮


+ (void)showHud:(NSString *)message customImgView:(UIView *)customImgView btnTitle:(NSString *)btnTitle btnFont:(UIFont *)font btnTitleColor:(UIColor *)titleColor btnBackColor:(UIColor *)backColor Target:(nullable id)target action:(SEL)action isShowMaskView:(BOOL)isShowMaskView  isHide:(BOOL)isHide onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock{
    
    [self showHud:message customImgView:customImgView btnTitle:btnTitle btnFont:font btnTitleColor:titleColor btnBackColor:backColor Target:target action:action isShowMaskView:isShowMaskView afterDelay:YWShowTime isHide:isHide onView:view completionBlock:completionBlock];
}

+ (void)showHud:(NSString *)message customImgView:(UIView *)customImgView btnTitle:(NSString *)btnTitle btnFont:(UIFont *)font btnTitleColor:(UIColor *)titleColor btnBackColor:(UIColor *)backColor Target:(nullable id)target action:(SEL)action isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay isHide:(BOOL)isHide onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock{
    if (view == nil) view = KeyWindow;
    //预想中一个视图上不应该出现两个以上的提示，因此调用一下隐藏方法
    [MBProgressHUD hideHUDForView:view animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (customImgView) {
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView  = customImgView;
    }
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    
    hud.label.text = message;
    hud.label.textColor = [UIColor whiteColor];
    hud.contentColor = [UIColor whiteColor];
    hud.completionBlock = completionBlock;
    if (btnTitle) {
        [hud.button setTitle:btnTitle forState:UIControlStateNormal];
    }
    if (titleColor) {
        [hud.button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (backColor) {
        [hud.button setBackgroundColor:backColor];
    }
    if (target) {
        [hud.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (font) {
        hud.button.titleLabel.font = font;
    }
    if (isShowMaskView) {
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.backgroundView.color = [UIColor colorWithWhite:YWWhite alpha:YWAlpha];
    }
    // 隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // delay秒后隐藏
    if (isHide) {
        [hud hideAnimated:YES afterDelay:delay>0?delay:YWShowTime];
    }
    
}

+ (void)hidenHudFromView:(UIView *)view{
    if (view == nil) view = KeyWindow;
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)hidenHud{
    
    [self hidenHudFromView:nil];
}

@end
