//
//  ViewProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef ViewProtocol_h
#define ViewProtocol_h


#import "WordModel.h"


@protocol ViewProtocol <NSObject>

/**
 Возвращает данные в контроллер, когда запрос выполнен
 
 @param word Слово и определения к нему
 */
- (void)searchingFinishedWithWord:(WordModel *)word;

/**
 Показывает алерт с заголовком и сообщением и действием ОК
 
 @param title Заголовок сообщения
 @param message Текст сообщения
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end

#endif /* ViewProtocol_h */
