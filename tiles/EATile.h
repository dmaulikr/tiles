//
//  EATile.h
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EATile;
@protocol EATileDelegate <NSObject>

- (void)didTapGameTile:(EATile *)tile;
- (void)gameStarted;

@end

@interface EATile : UIView

@property (nonatomic) BOOL isGameTile;
@property (nonatomic) NSInteger tileNumber;
@property (nonatomic, retain) UILabel *numberLabel;

@property (nonatomic, weak) id <EATileDelegate> delegate;

- (void)setActiveCardWithNumber:(NSInteger)cardNumber;
- (void)triggerLost;

@end
