//
//  GBDialog.m
//  guip
//
//  Created by chentb on 14-8-13.
//  Copyright (c) 2014年 chentb. All rights reserved.
//

#import "GBDialog.h"
#import "MenuScene.h"
#import "UIColor+CustomColors.h"

@implementation GBDialog{
    GBButton* _backToMenuButton;
    GBButton* _resumeButton;
}

-(instancetype)initWithColor:(UIColor *)color size:(CGSize)size{
    self = [super initWithColor:color size:size];
    if(self){
        CGSize buttonSize = CGSizeMake(self.size.width/2, self.size.height/6);
        _backToMenuButton = [GBButton buttonWithColor:[UIColor customBlueColor] size:buttonSize text:@"Menu"];
        _backToMenuButton.delegate = self;
        [_backToMenuButton setFontSize:20];
        _backToMenuButton.position = CGPointMake(0, self.size.height / 4);
        [self addChild:_backToMenuButton];
        _resumeButton = [GBButton buttonWithColor:[UIColor customBlueColor] size:buttonSize text:@"Resume"];
        _resumeButton.delegate = self;
        _resumeButton.position = CGPointMake(0, -self.size.height / 4);
        [_resumeButton setFontSize:20];
        [self addChild:_resumeButton];
//        self.
    }
    return self;
}

-(void)onClick:(id)sender{
    if(sender == _backToMenuButton){
        NSLog(@"goto menu.");
        //goto menu
        MenuScene *scene = [[MenuScene alloc]initWithSize:self.scene.size];
        //playScene.gameDelegate = self.view.window.rootViewController;
        SKTransition *t = [SKTransition doorsCloseHorizontalWithDuration:0.3];
        [self.scene.view presentScene:scene transition:t];
        
    }else if(sender == _resumeButton){
        self.scene.paused = NO;
        SKAction* action = [SKAction moveToY: -self.scene.size.height / 2 duration:0.3];
        [self runAction:action completion:^{
            [self removeFromParent];
        }];
        
    }
}

//-(CGRect)bounds{
//    CGRect rect = CGRectMake(self.anchorPoint.x,self.anchorPoint.y, self.size.width, self.size.height);
//    return rect;
//}
//-(void)setBounds:(CGRect)bounds{
//    self.size = bounds.size;
//    self.anchorPoint = bounds.origin;
//}
@end
