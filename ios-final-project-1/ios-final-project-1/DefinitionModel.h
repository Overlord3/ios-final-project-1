//
//  DefinitionModel.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


@interface DefinitionModel : NSObject

/**
 Инициализатор модели определения
 
 @param definition Текст определения
 @param author Имя автора
 @param date Дата
 @param example Пример использования
 @return Модель определения
 */
+ (instancetype) initWithDefinition:(NSString *)definition author:(NSString *)author date:(NSDate *)date example:(NSString *)example;

- (NSString *)getDefinition;
- (NSString *)getAuthor;
- (NSDate *)getDate;
- (NSString *)getExample;

@end

NS_ASSUME_NONNULL_END
