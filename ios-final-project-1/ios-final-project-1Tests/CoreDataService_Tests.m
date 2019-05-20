//
//  CoreDataService_Tests.m
//  ios-final-project-1Tests
//
//  Created by Александр Плесовских on 19/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "AIP_CoreDataService.h"


@interface CoreDataService_Tests : XCTestCase

@property (nonatomic, nullable, strong) AIP_CoreDataService *coreDataService;

@end


@implementation CoreDataService_Tests

- (void)setUp
{
	// Инициализация сервиса
	self.coreDataService = [AIP_CoreDataService new];
}

- (void)tearDown
{
	// Удаление сохраненных значений и сервиса
	[self.coreDataService clearAllWords];
	self.coreDataService = nil;
}

- (void)testGetAllWordsEmpty
{
	// Тест кейс
	NSArray<AIP_WordModel *> *array = [self.coreDataService getAllWords];
	// Проверка результатов
	XCTAssert(array.count == 0);
}

- (void)testSaveModel_1
{
	// Тест кейс - Создаем модель, сохраняем и загружаем
	NSString *modelName = @"name-1";
	AIP_WordModel *wordModel = [AIP_WordModel new];
	wordModel.word = modelName;
	[self.coreDataService saveWordModel:wordModel];
	NSArray<AIP_WordModel *> *array = [self.coreDataService getAllWords];
	AIP_WordModel *loadedModel = array[0];
	// Проверка результатов
	XCTAssert(array.count == 1);
	XCTAssert([loadedModel.word isEqualToString:modelName]);
}

- (void)testSaveModel_2
{
	// Тест кейс - Создаем модель, сохраняем и загружаем
	NSString *modelName1 = @"name-1";
	AIP_WordModel *wordModel1 = [AIP_WordModel new];
	wordModel1.word = modelName1;
	[self.coreDataService saveWordModel:wordModel1];
	
	NSString *modelName2 = @"name-2";
	AIP_WordModel *wordModel2 = [AIP_WordModel new];
	wordModel2.word = modelName2;
	[self.coreDataService saveWordModel:wordModel2];
	
	NSArray<AIP_WordModel *> *array = [self.coreDataService getAllWords];
	AIP_WordModel *loadedModel1 = array[0];
	AIP_WordModel *loadedModel2 = array[1];
	// Проверка результатов
	XCTAssert(array.count == 2);
	XCTAssert([loadedModel1.word isEqualToString:modelName1]
			  && [loadedModel2.word isEqualToString:modelName2]
			  ||
			  [loadedModel2.word isEqualToString:modelName1]
			  && [loadedModel1.word isEqualToString:modelName2]);
}

- (void)testSaveModel_3
{
	// Тест кейс - Создаем модель, сохраняем и загружаем
	NSString *modelName1 = @"name-1";
	AIP_WordModel *wordModel1 = [AIP_WordModel new];
	wordModel1.word = modelName1;
	AIP_DefinitionModel *defModel = [AIP_DefinitionModel initWithDefinition:@"def-1" author:@"author-1" date:[NSDate new] example:@"example-1"];
	AIP_DefinitionModel *defModel2 = [AIP_DefinitionModel initWithDefinition:@"def-2" author:@"author-2" date:[NSDate new] example:@"example-2"];
	
	[wordModel1.definitions addObject:defModel];
	[wordModel1.definitions addObject:defModel2];
	
	// Сохраняем
	[self.coreDataService saveWordModel:wordModel1];
	// Загружаем
	NSArray<AIP_WordModel *> *array = [self.coreDataService getAllWords];
	AIP_WordModel *loadedModel1 = array[0];
	// Проверка результатов
	XCTAssert(array.count == 1);
	XCTAssert([loadedModel1.word isEqualToString:modelName1]);
	XCTAssert(loadedModel1.definitions.count == 2);
}

