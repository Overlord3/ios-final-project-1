//
//  AIP_DictionaryPresenter.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AIP_DictionaryPresenterProtocol.h"
#import "AIP_DictionaryViewProtocol.h"
#import "AIP_CoreDataServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface AIP_DictionaryPresenter : NSObject<AIP_DictionaryPresenterProtocol>

@property(nonatomic, nullable, weak) id<AIP_DictionaryViewProtocol> view; /**< Вью, держит weak, так как вью держит презентер strong ссылкой */

@property (nonatomic, nonnull, strong) id<AIP_CoreDataServiceProtocol> coreDataService; /**< Сервис для сохранения данных */

@end

NS_ASSUME_NONNULL_END
