//
//  AIP_SearchViewProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef SearchViewProtocol_h
#define SearchViewProtocol_h


#import "AIP_WordModel.h"


@protocol AIP_SearchViewProtocol <NSObject>

/**
 Возвращает данные в контроллер, когда запрос выполнен
 
 @param word Слово и определения к нему
 */
- (void)searchingFinishedWithWord:(AIP_WordModel *)word;

/**
 Показывает алерт с заголовком и сообщением и действием ОК
 
 @param title Заголовок сообщения
 @param message Текст сообщения
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end

#endif /* SearchViewProtocol_h */
