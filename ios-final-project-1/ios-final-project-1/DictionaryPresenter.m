//
//  DictionaryPresenter.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "DictionaryPresenter.h"


@implementation DictionaryPresenter

/**
 Получить весь текущий словарь из памяти и отсортировать в алфавитном порядке
 
 @return массив слов с определениями
 */
- (NSArray<WordModel *> *)getDictionary
{
	NSArray<WordModel *> *array = [self.coreDataService getAllWords];
	
	NSArray<WordModel *> *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
	{
		WordModel *left = obj1, *right = obj2;
		return [left.word caseInsensitiveCompare:right.word];
	}];
	
	return sortedArray;
}

@end
