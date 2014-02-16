//
//  ViewController.m
//  SingleViewAppTest
//
//  Created by Ravel Antunes on 1/26/14.
//  Copyright (c) 2014 Ravel Antunes. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController (){
    int sizeDifference;
    float maxOffset;
}
@property (strong, nonatomic) SingleView *singleView;



@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated {
        
    //Set the amount of play we will have horizontally
    CGFloat offset = 50.0f;
    
    
    //Horizontal motion effect
    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    horizontalEffect.minimumRelativeValue = @(-offset);
    horizontalEffect.maximumRelativeValue = @(offset);
    
    
    
    //Vertical motion effect
    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    verticalEffect.minimumRelativeValue = @(-offset);
    verticalEffect.maximumRelativeValue = @(offset);
    
    
    UIMotionEffectGroup *effectGroup = [[UIMotionEffectGroup alloc] init];
    effectGroup.motionEffects = @[horizontalEffect, verticalEffect];
    
    
    [self.backgroundImage addMotionEffect:effectGroup];
    [self.blurBackground addMotionEffect:effectGroup];
}

@end
