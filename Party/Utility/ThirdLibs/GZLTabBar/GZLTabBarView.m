//
//  GZLTabBarView.m
//  Party
//
//  Created by qianfeng on 15/9/19.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "GZLTabBarView.h"
#import "GZLTabBarViewController.h"


@interface GZLTabBarView() <UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate> {

    GZLTabBarButton *_selectedBarButton;
}


@property (nonatomic, strong) UIViewController *centerViewController;

@end

@implementation GZLTabBarView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self addBarButtons];
    }
    return self;
}

- (void)addBarButtons {

    for (NSInteger i = 0; i < 5; i ++) {
        GZLTabBarButton *button = [[GZLTabBarButton alloc] init];
        
        CGFloat btnW = self.frame.size.width/5;
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        CGFloat btnH = self.frame.size.height;
        
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        NSString *imageName = [NSString stringWithFormat:nil];
        NSString *selImageName = [NSString stringWithFormat:nil];
        
        NSString *title = @"";
        
        if (i == 0) {
            title = @"附近";
        } else if (i == 1) {
            title = @"活动";
        } else if (i == 2) {
            imageName = @"";
            selImageName = @"";
        } else if (i == 3) {
            title = @"消息";
        } else if (i == 4) {
            title = @"我";
        }
        //内容缩放以适应 剩下的是透明的
        button.imageView.contentMode = UIViewContentModeCenter;
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        //内容缩放以适应 剩下的是透明的
        button.imageView.contentMode = UIViewContentModeCenter;
        
        button.tag = i;
        
        if (i != 2) {
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:11.0];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
//            [button setTitleColor:RGB(29, 173, 248) forState:UIControlStateSelected];
//            [button setTitleColor:RGB(128, 128, 128) forState:UIControlStateNormal];
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:button];
        }
        
        if (i == 0) {
            [self btnClick:button];
        }
    }
}

- (void)btnClick:(UIButton *)button {

    if (button.tag != 2) {
        [self.delegate changeNav:_selectedBarButton.tag to:button.tag];
        _selectedBarButton.selected = NO;
        button.selected = YES;
        _selectedBarButton = (GZLTabBarButton *)button;
    } else {
    
//        NSLog(@"........");
//        
//        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"发布活动",nil];
//        [sheet showInView:[UIApplication sharedApplication].keyWindow];
        [self.delegate changeNav:_selectedBarButton.tag to:button.tag];
        _selectedBarButton.selected = NO;
        button.selected = YES;
        _selectedBarButton = (GZLTabBarButton *)button;
 
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex != 2) {
    
        GZLTabBarViewController *tabBarVC = (GZLTabBarViewController *)[[UIApplication sharedApplication].delegate window].rootViewController;
        
        UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
        
        if ([UIImagePickerController isSourceTypeAvailable:type]) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                type = UIImagePickerControllerSourceTypeCamera;
            }
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.allowsEditing = NO;
            picker.delegate = self;
            picker.sourceType = type;
            
            [tabBarVC.selectedViewController.childViewControllers.lastObject presentViewController:picker animated:YES completion:^{
            
            }];
        }
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

//    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

































@end
