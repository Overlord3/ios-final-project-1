//
//  SearchPresenter.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "SearchPresenter.h"


@interface SearchPresenter ()

@property (nonatomic, strong) NSString *previousRequest; /**< Предыдущий запрос, нужен для уведомлений */

@end


@implementation SearchPresenter


#pragma SearchPresenterProtocol

- (void)searchWithText:(NSString *)searchText
{
	if (![self checkForEnglishLettersOnlyInText:searchText])
	{
		[self.view showAlertWithTitle:@"Неправильный формат" message:@"Можно использовать только английский алфавит и цифры."];
		return;
	}
	
	//Отправить уведомление про прошлый поиск
	[self sendLocalPushNotificationWithSearchText:searchText];
	
	//Попробуем вызвать поиск локально в кордате
	WordModel* model = [self.coreDataService findWordWithSearchString:searchText];
	if (model == nil)
	{
		//Вызвать поиск в сети
		[self.networkService searchDefinitionsForString:searchText];
	}
	else
	{
		//Передать данные во вью
		[self.view searchingFinishedWithWord:model];
	}
}


/**
 Проверка текста запроса перед отправкой в сервис на валидные символы

 @param text текст запроса
 @return содержит ли запрос только английские буквы и цифры или нет
 */
- (BOOL) checkForEnglishLettersOnlyInText:(NSString *)text
{
	NSCharacterSet *englishLettersWithNumbers = [NSCharacterSet characterSetWithCharactersInString: @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"];
	
	NSCharacterSet *notLetters = [englishLettersWithNumbers invertedSet];
	NSRange range = [text rangeOfCharacterFromSet:notLetters];
	return range.location == NSNotFound;
}

/**
 Отправляет пуш-уведомление с текстом предыдущего запроса

 @param searchText текст нового запроса
 */
- (void) sendLocalPushNotificationWithSearchText:(NSString *)searchText
{
	if (self.previousRequest == nil)
	{
		self.previousRequest = searchText;
	}
	else
	{
		//Сформируем и отправим
		NSString *title = [NSString stringWithFormat:@"Вы давно не смотрели определение слова - %@!", self.previousRequest];
		[self.notificationService sendLocalNotificationAfterSeconds:10 withTitle:title andText:self.previousRequest];
		//Перезапишем предыдущий запрос
		self.previousRequest = searchText;
	}
}


#pragma NetworkOutputProtocol

/**
 Возвращает данные в презентер, когда запрос выполнен
 
 @param word Слово и определения к нему
 */
- (void)searchingFinishedWithWord:(WordModel *)word
{
	[self.coreDataService saveWordModel:word];
	[self.view searchingFinishedWithWord:word];
}

@end