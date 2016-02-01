//
//  EAEntryController.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EAEntryController.h"

@implementation EAEntryController

- (id)init {
    
    if ((self = [super init])) {
        
        [[self view] setBackgroundColor:[UIColor blackColor]];
        
        UIButton *moderateButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [moderateButton setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width / 2, 50)];
        [moderateButton setBackgroundColor:[UIColor blueColor]];
        [moderateButton setTitle:@"Moderate" forState:UIControlStateNormal];
        [moderateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [moderateButton setCenter:[[self view] center]];
        [moderateButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
        [moderateButton setTag:1];
        [[self view] addSubview:moderateButton];
        
        UIButton *easyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [easyButton setFrame:CGRectMake([moderateButton frame].origin.x, [moderateButton frame].origin.y - 60, [[UIScreen mainScreen] bounds].size.width / 2, 50)];
        [easyButton setBackgroundColor:[UIColor grayColor]];
        [easyButton setTitle:@"Easy" forState:UIControlStateNormal];
        [easyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [easyButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
        [easyButton setTag:0];
        [[self view] addSubview:easyButton];
        
        UIButton *hardButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [hardButton setFrame:CGRectMake([moderateButton frame].origin.x, [moderateButton frame].origin.y + 60, [[UIScreen mainScreen] bounds].size.width / 2, 50)];
        [hardButton setBackgroundColor:[UIColor redColor]];
        [hardButton setTitle:@"Hard" forState:UIControlStateNormal];
        [hardButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [hardButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
        [hardButton setTag:2];
        [[self view] addSubview:hardButton];
        
    }
    
    return self;
}

- (void)startGame:(UIButton *)sender {
    
    CGFloat xTileCount;
    CGFloat yTileCount;
    CGFloat activeTileCount;
    
    switch ([sender tag]) {
        case 0: {
            
            xTileCount = 5;
            yTileCount = 5;
            activeTileCount = 5;
            
            break;
        }
            
        case 1: {
           
            xTileCount = 7;
            yTileCount = 7;
            activeTileCount = 10;
            
            break;
        }
            
        case 2: {
            
            xTileCount = 10;
            yTileCount = 10;
            activeTileCount = 20;
            
            break;
        }
            
        default:
            break;
    }
    
    EATileViewController *gameController = [[EATileViewController alloc] init];
    [gameController setNumberOfX:xTileCount];
    [gameController setNumberOfY:yTileCount];
    [gameController setNumberOfGameTiles:activeTileCount];
    [gameController layoutTilesOnContainer];
    
    [self presentViewController:gameController animated:YES completion:nil];
    
}

@end
