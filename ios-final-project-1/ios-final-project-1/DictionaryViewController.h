//
//  DictionaryViewController.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DictionaryViewProtocol.h"
#import "DictionaryPresenterProtocol.h"


@interface DictionaryViewController : UIViewController<DictionaryViewProtocol>

@property(nonatomic, nonnull, strong) id<DictionaryPresenterProtocol> presenter; /**< Презентер этого вью */

@end
