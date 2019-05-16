//
//  DictionaryViewProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef DictionaryViewProtocol_h
#define DictionaryViewProtocol_h

#import <UIKit/UIKit.h>
#import "WordModel.h"


@protocol DictionaryViewProtocol <NSObject>

- (void) pushViewController:(UIViewController *)viewController;

@end

#endif /* DictionaryViewProtocol_h */
