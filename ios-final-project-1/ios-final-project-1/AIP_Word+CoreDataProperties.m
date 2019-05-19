//
//  AIP_Word+CoreDataProperties.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//
//


#import "AIP_Word+CoreDataProperties.h"


@implementation AIP_Word (CoreDataProperties)

+ (NSFetchRequest<AIP_Word *> *)fetchRequest
{
	return [NSFetchRequest fetchRequestWithEntityName:@"Word"];
}

@dynamic word;
@dynamic definitions;

@end
