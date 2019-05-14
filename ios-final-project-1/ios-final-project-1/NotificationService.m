//
//  NotificationService.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "NotificationService.h"
#import <UserNotifications/UserNotifications.h>


static NSString * const identifierForActions = @"AIPcategory";


@implementation NotificationService

/**
 Создает запрос на основе данных и добавляет действия
 
 @param seconds Через сколько секунд срабатывание уведомления
 @param title Заголовок уведомления
 @param text Текст для уведомления
 */
- (void) sendLocalNotificationAfterSeconds:(NSInteger)seconds withTitle:(NSString *)title andText:(NSString *)text
{
	// Создадим Notification Request с контентом и триггером и отправим
	[self scheduleLocalNotificationAfterSeconds:seconds withTitle:title andText:text];
	// Добавим действия к этой категории
	[self addCustomActions];
}

/**
 Создает запрос на основе данных
 
 @param seconds Через сколько секунд срабатывание уведомления
 @param title Заголовок уведомления
 @param text Текст для уведомления
 */
- (void)scheduleLocalNotificationAfterSeconds:(NSInteger)seconds withTitle:(NSString *)title andText:(NSString *)text
{
	/* Контент - сущность класса UNMutableNotificationContent
	 Содержит в себе:
	 title: Заголовок, обычно с основной причиной показа пуша
	 subtitle: Подзаговолок, не обязателен
	 body: Тело пуша
	 badge: Номер бейджа для указания на иконке приложения
	 sound: Звук, с которым покажется push при доставке. Можно использовать default или установить свой из файла.
	 launchImageName: имя изображения, которое стоит показать, если приложение запущено по тапу на notification.
	 userInfo: Кастомный словарь с данными
	 attachments: Массив UNNotificationAttachment. Используется для включения аудио, видео или графического контента.
	 */
	UNMutableNotificationContent *content = [UNMutableNotificationContent new];
	content.title = @"Напоминание!";
	content.body = title;
	content.sound = [UNNotificationSound defaultSound];
	
	NSDictionary *dict = @{
						   @"text": text
						   };
	content.userInfo = dict;
	
	// Добавляем свою категорию
	content.categoryIdentifier = identifierForActions;
	
	// Создаем триггер
	UNNotificationTrigger *whateverTrigger = [self intervalTriggerAfterSeconds:seconds repeats:NO];
	// Отправка уведомления
	[self sendRequestWithContent:content andTrigger:whateverTrigger];
}

/**
 Генерирует и отправляет запрос с контентом и триггером
 
 @param content основной контент
 @param trigger условие срабатывания (время)
 */
- (void)sendRequestWithContent:(UNMutableNotificationContent *)content andTrigger:(UNNotificationTrigger *)trigger
{
	NSString *identifier = @"NotificationId";
	UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
	
	UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
	[center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error)
	 {
		 if (error)
		 {
			 NSLog(@"Ошибка - %@",error);
		 }
	 }];
}


#pragma mark Условия срабатывания, Trigger

/**
 Создает триггер на уведомление по интервалу, через N секунд
 
 @param seconds количество секунд с текущей даты
 @param repeat повторять ли уведомление через интервал или нет
 @return Триггер для уведомления
 */
- (UNTimeIntervalNotificationTrigger *)intervalTriggerAfterSeconds:(NSInteger)seconds repeats:(BOOL)repeat
{
	return [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:seconds repeats:repeat];
}


#pragma mark Добавление действий к уведомлению, Actions

/**
 Добавим основные действия:
 Открыть приложение и Скрыть уведомление
 */
- (void)addCustomActions
{
	UNNotificationAction *checkAction = [UNNotificationAction actionWithIdentifier:@"CheckID" title:@"Открыть приложение" options:UNNotificationActionOptionForeground];
	
	UNNotificationAction *deleteAction = [UNNotificationAction actionWithIdentifier:@"DeleteID" title:@"Скрыть" options:UNNotificationActionOptionDestructive];
	
	// Создаем кастомную категорию
	UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:identifierForActions actions:@[checkAction,deleteAction] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
	NSSet *categories = [NSSet setWithObject:category];
	
	// Устанавливаем ее для notificationCenter
	UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
	[center setNotificationCategories:categories];
}

@end
