//
//  Definition+CoreDataProperties.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//
//

#import "Definition+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Definition (CoreDataProperties)

+ (NSFetchRequest<Definition *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *definition;
@property (nullable, nonatomic, copy) NSString *author;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *example;
@property (nullable, nonatomic, retain) Word *word;

@end

NS_ASSUME_NONNULL_END
