//
//  DefinitionTableViewCell.h
//  ios-final-project-1
//
//  Created by Александр Плесовских on 04/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface DefinitionTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *definitionLabel;
@property (nonatomic, strong) UILabel *exampleLabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *dateLabel;



+ (CGFloat)calculateHeightWithDefinition:(NSString *)definition example:(NSString *)example author:(NSString *)author date:(NSString *)date;

- (CGFloat)getCellHeight;

@end

NS_ASSUME_NONNULL_END
