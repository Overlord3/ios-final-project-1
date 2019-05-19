//
//  AIP_Definition+CoreDataProperties.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//
//


#import "AIP_Definition+CoreDataProperties.h"


@implementation AIP_Definition (CoreDataProperties)

+ (NSFetchRequest<AIP_Definition *> *)fetchRequest
{
	return [NSFetchRequest fetchRequestWithEntityName:@"Definition"];
}

@dynamic definition;
@dynamic author;
@dynamic date;
@dynamic example;
@dynamic word;

@end
