//
//  AIP_WordModel.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "AIP_WordModel.h"


@implementation AIP_WordModel

/**
 Инициализатор для модели слова
 Инициализирует массив определений
 
 @return экземпляр класса
 */
- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_word = @"";
		_definitions = [NSMutableArray new];
	}
	return self;
}

@end
