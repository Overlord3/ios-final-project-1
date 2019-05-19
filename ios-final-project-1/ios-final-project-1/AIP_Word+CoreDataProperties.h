//
//  AIP_Word+CoreDataProperties.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//
//


#import "AIP_Word+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN


@interface AIP_Word (CoreDataProperties)

+ (NSFetchRequest<AIP_Word *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *word; /**< Основное слово */
@property (nullable, nonatomic, retain) NSSet<AIP_Definition *> *definitions; /**< Массив определений для слова */

@end


/**
 Интерфейс взаимодействия с зависимостями сущностей
 Управление определениями (добавление, удаление)
 */
@interface AIP_Word (CoreDataGeneratedAccessors)

- (void)addDefinitionsObject:(AIP_Definition *)value;
- (void)removeDefinitionsObject:(AIP_Definition *)value;
- (void)addDefinitions:(NSSet<AIP_Definition *> *)values;
- (void)removeDefinitions:(NSSet<AIP_Definition *> *)values;

@end

NS_ASSUME_NONNULL_END
