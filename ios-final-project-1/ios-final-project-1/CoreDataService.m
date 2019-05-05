//
//  CoreDataService.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "CoreDataService.h"
#import "AppDelegate.h"
#import "Word+CoreDataClass.h"
#import "Definition+CoreDataClass.h"


@implementation CoreDataService

- (WordModel *)findWordWithSearchString:(NSString *)searchString
{
	NSManagedObjectContext *context = [self getCoreDataContext];
	NSFetchRequest *request = [self getFetchRequest:searchString];
	
	NSError *error = nil;
	NSArray *result = [context executeFetchRequest:request error:&error];
	if (result.count != 1)
	{
		return nil;
	}
	Word *word = result[0];
	WordModel *wordModel = [WordModel new];
	wordModel.word = word.word;
	for (Definition *definition in [word.definitions allObjects])
	{
		DefinitionModel *definitionModel = [DefinitionModel initWithDefinition:definition.definition author:definition.author date:definition.date example:definition.example];
		[wordModel.definitions addObject:definitionModel];
	}
	return wordModel;
}

- (NSFetchRequest *)getFetchRequest:(NSString *)searchString
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Word"];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"word = %@", searchString];
	return fetchRequest;
}

- (void)saveWordModel:(WordModel *)wordModel
{
	//Создание контакта
	Word *word = [NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:[self getCoreDataContext]];
	word.word = wordModel.word;
	
	for (DefinitionModel *definitionModel in wordModel.definitions)
	{
		Definition *definition = [NSEntityDescription insertNewObjectForEntityForName:@"Definition" inManagedObjectContext:[self getCoreDataContext]];
		definition.definition = [definitionModel getDefinition];
		definition.example = [definitionModel getExample];
		definition.author = [definitionModel getAuthor];
		definition.date = [definitionModel getDate];
		definition.word = word;
		[word addDefinitionsObject:definition];
	}
	NSError *error = nil;
	//Достаточно только один объект из связанных сохранить, чтобы все сохранились
	if (![word.managedObjectContext save:&error])
	{
		NSLog(@"Не удалось сохранить объект");
		NSLog(@"%@, %@", error, error.localizedDescription);
	}
}

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
