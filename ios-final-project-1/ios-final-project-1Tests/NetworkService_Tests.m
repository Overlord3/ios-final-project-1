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
	id outputProtocol = OCMProtocolMock(@protocol(AIP_NetworkServiceOutputProtocol));
//
//	OCMStub([outputProtocol searchingFinishedWithWord:[OCMArg anyPointer]]);
//
////	[[[outputProtocol stub] andCall:@selector(searchFinished:) onObject:self] searchingFinishedWithWord:(AIP_WordModel *) [OCMArg any]];
//	self.networkService.outputDelegate = outputProtocol;
//
//	NSString *request = @"test";
//	[self.networkService searchDefinitionsForString:request];
//
//	// Проверка результатов
//	//XCTAssert(array.count == 0);
}

- (AIP_WordModel *)searchFinished:(AIP_WordModel *)model
{
	NSLog(@"here!");
	return model;
}

@end
