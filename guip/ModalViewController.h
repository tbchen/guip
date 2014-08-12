//
//  ModalViewController.h
//  Popping
//
//  Created by André Schneider on 16.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewControllerDelegate <NSObject>
-(void)returnFromDialog:(id)sender;
@end

@interface ModalViewController : UIViewController
@property(nonatomic,weak)id<ModalViewControllerDelegate> delegate;
@end
