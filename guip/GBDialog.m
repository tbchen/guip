//
//  GBDialog.m
//  guip
//
//  Created by chentb on 14-8-13.
//  Copyright (c) 2014年 chentb. All rights reserved.
//

#import "GBDialog.h"
#import "MenuScene.h"

@implementation GBDialog{
    GBButton* _backToMenuButton;
    GBButton* _resumeButton;
}

-(instancetype)initWithColor:(UIColor *)color size:(CGSize)size{
    self = [super initWithColor:color size:size];
    if(self){
        CGSize buttonSize = CGSizeMake(self.size.width/2, self.size.height/6);
        _backToMenuButton = [GBButton buttonWithColor:[UIColor greenColor] size:buttonSize text:@"Menu"];
        _backToMenuButton.delegate = self;
        _backToMenuButton.position = CGPointMake(0, self.size.height / 4);
        [self addChild:_backToMenuButton];
        _resumeButton = [GBButton buttonWithColor:[UIColor greenColor] size:buttonSize text:@"Resume"];
        _resumeButton.delegate = self;
        _resumeButton.position = CGPointMake(0, -self.size.height / 4);
        [self addChild:_resumeButton];
    }
    return self;
}

-(void)onClick:(id)sender{
    if(sender == _backToMenuButton){
        //goto menu
        MenuScene *scene = [[MenuScene alloc]initWithSize:self.scene.size];
        //playScene.gameDelegate = self.view.window.rootViewController;
        SKTransition *t = [SKTransition doorsCloseHorizontalWithDuration:0.3];
        [self.scene.view presentScene:scene transition:t];
    }else if(sender == _resumeButton){
        self.scene.paused = false;
        SKAction* action = [SKAction moveToY: -self.scene.size.height / 2 duration:0.3];
        [self runAction:action completion:^{
            [self removeFromParent];
        }];
        
    }
}
@end
