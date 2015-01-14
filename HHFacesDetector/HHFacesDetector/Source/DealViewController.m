//
//  DealViewController.m
//  HHFacesDetector
//
//  Created by LeAustinHan on 14-12-26.
//  Copyright (c) 2014年 han. All rights reserved.
//

#import "DealViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DealViewController ()
{
    CAEmitterLayer* _fireEmitter; //1
}

@end

@implementation DealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];

    [self reloadVidew];
}

- (void)reloadVidew{
    _bgAllImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drama_all.jpg"]];
    _bgFaceLessImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drama_face_less.png"]];
    _bgFaceLessImgView.backgroundColor = [UIColor clearColor];
    _faceImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drama_face_part.png"]];
    _faceImgView.backgroundColor = [UIColor whiteColor];
    
    
    self.bgView.frame= CGRectMake(0,124, 320, 448);
    
    _bgFaceLessImgView.frame = CGRectMake(0, 0, 320, 448);
    [self.bgView addSubview:_bgFaceLessImgView];
    _bgAllImgView.frame= CGRectMake(0, 0, 320, 448);
    [self.bgView addSubview:_bgAllImgView];
    
    [self scaleBgAllImgView];
}

- (void)scaleBgAllImgView{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:2.48];
    //在出动画的时候减缓速度
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //添加动画开始及结束的代理
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationWillStartSelector:@selector(beginDissmissViewAnimation)];
    
    _bgAllImgView.frame= CGRectMake(-320/2,20-448*1.1/2, 320*2, 448*2);
    _bgFaceLessImgView.frame = CGRectMake(-27-320/2,-14-448*1.1/2, 320*2.2, 448*2.2);
    _faceImgView.frame = CGRectMake(0,45, 320, 400);
    
    
    [UIView setAnimationDidStopSelector:@selector(endDissmissViewAnimation)];
    //动画效果
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:_bgAllImgView cache:YES];
    
    [UIView commitAnimations];

}

- (void)beginViewAnimation{
}

- (void)endDissmissViewAnimation{
    [self.bgView addSubview:_faceImgView];
//
    [_bgAllImgView removeFromSuperview];
    
    //add the cell to the layer and we're done
    _pView.frame = CGRectMake(320/2, 500, 2, 2);
    [self.bgView addSubview:_pView];
    [_pView bringSubviewToFront:_faceImgView];
    
    [self resetPhotoCamera];

    [self particleAnimation];
}

- (void)resetPhotoCamera{
    return;
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
    //        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //    }
    //sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    //sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
    //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    [self.bgView insertSubview:picker.view belowSubview:_faceImgView];//进入照相界面

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
}


- (void)particleAnimation{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:2.48];
    //在出动画的时候减缓速度
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //添加动画开始及结束的代理
    [UIView setAnimationDelegate:self];
    
    
    CGRect rect = _pView.frame;
    rect.origin.y = -50;
    _pView.frame = rect;
    
    [UIView setAnimationDidStopSelector:@selector(endParticleDissmissViewAnimation)];
    //动画效果
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:_pView cache:YES];
    
    [UIView commitAnimations];
    
}


- (void)endParticleDissmissViewAnimation{
    [_pView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
