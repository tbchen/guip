//
//  MenuScene.m
//  guip
//
//  Created by chentb on 14-8-13.
//  Copyright (c) 2014年 chentb. All rights reserved.
//

#import "MenuScene.h"
#import "UIColor+CustomColors.h"

@implementation MenuScene{
    GBButton* _startButton;
}

-(void)didMoveToView:(SKView *)view {
    CGSize buttonSize = CGSizeMake(self.size.width/4, self.size.height/6);
    //Classic
    _startButton =[GBButton buttonWithColor:[UIColor customBlueColor] size:buttonSize text:@"Start"];
    _startButton.position = CGPointMake(self.size.width/2, self.size.height/2);
    [_startButton setFontSize:20];
    _startButton.delegate = self;
    [self addChild:_startButton];
    
    self.backgroundColor = [UIColor customGrayColor];
    
}

-(void)onClick:(id)sender{
    GameScene *playScene = [[GameScene alloc]initWithSize:self.size];
    //playScene.gameDelegate = self.view.window.rootViewController;
    SKTransition *t = [SKTransition doorsOpenHorizontalWithDuration:0.3];
    [self.view presentScene:playScene transition:t];
}

@end
