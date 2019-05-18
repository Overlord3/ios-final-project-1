//
//  SearchPresenter.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SearchPresenterProtocol.h"
#import "CoreDataServiceProtocol.h"
#import "NetworkServiceProtocol.h"
#import "NotificationServiceProtocol.h"
#import "SearchViewProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface SearchPresenter : NSObject<SearchPresenterProtocol, NetworkServiceOutputProtocol>

@property (nonatomic, nullable, weak) id<SearchViewProtocol> view; /**< Вью, держит weak, так как вью держит презентер strong ссылкой */
@property (nonatomic, nonnull, strong) id<NotiticationServiceProtocol> notificationService; /**< Сервис для уведомлений */
@property (nonatomic, nonnull, strong) id<NetworkServiceInputProtocol> networkService; /**< Сервис для взаимодействия с сетью */
@property (nonatomic, nonnull, strong) id<CoreDataServiceProtocol> coreDataService; /**< Сервис для сохранения данных */

@end

NS_ASSUME_NONNULL_END
