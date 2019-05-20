//
//  AIP_SearchViewController.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "AIP_SearchViewController.h"
#import "AIP_DefinitionTableViewCell.h"


@interface AIP_SearchViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, nonnull, strong) UITableView *tableView; /**< UI для отображения результатов поиска */
@property (nonatomic, nonnull, strong) UISearchBar *searchBar; /**< UI для строки поиска */

@property (nonatomic, nullable, strong) AIP_WordModel *wordModel; /**< Слово с определениями для отображения */

@end


@implementation AIP_SearchViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self prepareUI];
	[self.tableView registerClass:AIP_DefinitionTableViewCell.class forCellReuseIdentifier:AIP_DefinitionTableViewCell.description];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.title = @"Поиск";
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
	
	//Инициализация серч бара
	CGFloat searchBarHeight = 50;
	self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, topInset, screenWidth, searchBarHeight)];
	[self.searchBar setPlaceholder:@"Введите слово для поиска (англ.)"];
	self.searchBar.delegate = self;
	[self.view addSubview:self.searchBar];
	
	self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), screenWidth, screenHeight - searchBarHeight - topInset) style:UITableViewStylePlain];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	self.tableView.allowsSelection = NO;
	self.tableView.separatorColor = UIColor.blackColor;
	self.tableView.separatorInset = UIEdgeInsetsZero;
	self.tableView.tableFooterView = [UIView new];
	
	[self.view addSubview:self.tableView];
}


#pragma UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	//скрыть клавиатуру
	[searchBar resignFirstResponder];
	
	//Сообщить презентеру о действия пользователя
	[self.presenter searchWithText:searchBar.text];
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


#pragma ViewProtocol

/**
 Возвращает данные в контроллер, когда запрос выполнен
 
 @param word Слово и определения к нему
 */
- (void)searchingFinishedWithWord:(AIP_WordModel *)word
{
	self.wordModel = word;
	[self.tableView reloadData];
}

/**
Показывает алерт с заголовком и сообщением и действием ОК

@param title Заголовок сообщения
@param message Текст сообщения
*/
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ок" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[alertController dismissViewControllerAnimated:true completion:nil];
	}];
	
	[alertController addAction:alertAction];
	
	[self presentViewController:alertController animated:true completion:nil];
}

@end
