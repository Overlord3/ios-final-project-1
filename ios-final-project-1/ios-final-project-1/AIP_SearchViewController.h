//
//  AIP_SearchViewController.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AIP_SearchViewProtocol.h"
#import "AIP_SearchPresenterProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface AIP_SearchViewController : UIViewController<AIP_SearchViewProtocol>

@property(nonatomic, nonnull, strong) id<AIP_SearchPresenterProtocol> presenter; /**< Презентер этого вью */

@end

NS_ASSUME_NONNULL_END
