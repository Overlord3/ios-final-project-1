//
//  ViewController.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 03/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "ViewController.h"
#import "NetworkService.h"
#import "NotificationService.h"
#import "DefinitionTableViewCell.h"


@interface ViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DefinitionTableViewCell *testCell; /**< Ячейка для измерения размера */
@property (nonatomic, strong) UISearchBar *searchBar;


@property (nonatomic, strong) WordModel *wordModel; /**< Слово с определениями для отображения */

@property (nonatomic, strong) NSString *previousRequest; /**< Предыдущий запрос, нужен для уведомлений */

@property (nonatomic, strong) NotificationService *notificationService; /**< Сервис для уведомлений */
@property (nonatomic, strong) NetworkService *networkService; /**< Сервис для взаимодействия с сетью */

@end


@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	

	[self prepareModels];
	[self prepareUI];
	[self.tableView registerClass:DefinitionTableViewCell.class forCellReuseIdentifier:DefinitionTableViewCell.description];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.title = @"Поиск определений слов";
}

- (void)prepareModels
{
	self.networkService = [NetworkService initService];
	self.networkService.outputDelegate = self;
	self.testCell = [DefinitionTableViewCell new];
}

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

	
	self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchBar.frame), screenWidth, screenHeight - searchBarHeight) style:UITableViewStylePlain];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	
	[self.view addSubview:self.tableView];
}


#pragma UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	//скрыть клавиатуру
	[searchBar resignFirstResponder];
	
	//Отправить уведомление про прошлый поиск
	if (self.previousRequest == nil)
	{
		self.previousRequest = searchBar.text;
	}
	else
	{
		//Сформируем и отправим
		NSString *title = [NSString stringWithFormat:@"Вы давно не смотрели определение слова - %@!", self.previousRequest];
		[self.notificationService sendLocalNotificationAfterSeconds:10 withTitle:title andSearchText: self.previousRequest];
		//Перезапишем предыдущий запрос
		self.previousRequest = searchBar.text;
	}
	//Вызвать поиск
	[self.networkService searchDefinitionsForString:searchBar.text];
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
	
	cell.definitionLabel.text = [model getDefinition];
	cell.exampleLabel.text = [model getExample];
	cell.authorLabel.text = [model getAuthor];
	cell.dateLabel.text = [model getDate].description;
	
	return cell;
}

#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	DefinitionModel *model = self.wordModel.definitions[indexPath.row];
	CGFloat height = [DefinitionTableViewCell
					  calculateHeightWithDefinition:[model getDefinition]
					  example:[model getExample]
					  author:[model getAuthor]
					  date:[model getDate].description];
	return height;
}


- (void)searchingFinishedWithWord:(WordModel *)word
{
	self.wordModel = word;
	[self.tableView reloadData];
}

@end
