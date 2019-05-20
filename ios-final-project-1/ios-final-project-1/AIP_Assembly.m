//
//  AIP_Assembly.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "AIP_Assembly.h"
#import "AIP_SearchPresenter.h"
#import "AIP_SearchViewController.h"
#import "AIP_DictionaryPresenter.h"
#import "AIP_DictionaryViewController.h"
#import "AIP_CoreDataService.h"
#import "AIP_NetworkService.h"
#import "AIP_NotificationService.h"


@implementation AIP_Assembly


/**
 Собирает таббар контроллер со всеми контроллерами

 @return таббар контроллер для window
 */
- (UIViewController *) assemblyTabbarController
{
	UIViewController *searchViewController = [self assemblySearchScreen];
	searchViewController.tabBarItem.image = [UIImage imageNamed:@"TabbarSearch"];
	searchViewController.tabBarItem.title = @"Поиск";
	
	UIViewController *dictionaryViewController = [self assemblyDictionaryScreen];
	dictionaryViewController.tabBarItem.image = [UIImage imageNamed:@"TabbarDictionary"];
	dictionaryViewController.tabBarItem.title = @"Словарь";
	
	NSArray *viewControllerArray = @[searchViewController, dictionaryViewController];
	
	UITabBarController *tabBarViewController = [UITabBarController new];
	tabBarViewController.tabBar.translucent = YES;
	
	tabBarViewController.viewControllers = viewControllerArray;
	tabBarViewController.selectedIndex = 0;
	
	return tabBarViewController;
}

/**
 Собирает контроллер для поиска по архитектуре MVP

 @return Возвращает контроллер для экрана поиска
 */
- (UIViewController *) assemblySearchScreen
{
	AIP_SearchViewController *viewController = [AIP_SearchViewController new];
	AIP_SearchPresenter *presenter = [AIP_SearchPresenter new];
	AIP_NetworkService *networkService = [AIP_NetworkService initService];
	AIP_CoreDataService *coreDataService = [AIP_CoreDataService new];
	AIP_NotificationService *notificationService = [AIP_NotificationService new];
	
	presenter.networkService = networkService;
	networkService.outputDelegate = presenter;
	presenter.coreDataService = coreDataService;
	presenter.notificationService = notificationService;
	presenter.view = viewController;
	
	viewController.presenter = presenter;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	return navigationController;
}

/**
 Собирает контроллер для словаря по архитектуре MVP
 
 @return Возвращает контроллер для экрана словаря
 */
- (UIViewController *) assemblyDictionaryScreen
{
	
	AIP_DictionaryViewController *viewController = [AIP_DictionaryViewController new];
	AIP_DictionaryPresenter *presenter = [AIP_DictionaryPresenter new];
	AIP_CoreDataService *coreDataService = [AIP_CoreDataService new];
	
	presenter.coreDataService = coreDataService;
	presenter.view = viewController;
	viewController.presenter = presenter;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	return navigationController;
}

@end
