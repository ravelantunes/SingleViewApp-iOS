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
    
    //Initialize SingleView and put it inside the scrollview
    self.singleView = [SingleView view];
    [self.scrollView addSubview:self.singleView];
    self.scrollView.contentSize = self.singleView.frame.size;
    self.scrollView.delegate = self;
    self.scrollView.frame = self.view.bounds;
    
    //Blur the background image
    UIImage *blurImage = [UIImage imageNamed:@"Frozen-frozen-35894990-1080-1920.jpg"];
    blurImage = [blurImage applyBlurWithRadius:10 tintColor:[UIColor clearColor] saturationDeltaFactor:0.7 maskImage:nil];
    
    //Set the blur image to the imageview and hide it
    self.blurBackground.image = blurImage;
    self.blurBackground.alpha = 0;

    
}

- (void)viewDidAppear:(BOOL)animated{
    
    //Calculates the size differente between the screen and the backgroudn imageview
    sizeDifference = self.view.frame.size.height - self.blurBackground.frame.size.height;
    sizeDifference *= -1;
    
    //Calculates the max ofset posible for y
    maxOffset = self.scrollView.contentSize.height - self.scrollView.frame.size.height;

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //Gets the current view offset
    int y = self.scrollView.contentOffset.y;
    
    //Calculates the percentage that it should be moved
    float percentage = (maxOffset-y)/maxOffset;
    
    //Calculate the target y offset that the view should be
    float offset = (sizeDifference * percentage);
    
    //Make sure you don't go beyond the imageview size
    if (offset < 0) {
        offset = 0;
    } else if (offset > sizeDifference) {
        offset = sizeDifference;
    }
    
    //Set the y to the image views
    self.blurBackground.frame = CGRectMake(0, -sizeDifference+offset, 360, self.blurBackground.frame.size.height);
    self.backgroundImage.frame = CGRectMake(0, -sizeDifference+offset, 360, self.blurBackground.frame.size.height);

    
    //Set the alpha of the blur to appear exponetially
    float alpha = (float)y/400;
    self.blurBackground.alpha = alpha;
    
}

@end
