//
//  CoreDataServiceProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef CoreDataServiceProtocol_h
#define CoreDataServiceProtocol_h


#import "WordModel.h"


@protocol CoreDataServiceProtocol <NSObject>

/**
 Функция поиска слова в локальном базе данных

 @param searchString Строка для поиска
 @return Экземпляр класса модели слова с определениями
 */
- (WordModel *)findWordWithSearchString:(NSString *)searchString;

/**
 Функция сохранения модели слова с определениями в локальную базу данных

 @param wordModel модель слова
 */
- (void)saveWordModel:(WordModel *)wordModel;

/**
 Получение всех слов с определениями из памяти

 @return массив моделей слов
 */
- (NSArray<WordModel *> *)getAllWords;

@end

#endif /* CoreDataServiceProtocol_h */
