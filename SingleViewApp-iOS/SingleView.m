//
//  SingleView.m
//  SingleViewAppTest
//
//  Created by Ravel Antunes on 1/26/14.
//  Copyright (c) 2014 Ravel Antunes. All rights reserved.
//

#import "SingleView.h"

@implementation SingleView


+ (instancetype)view{
    
    SingleView *singleView = [[[NSBundle mainBundle] loadNibNamed:@"SingleView" owner:nil options:nil] objectAtIndex:0];
    
    return singleView;
    
}


@end
