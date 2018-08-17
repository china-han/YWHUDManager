//
//  ViewController.m
//  YWHUDManager
//
//  Created by hyw on 2018/8/14.
//  Copyright © 2018年 bksx. All rights reserved.
//

#import "ViewController.h"
#import "HUDManager.h"
@interface YWExample : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL selector;

@end


@implementation YWExample

+ (instancetype)exampleWithTitle:(NSString *)title selector:(SEL)selector {
    YWExample *example = [[self class] new];
    example.title = title;
    example.selector = selector;
    return example;
}

@end

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray<NSArray<YWExample *> *> *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [HUDManager setYWAlpha:0.5];
    [HUDManager setYWSuccessMessage:@"自定义成功文字"];
    self.dataArray = @[@[[YWExample exampleWithTitle:@"不指定视图显示加载和文字" selector:@selector(showLoading)],
                         [YWExample exampleWithTitle:@"指定视图显示加载和文字" selector:@selector(showLoadingOnView)],
                         [YWExample exampleWithTitle:@"不指定视图显示加载.文字.block回调" selector:@selector(showLoadingAndCompletionBlock)],
                         [YWExample exampleWithTitle:@"指定视图显示加载.文字.block回调" selector:@selector(showLoadingAndCompletionBlockOnView)],
                         ],
                       @[[YWExample exampleWithTitle:@"加载成功" selector:@selector(showSuccess)],
                         [YWExample exampleWithTitle:@"加载成功指定视图" selector:@selector(showSuccessView)],
                         [YWExample exampleWithTitle:@"加载成功指定时间视图" selector:@selector(showSuccessTimeView)],
                         [YWExample exampleWithTitle:@"加载成功指定时间" selector:@selector(showSuccessTime)],
                         [YWExample exampleWithTitle:@"加载成功指定时间图片" selector:@selector(showSuccessTimeImgName)],
                         [YWExample exampleWithTitle:@"加载成功指定时间图片视图" selector:@selector(showSuccessTimeImgNameView)],
                         [YWExample exampleWithTitle:@"加载成功指定时间图片视图回调" selector:@selector(showSuccessTimeImgNameViewBlock)],
                         ],
                       @[[YWExample exampleWithTitle:@"加载失败" selector:@selector(showFail)],
                         [YWExample exampleWithTitle:@"加载失败指定视图" selector:@selector(showFailView)],
                         [YWExample exampleWithTitle:@"加载失败指定时间视图" selector:@selector(showFailTimeView)],
                         [YWExample exampleWithTitle:@"加载失败指定时间" selector:@selector(showFailTime)],
                         [YWExample exampleWithTitle:@"加载失败指定时间图片" selector:@selector(showFailTimeImgName)],
                         [YWExample exampleWithTitle:@"加载失败指定时间图片视图" selector:@selector(showFailTimeImgNameView)],
                         [YWExample exampleWithTitle:@"加载失败指定时间图片视图回调" selector:@selector(showFailTimeImgNameViewBlock)],
                         ],
                       @[[YWExample exampleWithTitle:@"加载警告" selector:@selector(showWarning)],
                         [YWExample exampleWithTitle:@"加载警告指定视图" selector:@selector(showWarningView)],
                         [YWExample exampleWithTitle:@"加载警告指定时间视图" selector:@selector(showWarningTimeView)],
                         [YWExample exampleWithTitle:@"加载警告指定时间" selector:@selector(showWarningTime)],
                         [YWExample exampleWithTitle:@"加载警告指定时间图片" selector:@selector(showWarningTimeImgName)],
                         [YWExample exampleWithTitle:@"加载警告指定时间图片视图" selector:@selector(showWarningTimeImgNameView)],
                         [YWExample exampleWithTitle:@"加载警告指定时间图片视图回调" selector:@selector(showWarningTimeImgNameViewBlock)],
                         ],
                       @[[YWExample exampleWithTitle:@"加载文字" selector:@selector(showText)],
                         [YWExample exampleWithTitle:@"加载文字指定时间" selector:@selector(showTextTime)],
                         [YWExample exampleWithTitle:@"加载文字指定视图" selector:@selector(showTextView)],
                         [YWExample exampleWithTitle:@"加载文字指定时间视图" selector:@selector(showTextTimeView)],
                         [YWExample exampleWithTitle:@"加载文字指定时间视图回调" selector:@selector(showTextTimeViewBlock)],
                        ],
                       @[[YWExample exampleWithTitle:@"自定义视图" selector:@selector(showCustomView)],
                         [YWExample exampleWithTitle:@"自定义视图指定视图" selector:@selector(showCustomViewToView)],
                         [YWExample exampleWithTitle:@"自定义视图指定视图遮罩" selector:@selector(showCustomViewMaskViewToView)],
                         [YWExample exampleWithTitle:@"自定义视图指定时间遮罩" selector:@selector(showCustomViewMaskViewTime)],
                         [YWExample exampleWithTitle:@"自定义视图指定时间视图遮罩" selector:@selector(showCustomViewMaskViewTimeToView)],
                         [YWExample exampleWithTitle:@"自定义视图指定时间视图遮罩文字回调" selector:@selector(showCustomViewMaskViewTimeViewTextBlock)],
                         ],
                       @[ [YWExample exampleWithTitle:@"自定义带按钮的视图自定义时间" selector:@selector(showBtnHud)],
                          [YWExample exampleWithTitle:@"自定义带按钮的视图" selector:@selector(showBtnHudTime)],
                           ]
                       ];
    [self.view addSubview:self.tableView];
    
}

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

#pragma mark - 成功显示
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

#pragma mark - 失败显示
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

#pragma mark - 警告警告
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

#pragma mark - 文字
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
#pragma mark - 显示自定义视图
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

#pragma mark - 显示自定义按钮视图
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

#pragma mark - 隐藏
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
#pragma tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentify" forIndexPath:indexPath];
     YWExample *example = self.dataArray[indexPath.section][indexPath.row];
     cell.textLabel.text = example.title;
//     cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *titleLable = [[UILabel alloc]init];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont systemFontOfSize:16];
    titleLable.textColor = [UIColor blueColor];
    if (section == 0) {
        titleLable.text = @"加载展示";
    }else if (section == 1){
        titleLable.text = @"成功展示";
    }else if (section == 2){
        titleLable.text = @"失败展示";
    }else if (section == 3){
        titleLable.text = @"警告展示";
    }else if (section == 4){
        titleLable.text = @"文字展示";
    }else if (section == 5){
        titleLable.text = @"自定义视图展示";
    } if (section == 6){
        titleLable.text = @"自定义带按钮视图展示";
    }
    
    
    return titleLable;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YWExample *example = self.dataArray[indexPath.section][indexPath.row];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:example.selector];
#pragma clang diagnostic pop
}

#pragma mark - lazy loading
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //避免出现iOS11下拉刷新偏移
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedRowHeight = 0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentify"];
        //去除多余cell的显示
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        //去除分割线
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


@end
