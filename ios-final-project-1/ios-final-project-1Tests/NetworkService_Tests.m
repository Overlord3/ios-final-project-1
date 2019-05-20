//
//  NetworkService_Tests.m
//  ios-final-project-1Tests
//
//  Created by Александр Плесовских on 20/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "AIP_NetworkService.h"
#import "AIP_NetworkServiceProtocol.h"
#import "NetworkOutputProtocolImpForTest.h"
@import OCMock;


@interface NetworkService_Tests : XCTestCase

@property (nonatomic, nullable, strong) AIP_NetworkService *networkService;

@end


@implementation NetworkService_Tests

- (void)setUp
{
	// Инициализация сервиса
	self.networkService = [AIP_NetworkService initService];
}

- (void)tearDown
{
	// Удаление сервиса
	self.networkService = nil;
}


- (void)testSearchWord_Success
{
//	// Тест кейс
//	NetworkOutputProtocolImpForTest *delegate = [NetworkOutputProtocolImpForTest new];
//	self.networkService.outputDelegate = delegate;
//	NSString *request = @"test";
//	[self.networkService searchDefinitionsForString:request];
//
//	while (delegate.wordModel == nil)
//	{
//
//	}
////	for (int i=0; i<10; i++)
////	{
////		if (delegate.wordModel != nil)
////		{
////			break;
////		}
////		[NSThread sleepForTimeInterval:1.0f];
////	}
//
//	// Проверка результатов
//	XCTAssert(delegate.wordModel != nil);
//	XCTAssert([delegate.wordModel.word isEqualToString:request]);
//	XCTAssert(delegate.wordModel.definitions.count > 0);
}


@end
