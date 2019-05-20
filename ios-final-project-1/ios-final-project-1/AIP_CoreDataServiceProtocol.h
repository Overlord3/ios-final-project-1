//
//  AIP_CoreDataServiceProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef CoreDataServiceProtocol_h
#define CoreDataServiceProtocol_h


#import "AIP_WordModel.h"


@protocol AIP_CoreDataServiceProtocol <NSObject>

/**
 Функция поиска слова в локальном базе данных

 @param searchString Строка для поиска
 @return Экземпляр класса модели слова с определениями
 */
- (AIP_WordModel *)findWordWithSearchString:(NSString *)searchString;

/**
 Функция сохранения модели слова с определениями в локальную базу данных

 @param wordModel модель слова
 */
- (void)saveWordModel:(AIP_WordModel *)wordModel;

/**
 Получение всех слов с определениями из памяти

 @return массив моделей слов
 */
- (NSArray<AIP_WordModel *> *)getAllWords;

/**
 Удалить все слова из памяти и вернуть то, что осталось (должен быть пустой массив, если удалилось успешно

 @return заново прочитанный массив после удаления, должен быть пустым в случае успешной операции
 */
- (NSArray<AIP_WordModel *> *)clearAllWords;

/**
 Найти и удалить слово
 
 @param text слово для удаления
 */
- (void) deleteWordWithText:(NSString *)text;

@end

#endif /* CoreDataServiceProtocol_h */
