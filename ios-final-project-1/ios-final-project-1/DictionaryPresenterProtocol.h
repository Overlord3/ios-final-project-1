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
 Получить весь текущий словарь из памяти

 @return массив слов с определениями
 */
- (NSArray<WordModel *> *)getDictionary;

@end

#endif /* DictionaryPresenterProtocol_h */
