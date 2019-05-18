//
//  WordTableViewCell.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface WordTableViewCell : UITableViewCell

@property (nonatomic, nonnull, strong) UILabel *wordLabel; /**< Лейбл для слова */

/**
 Функция для вычисления высоты ячейки, на основе параметров

 @param word Слово
 @return Высота ячейки
 */
+ (CGFloat)calculateHeightWithWord:(NSString *)word;

@end

NS_ASSUME_NONNULL_END
