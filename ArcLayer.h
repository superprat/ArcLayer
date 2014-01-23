//
//  ArcLayer.h
//  Fletter
//
//  Created by Prateek Gupte on 22/01/14.
//  Copyright (c) 2014 Code Red Solutions. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface ArcLayer : CALayer

@property (nonatomic) CGFloat startAngle;
@property (nonatomic) CGFloat endAngle;

@property (nonatomic) CGFloat strokeWidth;
@property (nonatomic, strong) UIColor *strokeColor;

@end
