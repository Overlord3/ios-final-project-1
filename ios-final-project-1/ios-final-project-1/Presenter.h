//
//  Presenter.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "CoreDataService.h"
#import "NetworkService.h"
#import "NotificationService.h"
#import "ViewProtocol.h"
#import "PresenterProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface Presenter : NSObject<PresenterProtocol, NetworkServiceOutputProtocol>

@property(nonatomic, weak) id<ViewProtocol> view; /**< Вью */

@property (nonatomic, strong) NotificationService *notificationService; /**< Сервис для уведомлений */
@property (nonatomic, strong) NetworkService *networkService; /**< Сервис для взаимодействия с сетью */
@property (nonatomic, strong) CoreDataService *coreDataService; /**< Сервис для сохранения данных */

@end

NS_ASSUME_NONNULL_END
