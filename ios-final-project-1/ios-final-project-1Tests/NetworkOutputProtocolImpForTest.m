//
//  NetworkOutputProtocolImpForTest.m
//  ios-final-project-1Tests
//
//  Created by Александр Плесовских on 20/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "NetworkOutputProtocolImpForTest.h"


@implementation NetworkOutputProtocolImpForTest

- (instancetype)init
{
	self = [super init];
	if (self) {
		_wordModel = nil;
	}
	return self;
}

- (void)searchingFinishedWithWord:(AIP_WordModel *)word
{
	self.wordModel = word;
}

@end
