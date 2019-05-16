//
//  DefinitionsViewController.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 16/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "DefinitionsViewController.h"
#import "DefinitionTableViewCell.h"


@interface DefinitionsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; /**< UI для отображения определений */

@end


@implementation DefinitionsViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self prepareUI];
	[self.tableView registerClass:DefinitionTableViewCell.class forCellReuseIdentifier:DefinitionTableViewCell.description];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.title = @"Определения слов";
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
	DefinitionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefinitionTableViewCell.description forIndexPath:indexPath];
	
	DefinitionModel *model = self.wordModel.definitions[indexPath.row];
	cell.definitionLabel.text = [model getDefinitionForLabel];
	cell.exampleLabel.text = [model getExampleForLabel];
	cell.authorLabel.text = [model getAuthorForLabel];
	cell.dateLabel.text = [model getDateForLabel];
	
	return cell;
}


#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	DefinitionModel *model = self.wordModel.definitions[indexPath.row];
	CGFloat height = [DefinitionTableViewCell
					  calculateHeightWithDefinition:[model getDefinitionForLabel]
					  example:[model getExampleForLabel]
					  author:[model getAuthorForLabel]
					  date:[model getDateForLabel]];
	return height;
}

@end
