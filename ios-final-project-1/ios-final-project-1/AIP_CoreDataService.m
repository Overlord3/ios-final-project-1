//
//  AIP_CoreDataService.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "AIP_CoreDataService.h"
#import "AppDelegate.h"
#import "AIP_Word+CoreDataClass.h"
#import "AIP_Definition+CoreDataClass.h"


@implementation AIP_CoreDataService

/**
 Функция поиска слова в локальном хранилище данных
 
 @param searchString Строка для поиска
 @return Экземпляр класса модели слова с определениями
 */
- (AIP_WordModel *)findWordWithSearchString:(NSString *)searchString
{
	NSManagedObjectContext *context = [self getCoreDataContext];
	NSFetchRequest *request = [self getFetchRequest:searchString];
	
	NSError *error = nil;
	NSArray *result = [context executeFetchRequest:request error:&error];
	if (result.count != 1)
	{
		return nil;
	}
	AIP_Word *word = result[0];
	AIP_WordModel *wordModel = [AIP_WordModel new];
	wordModel.word = word.word;
	for (AIP_Definition *definition in [word.definitions allObjects])
	{
		AIP_DefinitionModel *definitionModel = [AIP_DefinitionModel initWithDefinition:definition.definition author:definition.author date:definition.date example:definition.example];
		[wordModel.definitions addObject:definitionModel];
	}
	return wordModel;
}

/**
 Получение запроса для поиска слова по полю word

 @param searchString строка для поиска слова
 @return запрос на поиск для примнения в контексте
 */
- (NSFetchRequest *)getFetchRequest:(NSString *)searchString
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"AIP_Word"];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"word = %@", searchString];
	return fetchRequest;
}

/**
 Функция сохранения модели слова с определениями в локальную базу данных
 
 @param wordModel модель слова
 */
- (void)saveWordModel:(AIP_WordModel *)wordModel
{
	//Создание нового слова
	AIP_Word *word = [NSEntityDescription insertNewObjectForEntityForName:@"AIP_Word" inManagedObjectContext:[self getCoreDataContext]];
	word.word = wordModel.word;
	
	//Добавление определений
	for (AIP_DefinitionModel *definitionModel in wordModel.definitions)
	{
		AIP_Definition *definition = [NSEntityDescription insertNewObjectForEntityForName:@"AIP_Definition" inManagedObjectContext:[self getCoreDataContext]];
		definition.definition = [definitionModel getDefinition];
		definition.example = [definitionModel getExample];
		definition.author = [definitionModel getAuthor];
		definition.date = [definitionModel getDate];
		definition.word = word;
		[word addDefinitionsObject:definition];
	}
	NSError *error = nil;
	
	//Сохранение
	if (![word.managedObjectContext save:&error])
	{
		NSLog(@"Не удалось сохранить объект");
		NSLog(@"%@, %@", error, error.localizedDescription);
	}
}

- (NSArray<AIP_WordModel *> *)getAllWords
{
	NSArray<AIP_Word *> *result = [self readAllEntityWithName:@"AIP_Word"];
	
	NSMutableArray *dictionary = [NSMutableArray new];
	for (AIP_Word *word in result)
	{
		AIP_WordModel *wordModel = [AIP_WordModel new];
		wordModel.word = word.word;
		for (AIP_Definition *definition in [word.definitions allObjects])
		{
			AIP_DefinitionModel *definitionModel = [AIP_DefinitionModel initWithDefinition:definition.definition author:definition.author date:definition.date example:definition.example];
			[wordModel.definitions addObject:definitionModel];
		}
		[dictionary addObject:wordModel];
	}

	return dictionary;
}

/**
 Удалить все слова из памяти и вернуть то, что осталось (должен быть пустой массив, если удалилось успешно
 
 @return заново прочитанный массив после удаления, должен быть пустым в случае успешной операции
 */
- (NSArray<AIP_WordModel *> *)clearAllWords
{
	NSArray<AIP_Word *> *objects = [self readAllEntityWithName:@"AIP_Word"];
	NSManagedObjectContext *context = [self getCoreDataContext];
	
	for (AIP_Word *word in objects)
	{
		[context deleteObject:word];
	}
	NSError *error = nil;
	
	//Сохранение
	if (![context save:&error])
	{
		NSLog(@"Не удалось удалить объекты");
		NSLog(@"%@, %@", error, error.localizedDescription);
	}
	return [self getAllWords];
}


#pragma Вспомогательные методы

/**
 Получить все сущности из кордаты по названию

 @param name имя сущности
 @return массив всех сущностей из кордаты
 */
- (NSArray *)readAllEntityWithName:(NSString *)name
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:name];
	
	NSManagedObjectContext *context = [self getCoreDataContext];
	
	NSError *error = nil;
	NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
	return result;
}

/**
 Получение контекста кордаты
 Если контекст сохранен, то возвращает из поля, иначе из аппделегата.

 @return контекст кордаты
 */
- (NSManagedObjectContext *)getCoreDataContext
{
	if (self.coreDataContext)
	{
		return self.coreDataContext;
	}
	
	UIApplication *application = [UIApplication sharedApplication];
	NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).
	persistentContainer;
	NSManagedObjectContext *context = container.viewContext;
	self.coreDataContext = context;
	
	return self.coreDataContext;
}

@end
