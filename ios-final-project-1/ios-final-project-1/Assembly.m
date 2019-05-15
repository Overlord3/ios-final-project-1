//
//  Assembly.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "Assembly.h"
#import "SearchPresenter.h"
#import "SearchViewController.h"
#import "DictionaryPresenter.h"
#import "DictionaryViewController.h"
#import "CoreDataService.h"
#import "NetworkService.h"
#import "NotificationService.h"


@implementation Assembly


/**
 Собирает таббар контроллер со всеми контроллерами

 @return таббар контроллер для window
 */
- (UIViewController *) assemblyTabbarController
{
	UIViewController *searchViewController = [self assemblySearchScreen];
	searchViewController.tabBarItem.image = [UIImage imageNamed:@"TabbarSearch"];
	searchViewController.tabBarItem.title = @"Поиск определений слов";
	
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
	SearchViewController *viewController = [SearchViewController new];
	SearchPresenter *presenter = [SearchPresenter new];
	NetworkService *networkService = [NetworkService initService];
	CoreDataService *coreDataService = [CoreDataService new];
	NotificationService *notificationService = [NotificationService new];
	
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
	
	DictionaryViewController *viewController = [DictionaryViewController new];
	DictionaryPresenter *presenter = [DictionaryPresenter new];
	CoreDataService *coreDataService = [CoreDataService new];
	
	presenter.coreDataService = coreDataService;
	presenter.view = viewController;
	viewController.presenter = presenter;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	return navigationController;
}

@end
