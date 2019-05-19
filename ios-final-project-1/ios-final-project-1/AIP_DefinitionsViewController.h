//
//  AIP_DefinitionsViewController.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 16/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AIP_WordModel.h"


@interface AIP_DefinitionsViewController : UIViewController

@property (nonatomic, nonnull, strong) AIP_WordModel *wordModel; /**< Слово с определениями для отображения */

@end
