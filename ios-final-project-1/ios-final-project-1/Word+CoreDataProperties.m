//
//  Word+CoreDataProperties.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//
//

#import "Word+CoreDataProperties.h"

@implementation Word (CoreDataProperties)

+ (NSFetchRequest<Word *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Word"];
}

@dynamic word;
@dynamic definitions;

@end
