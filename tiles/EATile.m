//
//  EATile.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EATile.h"

@implementation EATile

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setBackgroundColor:[UIColor blackColor]];
        
        [[self layer] setBorderColor:[UIColor blackColor].CGColor];
        [[self layer] setBorderWidth:2];
        
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, ([self frame].size.height / 2) - 10, [self frame].size.width, 20)];
        [_numberLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:26]];
        [_numberLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_numberLabel];
        
    }
    
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_delegate didTapGameTile:self];
    
}

- (void)setActiveCardWithNumber:(NSInteger)cardNumber {

    [self setBackgroundColor:[UIColor whiteColor]];
    [_numberLabel setText:[NSString stringWithFormat:@"%ld", (long)cardNumber]];
    
    [self setIsGameTile:YES];
    [self setTileNumber:cardNumber];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setBackgroundColor:[UIColor blackColor]];
        [_delegate gameStarted];
    });
}

- (void)triggerLost {
    
    [self setIsGameTile:NO];
    [self setTileNumber:0];
    [self setBackgroundColor:[UIColor whiteColor]];
}

@end
