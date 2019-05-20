//
//  NetworkOutputProtocolImpForTest.h
//  ios-final-project-1Tests
//
//  Created by Александр Плесовских on 20/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AIP_NetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkOutputProtocolImpForTest : NSObject<AIP_NetworkServiceOutputProtocol>

@property (nonatomic, nullable, strong) AIP_WordModel *wordModel;

@end

NS_ASSUME_NONNULL_END
