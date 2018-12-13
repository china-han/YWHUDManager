//
//  HUDManager.h
//  YWHUDManager
//
//  Created by hyw on 2018/8/14.
//  Copyright © 2018年 bksx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

typedef NS_ENUM(NSInteger,HUDStateType) {   //显示状态类型
    HUDStateTypeSuccess,             //显示为成功状态
    HUDStateTypeFail,                //显示为失败状态
    HUDStateTypeWarning,             //显示为警告状态
};
@interface HUDManager : NSObject

#pragma mark - 属性设置

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

#pragma mark - 加载显示
/**
 弹出 菊花 HUD （文字）文字默认为loading...
 */
+ (void)showLoading;

/**
 弹出 菊花 HUD （文字）
 
 @param message          文字，如果传nil，默认为loading...,如果不用可以直接修改
 */
+ (void)showLoadingHud:(NSString *)message;

/**
 弹出 菊花 HUD （文字，回调）
 
 @param message          文字，如果传nil，默认为loading...,如果不用可以直接修改
 @param view             显示在那个view上
 */
+ (void)showLoadingHud:(NSString *)message onView:(UIView *)view;

/**
 弹出 菊花 HUD （文字，父视图view，回调）
 
 @param message           文字，如果传nil，默认为加载中...,如果不用可以直接修改
 @param view              要显示在那个view上
 @param completionBlock   回调
 */
+ (void)showLoadingHud:(NSString *)message onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;


#pragma mark - 显示状态
/**
 显示状态（成功，失败，警告）
  (文字）
 
 @param message           文字，如果传nil，默认为加载成功,如果不用可以直接修改 , 默认1.5秒隐藏
 */
+ (void)showStateHud:(NSString *)message state:(HUDStateType)state;

/**
 显示状态（成功，失败，警告）
  (文字，父视图view）
 
 @param message           文字，如果传nil，默认为加载成功,如果不用可以直接修改 默认1.5秒隐藏
 @param view              要显示在那个view上
 */
+ (void)showStateHud:(NSString *)message state:(HUDStateType)state  onView:(UIView *)view;

/**
 显示状态（成功，失败，警告）
 (文字，显示时间，父视图view）
 
 @param message           文字，如果传nil，默认为加载成功,如果不用可以直接修改
 @param delay             多久隐藏 默认1.5秒
 @param view              要显示在那个view上
 */
+ (void)showStateHud:(NSString *)message state:(HUDStateType)state  afterDelay:(NSTimeInterval)delay onView:(UIView *)view;

/**
 显示状态（成功，失败，警告）
 (文字，显示时间）
 
 @param message           文字，如果传nil，默认为加载成功,如果不用可以直接修改
 @param delay             多久隐藏 默认1.5秒
 */
+ (void)showStateHud:(NSString *)message state:(HUDStateType)state afterDelay:(NSTimeInterval)delay;

/**
 显示状态（成功，失败，警告）
 (文字，图片名称，显示时间）
 
 @param message           文字，如果传nil，默认为加载成功,如果不用可以直接修改
 @param imgName           图片名称
 @param delay             多久隐藏 默认1.5秒
 */
+ (void)showStateHud:(NSString *)message state:(HUDStateType)state imgName:(NSString *)imgName afterDelay:(NSTimeInterval)delay;

/**
 显示状态（成功，失败，警告）
 (文字，图片名称，显示时间，父视图view）
 
 @param message           文字，如果传nil，默认为加载成功,如果不用可以直接修改
 @param imgName           图片名称
 @param delay             多久隐藏 默认1.5秒
 @param view              要显示在那个view上
 */
+ (void)showStateHud:(NSString *)message state:(HUDStateType)state imgName:(NSString *)imgName afterDelay:(NSTimeInterval)delay onView:(UIView *)view;

/**
 显示状态（成功，失败，警告）
 (文字，图片名称，显示时间，父视图view，回调）
 
 @param message           文字，如果传nil，默认为加载成功,如果不用可以直接修改
 @param imgName           图片名称
 @param delay             多久隐藏 默认1.5秒
 @param view              要显示在那个view上
 @param completionBlock   回调
 */
+ (void)showStateHud:(NSString *)message state:(HUDStateType)state imgName:(NSString *)imgName afterDelay:(NSTimeInterval)delay onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

#pragma mark - 显示文字
/**
 显示文字 (文字）
 
 @param message           文字 默认1.5秒隐藏
 */
+(void)showTextHud:(NSString *)message;

/**
 显示文字 (文字，父视图view）
 
 @param message           文字
 @param view              要显示在那个view上
 */
+(void)showTextHud:(NSString *)message  onView:(UIView *)view;

