//
//  ArcLayer.m
//  Fletter
//
//  Created by Prateek Gupte on 22/01/14.
//  Copyright (c) 2014 Code Red Solutions. All rights reserved.
//

#import "ArcLayer.h"


@implementation ArcLayer

@synthesize startAngle = _startAngle, endAngle = _endAngle;
@synthesize strokeColor,strokeWidth;

-(void)setStartAngle:(CGFloat)startAngle
{
    if (_startAngle != startAngle) {
        _startAngle = startAngle;
        [self drawArc];
    }

}

-(void)setEndAngle:(CGFloat)endAngle
{   
    if(_endAngle != endAngle) {
        _endAngle = endAngle;
        [self drawArc];
    }
}

-(void)drawArc
{

    // Set up the shape of the circle
    int radius = self.frame.size.width/2;
    CAShapeLayer *circle = [CAShapeLayer layer];
    
    
    // Make a circular shape

    circle.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:self.startAngle endAngle:self.endAngle clockwise:YES].CGPath;
    
    
    // Center the shape in self.view
    circle.position = CGPointMake(0,0);
    
    // Configure the apperence of the circle
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = self.strokeColor.CGColor;
    circle.lineWidth = self.strokeWidth;
    
    // Add to parent layer
    [self addSublayer:circle];
    
    // Configure animation
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration            = 0.5; // "animate over 10 seconds or so.."
    drawAnimation.repeatCount         = 1.0;  // Animate only once..
    drawAnimation.removedOnCompletion = NO;   // Remain stroked after the animation..
    
    // Animate from no part of the stroke being drawn to the entire stroke being drawn
    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    
    // Experiment with timing to get the appearence to look the way you want
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    // Add the animation to the circle
    [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];

}


@end
