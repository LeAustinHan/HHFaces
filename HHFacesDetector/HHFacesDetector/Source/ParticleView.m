//
//  ParticleView.m
//  HHFacesDetector
//
//  Created by LeAustinHan on 14-12-31.
//  Copyright (c) 2014年 han. All rights reserved.
//

#import "ParticleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ParticleView

-(void)awakeFromNib
{
    //set ref to the layer
    _fireEmitter = (CAEmitterLayer*)self.layer; //2
    _fireEmitter.emitterPosition = CGPointMake(5, 5);
    _fireEmitter.emitterSize = CGSizeMake(20, 20);
    
    
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    fire.birthRate = 15;//粒子增殖速率
    fire.lifetime = 5.0;//例子生命时长
    fire.lifetimeRange = 2;//粒子生命时长范围
    fire.color = [[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]
                  CGColor];
    fire.contents = (id)[[UIImage imageNamed:@"Particles_fire.png"] CGImage];
    
    fire.velocity = 150;
    fire.velocityRange = 10;
    fire.scaleSpeed = 0.05;
    fire.spin = 0.1;
    fire.emissionRange = M_PI_2*2;
    [fire setName:@"fire"];
    
    //add the cell to the layer and we're done
    _fireEmitter.emitterCells = [NSArray arrayWithObject:fire];
}

+ (Class) layerClass //3
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}

@end
