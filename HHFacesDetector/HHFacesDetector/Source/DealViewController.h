//
//  DealViewController.h
//  HHFacesDetector
//
//  Created by LeAustinHan on 14-12-26.
//  Copyright (c) 2014年 han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParticleView.h"

@interface DealViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView *_bgAllImgView;
    UIImageView *_bgFaceLessImgView;
    UIImageView *_faceImgView;
}
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet ParticleView *pView;

@end
