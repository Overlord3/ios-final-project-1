//
//  SearchViewController.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SearchViewProtocol.h"
#import "SearchPresenterProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface SearchViewController : UIViewController<SearchViewProtocol>

@property(nonatomic, nonnull, strong) id<SearchPresenterProtocol> presenter; /**< Презентер этого вью */

@end

NS_ASSUME_NONNULL_END
