//
//  AIP_NetworkService.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AIP_NetworkServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface AIP_NetworkService : NSObject<AIP_NetworkServiceInputProtocol, NSURLSessionDelegate>

/**
 Инициализатор сервиса
 
 @return Объект NetworkService
 */
+ (instancetype)initService;

@property (nonatomic, nullable, weak) id<AIP_NetworkServiceOutputProtocol> outputDelegate; /**< Делегат внешних событий */

@end

NS_ASSUME_NONNULL_END
