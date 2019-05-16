//
//  DictionaryPresenter.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "DictionaryPresenter.h"
#import "DefinitionsViewController.h"


@implementation DictionaryPresenter

/**
 Получить весь текущий словарь из памяти и отсортировать в алфавитном порядке
 
 @return массив слов с определениями
 */
- (NSArray<WordModel *> *)getDictionary
{
	NSArray<WordModel *> *array = [self.coreDataService getAllWords];
	
	return [self sortArrayInAlphabetOrder:array];
}


- (NSArray<WordModel *> *)clearDictionary
{
	NSArray<WordModel *> *array = [self.coreDataService clearAllWords];
	if (array.count > 0)
	{
		[self.view showAlertWithTitle:@"Операция не удалась" message:@"Словарь не был очищен, попробуйте ещё раз"];
		return [self sortArrayInAlphabetOrder:array];
	}
	
	return array;
}

/**
 Отправить сообщение о том, что выбрана ячейка со словом для перехода к этому слову
 
 @param wordModel слово, которое в выбранной ячейке
 */
- (void)selectedTableCellWithWord:(WordModel *)wordModel
{
	DefinitionsViewController *viewController = [DefinitionsViewController new];
	viewController.wordModel = wordModel;
	[self.view pushViewController:viewController];
}


#pragma Вспомогательные функции

/**
 Сортирует массив слов в алфавитном порядке

 @param wordsArray массив слов для сортировки
 @return новый массив со словами в алфавитном порядке
 */
- (NSArray<WordModel *> *)sortArrayInAlphabetOrder:(NSArray<WordModel *> *)wordsArray
{
	NSArray<WordModel *> *sortedArray = [wordsArray sortedArrayUsingComparator: ^NSComparisonResult(WordModel *left, WordModel *right)
	{
		return [left.word caseInsensitiveCompare:right.word];
	}];
	
	return sortedArray;
}

@end
