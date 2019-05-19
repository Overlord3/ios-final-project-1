//
//  AIP_DictionaryViewController.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AIP_DictionaryViewProtocol.h"
#import "AIP_DictionaryPresenterProtocol.h"


@interface AIP_DictionaryViewController : UIViewController<AIP_DictionaryViewProtocol>

@property(nonatomic, nonnull, strong) id<AIP_DictionaryPresenterProtocol> presenter; /**< Презентер этого вью */

@end
