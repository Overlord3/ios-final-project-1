//
//  Word+CoreDataProperties.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//
//

#import "Word+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Word (CoreDataProperties)

+ (NSFetchRequest<Word *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *word;
@property (nullable, nonatomic, retain) NSSet<Definition *> *definitions;

@end

@interface Word (CoreDataGeneratedAccessors)

- (void)addDefinitionsObject:(Definition *)value;
- (void)removeDefinitionsObject:(Definition *)value;
- (void)addDefinitions:(NSSet<Definition *> *)values;
- (void)removeDefinitions:(NSSet<Definition *> *)values;

@end

NS_ASSUME_NONNULL_END
