//
//  DictionaryPresenterProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef DictionaryPresenterProtocol_h
#define DictionaryPresenterProtocol_h


#import "WordModel.h"


@protocol DictionaryPresenterProtocol <NSObject>

/**
 Получить весь текущий словарь из памяти и отсортировать в алфавитном порядке
 
 @return массив слов с определениями
 */
- (NSArray<WordModel *> *)getDictionary;

/**
 Очистить словарь и вернуть заново прочитанный, если операция была успешной

 @return массив слов с определениями(пустой)
 */
- (NSArray<WordModel *> *)clearDictionary;

/**
 Отправить сообщение о том, что выбрана ячейка со словом для перехода к этому слову

 @param wordModel слово, которое в выбранной ячейке
 */
- (void)selectedTableCellWithWord:(WordModel *)wordModel;

@end

#endif /* DictionaryPresenterProtocol_h */
