//
//  AIP_DefinitionModel.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "AIP_DefinitionModel.h"


@interface AIP_DefinitionModel ()

@property (nonatomic, nonnull, copy)NSString *definition; /**< Определение слова */
@property (nonatomic, nonnull, copy)NSString *author; /**< Автор определения */
@property (nonatomic, nonnull, copy)NSDate *date; /**< Дата определения */
@property (nonatomic, nonnull, copy)NSString *example; /**< Пример использования */

@end


@implementation AIP_DefinitionModel

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
	AIP_DefinitionModel *model = [AIP_DefinitionModel new];
	model.definition = definition;
	model.author = author;
	model.date = date;
	model.example = example;
	return model;
}

/**
 Метод, для получения текста определения
 
 @return текст определения
 */
- (NSString *)getDefinition
{
	return self.definition;
}

/**
 Метод, для получения текста определения для лейбла

 @param number номер определения, входит в текст
 @return текст определения
 */
- (NSString *)getDefinitionForLabel:(NSInteger)number
{
	NSString *definitionText = nil;
	if (self.definition != nil)
	{
		definitionText = [NSString stringWithFormat:@"№%lu\n%@",number,self.definition];
	}
	return definitionText;
}

/**
 Метод, для получения имени автора
 
 @return имя автора
 */
- (NSString *)getAuthor
{
	return self.author;
}

/**
 Метод, для получения имени автора для лейбла
 
 @return имя автора
 */
- (NSString *)getAuthorForLabel
{
	NSString *authorText = nil;
	if (self.author != nil)
	{
		authorText = [@"Автор:\n" stringByAppendingString:self.author];
	}
	return authorText;
}

/**
 Метод, для получения даты
 
 @return дата
 */
- (NSDate *)getDate
{
	return self.date;
}

/**
 Метод, для получения текста даты
 
 @return текст даты, отформатированный
 */
- (NSString *)getDateForLabel
{
	NSDateFormatter *formatter = [NSDateFormatter new];
	[formatter setDateFormat:@"yyyy-MM-dd"];
	return [formatter stringFromDate:self.date];
}

/**
 Метод, для получения текста использования
 
 @return текст примера использования
 */
- (NSString *)getExample
{
	return self.example;
}

/**
 Метод, для получения текста использования для лейбла
 
 @return текст примера использования
 */
- (NSString *)getExampleForLabel
{
	NSString *exampleText = nil;
	if (self.example != nil)
	{
		exampleText = [@"Пример использования:\n" stringByAppendingString:self.example];
	}
	return exampleText;
}

@end
