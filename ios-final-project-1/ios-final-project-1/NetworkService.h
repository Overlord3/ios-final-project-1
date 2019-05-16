//
//  NetworkService.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NetworkServiceProtocol.h"


@interface NetworkService : NSObject<NetworkServiceInputProtocol, NSURLSessionDelegate>

/**
 Инициализатор сервиса
 
 @return Объект NetworkService
 */
+ (instancetype)initService;

@property (nonatomic, weak) id<NetworkServiceOutputProtocol> outputDelegate; /**< Делегат внешних событий */

@end
