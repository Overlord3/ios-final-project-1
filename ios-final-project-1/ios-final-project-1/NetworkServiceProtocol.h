//
//  NetworkServiceProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "WordModel.h"
#import "DefinitionModel.h"


/**
 Протокол для вывода результатов работы сервиса
 */
@protocol NetworkServiceOutputProtocol <NSObject>

/**
 Возвращает данные в презентер, когда запрос выполнен

 @param word Определения к найденному слову
 */
- (void)searchingFinishedWithWord:(WordModel *)word;

@end


/**
 Протокол для функций сервиса
 */
@protocol NetworkServiceInputProtocol <NSObject>

/**
 Поиск определений слов в сервисе

 @param searchString Строка поиска, на английском обязательно
 */
- (void)searchDefinitionsForString:(NSString *)searchString;

@end
