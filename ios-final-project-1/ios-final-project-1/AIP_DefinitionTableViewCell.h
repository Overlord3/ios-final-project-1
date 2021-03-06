//
//  AIP_DefinitionTableViewCell.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 04/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface AIP_DefinitionTableViewCell : UITableViewCell

@property (nonatomic, nonnull, strong) UILabel *definitionLabel; /**< Лейбл для определения слова */
@property (nonatomic, nonnull, strong) UILabel *exampleLabel; /**< Лейбл для примеров использования */
@property (nonatomic, nonnull, strong) UILabel *authorLabel; /**< Лейбл для имени автора */
@property (nonatomic, nonnull, strong) UILabel *dateLabel; /**< Лейбл для даты */

/**
 Функция для вычисления высоты ячейки, на основе параметров

 @param definition Текст определения
 @param example Текст примера
 @param author Текст автора
 @param date Текст даты
 @return Высота ячейки
 */
+ (CGFloat)calculateHeightWithDefinition:(NSString *)definition example:(NSString *)example author:(NSString *)author date:(NSString *)date;

@end

NS_ASSUME_NONNULL_END
