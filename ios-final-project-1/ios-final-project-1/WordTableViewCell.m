//
//  WordTableViewCell.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "WordTableViewCell.h"


@implementation WordTableViewCell

/**
 Инициализатор ячейки
 
 @param style стиль
 @param reuseIdentifier идентификатор
 @return экземпляр класса ячейки
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	_wordLabel = [UILabel new];
	return self;
}

/**
 Расстановка элементов UI в ячейке
 */
- (void)layoutSubviews
{
	//Всего высота - вычисляемая
	[super layoutSubviews];
	
	CGFloat width = self.bounds.size.width;
	CGFloat border = 8;
	CGSize maximumLabelSize = CGSizeMake(width - 2*border, 9999);
	
	//Лейбл для слова
	self.wordLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
	self.wordLabel.textAlignment = NSTextAlignmentLeft;
	self.wordLabel.numberOfLines = 0;
	//вычисляем размер
	CGSize expectedLabelSize = [self.wordLabel sizeThatFits:maximumLabelSize];
	self.wordLabel.frame = CGRectMake(border, border, width - border*2, expectedLabelSize.height);
	[self.contentView addSubview:self.wordLabel];
}

/**
 Функция для вычисления высоты ячейки, на основе параметров
 
 @param word Слово
 @return Высота ячейки
 */
+ (CGFloat)calculateHeightWithWord:(NSString *)word
{
	CGFloat width = UIScreen.mainScreen.bounds.size.width;
	CGFloat border = 8;
	CGSize maximumLabelSize = CGSizeMake(width - 2*border, 9999);
	UILabel *testLabel = [UILabel new];
	
	CGFloat cellHeight = 0;
	
	//Лейбл для слова
	testLabel.textAlignment = NSTextAlignmentLeft;
	testLabel.numberOfLines = 0;
	testLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
	testLabel.text = word;
	cellHeight += border + [testLabel sizeThatFits:maximumLabelSize].height + border;
	
	return cellHeight;
}


@end
