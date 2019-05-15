//
//  DictionaryViewController.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "DictionaryViewController.h"
#import "WordTableViewCell.h"


@interface DictionaryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; /**< UI для отображения результатов поиска */

@property (nonatomic, strong) NSArray<WordModel *> *dictionary; /**< Массив слов словаря с определениями для отображения */

@end


@implementation DictionaryViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self prepareUI];
	[self.tableView registerClass:WordTableViewCell.class forCellReuseIdentifier:WordTableViewCell.description];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.title = @"Словарь слов";
	self.dictionary = [self.presenter getDictionary];
	[self.tableView reloadData];
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
	self.tableView.tableFooterView = [UIView new];
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
	return self.dictionary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	WordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WordTableViewCell.description forIndexPath:indexPath];

	WordModel *model = self.dictionary[indexPath.row];
	cell.wordLabel.text = model.word;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}


#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	WordModel *model = self.dictionary[indexPath.row];
	CGFloat height = [WordTableViewCell calculateHeightWithWord:model.word];
	return height;
}


#pragma ViewProtocol

//Пока ничего тут нет

@end
