//
//  GameViewController.h
//  guip
//

//  Copyright (c) 2014年 chentb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "MenuScene.h"
#import "ModalViewController.h"
#import "DismissingAnimator.h"
#import "PresentingAnimator.h"

@interface GameViewController : UIViewController<UIViewControllerTransitioningDelegate,
        ModalViewControllerDelegate>

@end
