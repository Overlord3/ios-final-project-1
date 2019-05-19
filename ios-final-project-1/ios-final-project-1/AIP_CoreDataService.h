//
//  AIP_CoreDataService.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AIP_CoreDataServiceProtocol.h"
#import "AIP_WordModel.h"


NS_ASSUME_NONNULL_BEGIN


@interface AIP_CoreDataService : NSObject<AIP_CoreDataServiceProtocol>

@property (nonatomic, nullable, strong) NSManagedObjectContext *coreDataContext; /**< Контекст для сохранения данных */

@end

NS_ASSUME_NONNULL_END
