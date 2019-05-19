//
//  AIP_Definition+CoreDataProperties.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//
//


#import "AIP_Definition+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN


@interface AIP_Definition (CoreDataProperties)

+ (NSFetchRequest<AIP_Definition *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *definition; /**< Определение слова */
@property (nullable, nonatomic, copy) NSString *author; /**< Автор определения */
@property (nullable, nonatomic, copy) NSDate *date; /**< Дата определения */
@property (nullable, nonatomic, copy) NSString *example; /**< Пример использования */
@property (nullable, nonatomic, retain) AIP_Word *word; /**< Слово, в котором это определение находится */

@end

NS_ASSUME_NONNULL_END
