//
//  AIP_DefinitionModel.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


@interface AIP_DefinitionModel : NSObject

/**
 Инициализатор модели определения
 
 @param definition Текст определения
 @param author Имя автора
 @param date Дата
 @param example Пример использования
 @return Модель определения
 */
+ (instancetype) initWithDefinition:(NSString *)definition author:(NSString *)author date:(NSDate *)date example:(NSString *)example;

/**
 Метод, для получения текста определения

 @return текст определения
 */
- (NSString *)getDefinition;

/**
 Метод, для получения имени автора
 
 @return имя автора
 */
- (NSString *)getAuthor;

/**
 Метод, для получения даты
 
 @return дата
 */
- (NSDate *)getDate;

/**
 Метод, для получения текста использования
 
 @return текст примера использования
 */
- (NSString *)getExample;


#pragma GetTextForLabel

/**
 Метод, для получения текста определения для лейбла
 
 @return текст определения
 */
- (NSString *)getDefinitionForLabel;

/**
 Метод, для получения текста даты
 
 @return текст даты, отформатированный
 */
- (NSString *)getDateForLabel;

/**
 Метод, для получения имени автора для лейбла
 
 @return имя автора
 */
- (NSString *)getAuthorForLabel;

/**
 Метод, для получения текста использования для лейбла
 
 @return текст примера использования
 */
- (NSString *)getExampleForLabel;

@end

NS_ASSUME_NONNULL_END
