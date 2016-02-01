//
//  EATileViewController.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EATileViewController.h"

@implementation EATileViewController

- (id)init {
    
    if ((self = [super init])) {
        
        [[self view] setBackgroundColor:[UIColor blackColor]];
        
        _currentlyActive = NO;
        
        _tileContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [[self view] frame].size.width, [[self view] frame].size.height - 200)];
        [_tileContainer setBackgroundColor:[UIColor whiteColor]];
        [[self view] addSubview:_tileContainer];
}
    
    return self;
}

- (void)layoutTilesOnContainer {
    
    if ([[_tileContainer subviews] count] > 0) {
        
        [[_tileContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    _gameTiles = [[NSMutableArray alloc] initWithCapacity:_numberOfY * _numberOfX];

    CGFloat borderWidth = 5;
    
    CGFloat yOrigin = borderWidth / 2;
    
    for (int yIndex = 0; yIndex < _numberOfY; yIndex++) {
        
        CGFloat xOrigin = borderWidth / 2;
        
        for (int xIndex = 0; xIndex < _numberOfX; xIndex++) {
            
            EATile *currentTile = [[EATile alloc] initWithFrame:CGRectMake(xOrigin, yOrigin, ([[self view] frame].size.width / _numberOfX) - borderWidth, (([[self view] frame].size.height - 200) / _numberOfY) - borderWidth)];
            [currentTile setDelegate:self];
            [_tileContainer addSubview:currentTile];
            
            [_gameTiles addObject:currentTile];
            
            xOrigin += ([[self view] frame].size.width / _numberOfX);
        }

        yOrigin += ([[self view] frame].size.height - 200) / _numberOfY;
    }
    
    for (int gameCardsChosen = 1; gameCardsChosen <= _numberOfGameTiles; gameCardsChosen++) {
        
        int randomIndex = arc4random() % [_gameTiles count];
        EATile *chosenCard = _gameTiles[randomIndex];
        [_gameTiles removeObjectAtIndex:randomIndex];
        
        [chosenCard setActiveCardWithNumber:gameCardsChosen];
        
    }
    
    _expectedNumber = 1;

}

- (void)gameStarted {
    
    _currentlyActive = YES;
}

- (void)didTapGameTile:(EATile *)tile {
    
    if (_currentlyActive) {
        
        if (![tile isGameTile] || [tile tileNumber] != _expectedNumber) {
            
            _currentlyActive = NO;
            [[_tileContainer subviews] makeObjectsPerformSelector:@selector(triggerLost)];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
            });

            return;
        }
        
        [tile setBackgroundColor:[UIColor whiteColor]];
        
        if (++_expectedNumber > _numberOfGameTiles) {

            _currentlyActive = NO;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
            });
            
            return;
        }
        
    }
    
}

@end
