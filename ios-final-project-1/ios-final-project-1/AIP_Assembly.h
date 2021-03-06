//
//  AIP_Assembly.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface AIP_Assembly : NSObject

/**
 Собирает таббар контроллер со всеми контроллерами
 
 @return таббар контроллер для window
 */
- (UIViewController *) assemblyTabbarController;

/**
 Собирает архитектуру MVP,
 
 @return Возвращает контроллер для экрана поиска
 */
- (UIViewController *) assemblySearchScreen;

/**
 Собирает архитектуру MVP,
 
 @return Возвращает контроллер для экрана словаря
 */
- (UIViewController *) assemblyDictionaryScreen;

@end

NS_ASSUME_NONNULL_END
