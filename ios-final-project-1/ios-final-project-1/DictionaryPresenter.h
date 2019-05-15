//
//  DictionaryPresenter.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "DictionaryPresenterProtocol.h"
#import "DictionaryViewProtocol.h"
#import "CoreDataServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface DictionaryPresenter : NSObject<DictionaryPresenterProtocol>

@property(nonatomic, weak) id<DictionaryViewProtocol> view; /**< Вью, держит weak, так как вью держит презентер strong ссылкой */

@property (nonatomic, strong) id<CoreDataServiceProtocol> coreDataService; /**< Сервис для сохранения данных */

@end

NS_ASSUME_NONNULL_END