/**
 显示文字 (文字，显示时间）
 
 @param message           文字
 @param delay             多久隐藏 默认1.5秒
 */
+(void)showTextHud:(NSString *)message afterDelay:(NSTimeInterval)delay;

/**
 显示文字 (文字，显示时间，父视图view）
 
 @param message           文字
 @param delay             多久隐藏 默认1.5秒
 @param view              要显示在那个view上
 */
+(void)showTextHud:(NSString *)message afterDelay:(NSTimeInterval)delay onView:(UIView *)view;

/**
 显示文字 (文字，显示时间，父视图view，回调）
 
 @param message            文字
 @param delay              多久隐藏 默认1.5秒
 @param view               要显示在那个view上
 @param completionBlock    回调
 */
+(void)showTextHud:(NSString *)message afterDelay:(NSTimeInterval)delay onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

#pragma mark - 自定义视图显示

/**
 自定义视图显示 (父视图view）
 
 @param customView         自定义视图 默认1.5秒
 */
+ (void)showHudCustomView:(UIView *)customView;

/**
 自定义视图显示 (自定义视图，父视图view）
 
 @param customView         自定义视图 默认1.5秒
 @param view               要显示在那个view上
 */
+ (void)showHudCustomView:(UIView *)customView  onView:(UIView *)view;

/**
 自定义视图显示 (遮罩，自定义视图，父视图view）
 
 @param customView         自定义视图 默认1.5秒
 @param isShowMaskView     是否显示遮罩
 @param view               要显示在那个view上
 */
+ (void)showHudCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView  onView:(UIView *)view;

/**
 自定义视图显示 (遮罩，自定义视图，显示时间）
 
 @param customView         自定义视图
 @param isShowMaskView     是否显示遮罩
 @param delay              多久隐藏 默认1.5秒
 */
+ (void)showHudCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay;

/**
 自定义视图显示 (遮罩，自定义视图，显示时间，父视图view）
 
 @param customView         自定义视图
 @param isShowMaskView     是否显示遮罩
 @param delay              多久隐藏 默认1.5秒
 @param view               要显示在那个view上
 */
+ (void)showHudCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay onView:(UIView *)view;

/**
 自定义视图显示（显示文字，遮罩，自定义视图，显示时间，父视图view，回调）
 
 @param message            要显示的文字
 @param customView         自定义视图
 @param isShowMaskView     是否显示遮罩
 @param delay              多久隐藏 默认1.5秒
 @param view               要显示在那个view上
 @param completionBlock    回调
 */
+ (void)showHud:(NSString *)message customView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

#pragma mark - 自定义带确定按钮提示框

//因为这个需求不多，所以不再细分，感兴趣的可以使用的时候自己进行细分

/**
 自定义带确定按钮提示框 (默认显示时间）
 
 @param message         要显示的文字
 @param customImgView   自定义视图
 @param btnTitle        按钮文字
 @param font            按钮文字大小写
 @param titleColor      按钮文字颜色
 @param backColor       按钮背景颜色
 @param target          按钮target
 @param action          按钮action
 @param isShowMaskView  是否显示遮罩
 @param isHide          是否自动隐藏
 @param view            要显示在那个view上
 @param completionBlock 回调
 */
+ (void)showHud:(NSString *)message customImgView:(UIView *)customImgView btnTitle:(NSString *)btnTitle btnFont:(UIFont *)font btnTitleColor:(UIColor *)titleColor btnBackColor:(UIColor *)backColor Target:(nullable id)target action:(SEL)action isShowMaskView:(BOOL)isShowMaskView  isHide:(BOOL)isHide onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

/**
 自定义带确定按钮提示框 (自定义显示时间）
 
 @param message         要显示的文字
 @param customImgView   自定义视图
 @param btnTitle        按钮文字
 @param font            按钮文字大小写
 @param titleColor      按钮文字颜色
 @param backColor       按钮背景颜色
 @param target          按钮target
 @param action          按钮action
 @param isShowMaskView  是否显示遮罩
 @param delay           多久隐藏isHide为yes下生效
 @param isHide          是否自动隐藏
 @param view            要显示在那个view上
 @param completionBlock 回调
 */
+ (void)showHud:(NSString *)message customImgView:(UIView *)customImgView btnTitle:(NSString *)btnTitle btnFont:(UIFont *)font btnTitleColor:(UIColor *)titleColor btnBackColor:(UIColor *)backColor Target:(nullable id)target action:(SEL)action isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay isHide:(BOOL)isHide onView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;
#pragma mark - 隐藏

/**
 移除自定视图 HUD
 
 @param view 视图
 */
+ (void)hidenHudFromView:(UIView *)view;

/**
 移除 HUD
 */
+ (void)hidenHud;

@end
