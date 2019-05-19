//
//  AIP_DictionaryViewProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef DictionaryViewProtocol_h
#define DictionaryViewProtocol_h


#import <UIKit/UIKit.h>
#import "AIP_WordModel.h"


@protocol AIP_DictionaryViewProtocol <NSObject>

/**
 Показывает алерт с заголовком и сообщением и действием ОК
 
 @param title Заголовок сообщения
 @param message Текст сообщения
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

/**
 Добавляет контроллер поверх контроллера словаря
 необходимо для контроллера с определениями

 @param viewController вью контроллер
 */
- (void)pushViewController:(UIViewController *)viewController;

@end

#endif /* DictionaryViewProtocol_h */
