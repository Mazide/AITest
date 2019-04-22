//
//  TakePhotoButton.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "TakePhotoButton.h"

@interface TakePhotoButton()

@property (weak, nonatomic) UIView *circleView;

@end

@implementation TakePhotoButton

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = UIColor.clearColor;
    
    CGFloat circleSide = self.frame.size.width - 5;
    UIView * circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, circleSide, circleSide)];
    circleView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    circleView.backgroundColor = UIColor.whiteColor;
    circleView.layer.cornerRadius = circleSide/2;
    circleView.userInteractionEnabled = NO;
    [self addSubview:circleView];
    self.circleView = circleView;
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = self.frame.size.height/2;
}

-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.circleView.backgroundColor = UIColor.grayColor;
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    self.circleView.backgroundColor = UIColor.grayColor;
}

@end
