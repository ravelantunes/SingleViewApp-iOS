//
//  ViewController.h
//  SingleViewAppTest
//
//  Created by Ravel Antunes on 1/26/14.
//  Copyright (c) 2014 Ravel Antunes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingleView.h"

@interface ViewController : UIViewController
<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *blurBackground;

@end
