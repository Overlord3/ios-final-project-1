//
//  NotificationServiceProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef NotificationServiceProtocol_h
#define NotificationServiceProtocol_h


@protocol NotiticationServiceProtocol <NSObject>

/**
 Создает запрос на основе данных и добавляет действия
 
 @param seconds Через сколько секунд срабатывание уведомления
 @param title Заголовок уведомления
 @param text Текст для уведомления
 */
- (void) sendLocalNotificationAfterSeconds:(NSInteger)seconds withTitle:(NSString *)title andText:(NSString *)text;

@end

#endif /* NotificationServiceProtocol_h */
