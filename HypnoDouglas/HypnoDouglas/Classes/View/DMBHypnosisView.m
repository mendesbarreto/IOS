//
//  DMBHypnosisView.m
//  Hypnosister
//
//  Created by Douglas Barreto on 1/5/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DMBHypnosisView.h"

@interface DMBHypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation DMBHypnosisView


-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor blackColor];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
    }
    
    return self;
}

-(void)onTick:(NSTimer *)timer {
    [self changeStrokeColorFromCircle];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + (bounds.size.width * 0.5);
    center.y = bounds.origin.y + (bounds.size.height * 0.5);
    
    //float radius = ( MIN(bounds.size.width, bounds.size.height  )* 0.5 );
    float c = M_PI * 2;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for( float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20 )
    {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0 endAngle:c
                     clockwise:YES];
    }
    
    //    
    //
    //    [path addArcWithCenter:center radius:radius startAngle:0 endAngle:c clockwise:YES];
    //    [[UIColor lightGrayColor] setStroke];
    //    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
    //    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    [self changeStrokeColorFromCircle];
}


-(void)changeStrokeColorFromCircle
{
    // Get 3 random numbers between 0 and 1
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    self.circleColor = randomColor;
}

-(void) setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
