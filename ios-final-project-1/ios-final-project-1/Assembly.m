//
//  Assembly.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "Assembly.h"
#import "ViewController.h"
#import "Presenter.h"
#import "CoreDataService.h"
#import "NetworkService.h"
#import "NotificationService.h"


@implementation Assembly


/**
 Собирает архитектуру MVP,

 @return Возвращает рутконтроллер для window
 */
- (UIViewController *) assemblySearchScreen
{
	ViewController *viewController = [ViewController new];
	Presenter *presenter = [Presenter new];
	NetworkService *networkService = [NetworkService initService];
	CoreDataService *coreDataService = [CoreDataService new];
	NotificationService *notificationService = [NotificationService new];
	
	presenter.networkService = networkService;
	presenter.coreDataService = coreDataService;
	presenter.notificationService = notificationService;
	presenter.view = viewController;
	
	viewController.presenter = presenter;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	return navigationController;
}

@end
