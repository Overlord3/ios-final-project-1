//
//  DefinitionsViewController.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 16/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "WordModel.h"


NS_ASSUME_NONNULL_BEGIN


@interface DefinitionsViewController : UIViewController

- (void) setWordModel:(WordModel *)wordModel;

@property (nonatomic, strong) WordModel *wordModel; /**< Слово с определениями для отображения */

@end

NS_ASSUME_NONNULL_END
