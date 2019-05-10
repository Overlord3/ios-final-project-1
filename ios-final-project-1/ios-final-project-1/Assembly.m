//
//  Assembly.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "Assembly.h"


@implementation Assembly


/**
 Собирает архитектуру MVP,

 @return Возвращает рутконтроллер для window
 */
- (UIViewController *) assemblySearchScreen
{
	ViewController *viewController = [ViewController new];
	Presenter *presenter = [Presenter new];
	
	viewController.presenter = presenter;
	presenter.view = viewController;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	return navigationController;
}

@end
