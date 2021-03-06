//
//  AIP_DefinitionsViewController.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 16/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "AIP_DefinitionsViewController.h"
#import "AIP_DefinitionTableViewCell.h"


@interface AIP_DefinitionsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, nonnull, strong) UITableView *tableView; /**< UI для отображения определений */

@end


@implementation AIP_DefinitionsViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self prepareUI];
	[self.tableView registerClass:AIP_DefinitionTableViewCell.class forCellReuseIdentifier:AIP_DefinitionTableViewCell.description];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.title = @"Определения";
}

/**
 Инициализация UI
 */
- (void)prepareUI
{
	self.view.backgroundColor = UIColor.whiteColor;
	//Отступ сверху для навигейшн бара
	CGFloat topInset = CGRectGetMaxY(self.navigationController.navigationBar.frame);
	CGFloat screenHeight = UIScreen.mainScreen.bounds.size.height;
	CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
	
	//Инициализация тейбл вью
	self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topInset, screenWidth, screenHeight - topInset) style:UITableViewStylePlain];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	self.tableView.allowsSelection = NO;
	self.tableView.separatorColor = UIColor.blackColor;
	self.tableView.separatorInset = UIEdgeInsetsZero;
	self.tableView.tableFooterView = [UIView new];
	
	[self.view addSubview:self.tableView];
}


#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.wordModel.definitions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	AIP_DefinitionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AIP_DefinitionTableViewCell.description forIndexPath:indexPath];
	
	AIP_DefinitionModel *model = self.wordModel.definitions[indexPath.row];
	cell.definitionLabel.text = [model getDefinitionForLabel:indexPath.row + 1];
	cell.exampleLabel.text = [model getExampleForLabel];
	cell.authorLabel.text = [model getAuthorForLabel];
	cell.dateLabel.text = [model getDateForLabel];
	if (indexPath.row % 2 == 0)
	{
		cell.contentView.backgroundColor = UIColor.groupTableViewBackgroundColor;
	}
	else
	{
		cell.contentView.backgroundColor = UIColor.whiteColor;
	}
	return cell;
}


#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	AIP_DefinitionModel *model = self.wordModel.definitions[indexPath.row];
	CGFloat height = [AIP_DefinitionTableViewCell
					  calculateHeightWithDefinition:[model getDefinitionForLabel:1]
					  example:[model getExampleForLabel]
					  author:[model getAuthorForLabel]
					  date:[model getDateForLabel]];
	return height;
}

@end
