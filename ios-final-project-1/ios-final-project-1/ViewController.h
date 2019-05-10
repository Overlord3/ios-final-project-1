//
//  ViewController.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ViewProtocol.h"
#import "PresenterProtocol.h"


@interface ViewController : UIViewController<ViewProtocol>

@property(nonatomic, strong) id<PresenterProtocol> presenter;

@end