- (void)testSaveModel_4
{
	// Тест кейс - Создаем модель, сохраняем и загружаем
	NSString *modelName1 = @"name-1";
	AIP_WordModel *wordModel1 = [AIP_WordModel new];
	wordModel1.word = modelName1;
	NSDate *currentDate = [NSDate new];
	AIP_DefinitionModel *defModel = [AIP_DefinitionModel initWithDefinition:@"def-1" author:@"author-1" date:currentDate example:@"example-1"];
	
	[wordModel1.definitions addObject:defModel];
	
	// Сохраняем
	[self.coreDataService saveWordModel:wordModel1];
	// Загружаем
	NSArray<AIP_WordModel *> *array = [self.coreDataService getAllWords];
	AIP_WordModel *loadedModel1 = array[0];
	// Проверка результатов
	XCTAssert(array.count == 1);
	XCTAssert([loadedModel1.word isEqualToString:modelName1]);
	XCTAssert(loadedModel1.definitions.count == 1);
	AIP_DefinitionModel *loadedDefinition = loadedModel1.definitions[0];
	XCTAssert([[loadedDefinition getDefinition] isEqualToString:@"def-1"]);
	XCTAssert([[loadedDefinition getAuthor] isEqualToString:@"author-1"]);
	XCTAssert([[loadedDefinition getExample] isEqualToString:@"example-1"]);
	XCTAssert([[loadedDefinition getDate] isEqualToDate:currentDate]);
}


- (void)testSuccessedSearch_1
{
	// Тест кейс - Создаем модель и сохраняем, затем поиск
	NSString *modelName = @"name-1";
	AIP_WordModel *wordModel = [AIP_WordModel new];
	wordModel.word = modelName;
	[self.coreDataService saveWordModel:wordModel];
	// Поиск
	AIP_WordModel *searchedModel = [self.coreDataService findWordWithSearchString:modelName];
	// Проверка результатов
	XCTAssert(searchedModel != nil);
	XCTAssert([searchedModel.word isEqualToString:modelName]);
}

- (void)testSuccessedSearch_2
{
	// Тест кейс - Создаем модель, сохраняем, затем поиск
	NSString *modelName1 = @"name-1";
	AIP_WordModel *wordModel1 = [AIP_WordModel new];
	wordModel1.word = modelName1;
	NSDate *currentDate = [NSDate new];
	AIP_DefinitionModel *defModel = [AIP_DefinitionModel initWithDefinition:@"def-1" author:@"author-1" date:currentDate example:@"example-1"];
	
	[wordModel1.definitions addObject:defModel];
	
	// Сохраняем
	[self.coreDataService saveWordModel:wordModel1];
	// Поиск
	AIP_WordModel *searchedModel = [self.coreDataService findWordWithSearchString:modelName1];
	// Проверка результатов
	XCTAssert(searchedModel != nil);
	XCTAssert([searchedModel.word isEqualToString:modelName1]);
	XCTAssert(searchedModel.definitions.count == 1);
	AIP_DefinitionModel *searchedDefinition = searchedModel.definitions[0];
	XCTAssert([[searchedDefinition getDefinition] isEqualToString:@"def-1"]);
	XCTAssert([[searchedDefinition getAuthor] isEqualToString:@"author-1"]);
	XCTAssert([[searchedDefinition getExample] isEqualToString:@"example-1"]);
	XCTAssert([[searchedDefinition getDate] isEqualToDate:currentDate]);
}

- (void)testFailedSearch
{
	// Тест кейс - Создаем модель и сохраняем, затем поиск
	NSString *modelName = @"name-1";
	AIP_WordModel *wordModel = [AIP_WordModel new];
	wordModel.word = modelName;
	[self.coreDataService saveWordModel:wordModel];
	// Поиск
	AIP_WordModel *searchedModel = [self.coreDataService findWordWithSearchString:@"name-2"];
	// Проверка результатов
	XCTAssert(searchedModel == nil);
}

@end
