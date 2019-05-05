//
//  CoreDataService.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 05/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "WordModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataService : NSObject

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;

- (WordModel *) findWordWithSearchString:(NSString *)searchString;

- (void) saveWordModel:(WordModel *)wordModel;


@end

NS_ASSUME_NONNULL_END
