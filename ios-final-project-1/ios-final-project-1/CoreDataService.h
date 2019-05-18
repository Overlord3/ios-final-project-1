//
//  CoreDataService.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CoreDataServiceProtocol.h"
#import "WordModel.h"


NS_ASSUME_NONNULL_BEGIN


@interface CoreDataService : NSObject<CoreDataServiceProtocol>

@property (nonatomic, nullable, strong) NSManagedObjectContext *coreDataContext; /**< Контекст для сохранения данных */

@end

NS_ASSUME_NONNULL_END
