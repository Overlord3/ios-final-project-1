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
 Собирает таббар контроллер со всеми контроллерами

 @return таббар контроллер для window
 */
- (UIViewController *) assemblyTabbarController
{
	UIViewController *searchViewController = [self assemblySearchScreen];
	searchViewController.tabBarItem.image = [UIImage imageNamed:@"TabbarSearch"];
	searchViewController.tabBarItem.title = @"Поиск определений слов";
	
	UIViewController *searchViewController2 = [self assemblySearchScreen];
	searchViewController2.tabBarItem.image = [UIImage imageNamed:@"TabbarDictionary"];
	searchViewController2.tabBarItem.title = @"Словарь";
	
	NSArray *viewControllerArray = @[searchViewController, searchViewController2];
	
	UITabBarController *tabBarViewController = [UITabBarController new];
	tabBarViewController.tabBar.translucent = YES;
	
	tabBarViewController.viewControllers = viewControllerArray;
	tabBarViewController.selectedIndex = 0;
	
	return tabBarViewController;
}

/**
 Собирает архитектуру MVP,

 @return Возвращает контроллер для экрана поиска
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
