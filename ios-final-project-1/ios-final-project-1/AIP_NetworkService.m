//
//  AIP_NetworkService.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "AIP_NetworkService.h"
#import "AIP_DefinitionModel.h"


@interface AIP_NetworkService ()

@property (nonatomic, nonnull, strong) NSURLSession *urlSession; /**< Сессия */

@end


@implementation AIP_NetworkService


#pragma Initialization

/**
 Инициализатор сервиса
 Проинициализирует все необходимые свойства и настроит сессию

 @return экземпляр класса NetworkService
 */
+ (instancetype)initService
{
	AIP_NetworkService *service = [AIP_NetworkService new];
	[service configureUrlSession];
	return service;
}

/**
 Настраивает URL сессию.
 */
- (void)configureUrlSession
{
	NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
	
	// Настраиваем Session Configuration
	[sessionConfiguration setAllowsCellularAccess:YES];
	[sessionConfiguration setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json" }];
	
	// Создаем сессию
	self.urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
}

/**
 Поиск определений слов в сервисе
 
 @param searchString Строка поиска, на английском обязательно
 */
- (void)searchDefinitionsForString:(NSString *)searchString;
{
	//Пример запроса - http://api.urbandictionary.com/v0/define?term={word}
	NSString *urlString = [NSString stringWithFormat: @"http://api.urbandictionary.com/v0/define?term=%@", searchString];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString: urlString]];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setTimeoutInterval:15];
	
	NSURLSession *session;
	session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	
	NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
	{
		NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
		
		//Получим список
		NSArray<NSDictionary *> *definitions = dict[@"list"];
		//Создадим модель для слова
		AIP_WordModel *wordModel = [AIP_WordModel new];
		wordModel.word = searchString;
		
		for(NSDictionary *dict in definitions)
		{
			NSString *definitionString = dict[@"definition"];
			definitionString = [self replaceBracketsInString:definitionString];
			
			NSString *authorString = dict[@"author"];
			authorString = [self replaceBracketsInString:authorString];
			
			NSString *exampleString = dict[@"example"];
			exampleString = [self replaceBracketsInString:exampleString];
			
			//Получаем дату, используем форматтер
			//"written_on": "2012-07-19T00:00:00.000Z",
			NSString *dateString = dict[@"written_on"];
			NSDateFormatter *dateFormatter = [NSDateFormatter new];
			[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
			NSDate *date = [dateFormatter dateFromString:dateString];
			
			//Инициализация определения с параметрами
			AIP_DefinitionModel *definition = [AIP_DefinitionModel
										   initWithDefinition:definitionString
										   author:authorString
										   date:date
										   example:exampleString];
			
			//Добавим определение в слово
			[wordModel.definitions addObject:definition];
		}
		// Отправим сообщение с данными на главный поток, для обновления UI
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.outputDelegate searchingFinishedWithWord:wordModel];
		});
	}];
	[sessionDataTask resume];
}

/**
 Вспомогательная функция для удаления квадратных скобок из строки.

 @param string Входная строка со скобками
 @return Строка без скобок
 */
- (NSString *) replaceBracketsInString:(NSString *)string
{
	string = [string stringByReplacingOccurrencesOfString:@"[" withString:@""];
	string = [string stringByReplacingOccurrencesOfString:@"]" withString:@""];
	return string;
}

@end
