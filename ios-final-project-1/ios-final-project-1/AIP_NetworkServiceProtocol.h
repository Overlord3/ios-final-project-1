//
//  AIP_NetworkServiceProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AIP_WordModel.h"
#import "AIP_DefinitionModel.h"


/**
 Протокол для вывода результатов работы сервиса
 */
@protocol AIP_NetworkServiceOutputProtocol <NSObject>

/**
 Возвращает данные в презентер, когда запрос выполнен

 @param word Определения к найденному слову
 */
- (void)searchingFinishedWithWord:(AIP_WordModel *)word;

@end


/**
 Протокол для функций сервиса
 */
@protocol AIP_NetworkServiceInputProtocol <NSObject>

/**
 Поиск определений слов в сервисе

 @param searchString Строка поиска, на английском обязательно
 */
- (void)searchDefinitionsForString:(NSString *)searchString;

@end
