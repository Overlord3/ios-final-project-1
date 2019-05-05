//
//  CoreDataService.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "WordModel.h"


NS_ASSUME_NONNULL_BEGIN


@interface CoreDataService : NSObject

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext; /**< Контекст для сохранения данных */


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


@end

NS_ASSUME_NONNULL_END
