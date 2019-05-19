//
//  AIP_SearchPresenter.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AIP_SearchPresenterProtocol.h"
#import "AIP_CoreDataServiceProtocol.h"
#import "AIP_NetworkServiceProtocol.h"
#import "AIP_NotificationServiceProtocol.h"
#import "AIP_SearchViewProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface AIP_SearchPresenter : NSObject<AIP_SearchPresenterProtocol, AIP_NetworkServiceOutputProtocol>

@property (nonatomic, nullable, weak) id<AIP_SearchViewProtocol> view; /**< Вью, держит weak, так как вью держит презентер strong ссылкой */
@property (nonatomic, nonnull, strong) id<AIP_NotificationServiceProtocol> notificationService; /**< Сервис для уведомлений */
@property (nonatomic, nonnull, strong) id<NetworkServiceInputProtocol> networkService; /**< Сервис для взаимодействия с сетью */
@property (nonatomic, nonnull, strong) id<AIP_CoreDataServiceProtocol> coreDataService; /**< Сервис для сохранения данных */

@end

NS_ASSUME_NONNULL_END
