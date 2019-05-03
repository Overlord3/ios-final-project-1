//
//  DefinitionModel.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "DefinitionModel.h"


@interface DefinitionModel ()

@property (nonatomic,copy)NSString *definition; /**< Определение слова */
@property (nonatomic,copy)NSString *author; /**< Автор определения */
@property (nonatomic,copy)NSDate *date; /**< Дата определения */
@property (nonatomic,copy)NSString *example; /**< Пример использования */

@end


@implementation DefinitionModel


/**
 Инициализатор модели определения

 @param definition Текст определения
 @param author Имя автора
 @param date Дата
 @param example Пример использования
 @return Модель определения
 */
+ (instancetype) initWithDefinition:(NSString *)definition author:(NSString *)author date:(NSDate *)date example:(NSString *)example
{
	DefinitionModel *model = [DefinitionModel new];
	model.definition = definition;
	model.author = author;
	model.date = date;
	model.example = example;
	return model;
}

- (NSString *)getDefinition
{
	return self.definition;
}

- (NSString *)getAuthor
{
	return self.author;
}

- (NSDate *)getDate
{
	return self.date;
}

- (NSString *)getExample
{
	return self.example;
}

@end
