//
//  GameScene.h
//  guip
//

//  Copyright (c) 2014年 chentb. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GBButton.h"

@protocol GameSceneDelegate <NSObject>
-(void)pause:(id)sender;
@end

@interface GameScene : SKScene<GBButtonDelegate>
@property(nonatomic,weak) id<GameSceneDelegate> gameDelegate;
@end
