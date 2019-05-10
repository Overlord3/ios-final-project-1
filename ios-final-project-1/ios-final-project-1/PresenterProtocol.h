//
//  PresenterProtocol.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 10/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef PresenterProtocol_h
#define PresenterProtocol_h

@protocol PresenterProtocol <NSObject>


/**
 Отправляет запрос на поиск определений слова

 @param searchText Текст для поиска
 */
- (void)searchWithText:(NSString *)searchText;



@end

#endif /* PresenterProtocol_h */
