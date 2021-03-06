//
//  AIP_DictionaryViewController.m
//  ios-final-project-1
//
//  Created by Александр Плесовских on 15/05/2019.
//  Copyright © 2019 Alex. All rights reserved.
//


#import "AIP_DictionaryViewController.h"
#import "AIP_WordTableViewCell.h"


@interface AIP_DictionaryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, nonnull, strong) UITableView *tableView; /**< UI для отображения результатов поиска */

@property (nonatomic, nonnull, strong) NSArray<AIP_WordModel *> *dictionary; /**< Массив слов словаря с определениями для отображения */

@end


@implementation AIP_DictionaryViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self prepareUI];
	[self prepareNavigationBarAction];
	[self.tableView registerClass:AIP_WordTableViewCell.class forCellReuseIdentifier:AIP_WordTableViewCell.description];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.title = @"Словарь";
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

- (void)prepareNavigationBarAction
{
	UIBarButtonItem *clearDictionaryButton = [[UIBarButtonItem alloc] initWithTitle:@"Очистить" style:UIBarButtonItemStylePlain target:self action:@selector(showActionSheetForClearAction)];
	self.navigationItem.rightBarButtonItem = clearDictionaryButton;
}

- (void)showActionSheetForClearAction
{
	UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Очистка словаря" message:@"Вы уверены, что хотите удалить все данные?" preferredStyle:UIAlertControllerStyleActionSheet];
	//Строки с атрибутами
	NSMutableAttributedString *actionSheetTitle = [[NSMutableAttributedString alloc] initWithString:@"Очистка словаря"];
	[actionSheetTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17 weight:UIFontWeightMedium] range: NSMakeRange(0, actionSheetTitle.length)];
	[actionSheet setValue:actionSheetTitle forKey:@"attributedTitle"];
	
	NSMutableAttributedString *actionSheetMessage = [[NSMutableAttributedString alloc] initWithString:@"Вы уверены, что хотите удалить все данные?"];
	[actionSheetMessage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] range: NSMakeRange(0, actionSheetMessage.length)];
	[actionSheet setValue:actionSheetMessage forKey:@"attributedMessage"];
	
	[actionSheet addAction:[UIAlertAction actionWithTitle:@"Очистить" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action)
	{
		[self dismissViewControllerAnimated:YES completion:nil];
		// Удаляем все данные
		self.dictionary = [self.presenter clearDictionary];
		[self.tableView reloadData];
	}]];
	
	[actionSheet addAction:[UIAlertAction actionWithTitle:@"Отмена" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
	{
		//Просто убирает алерт
		[self dismissViewControllerAnimated:YES completion:nil];
	}]];
	
	[self presentViewController:actionSheet animated:YES completion:nil];
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
	AIP_WordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AIP_WordTableViewCell.description forIndexPath:indexPath];

	AIP_WordModel *model = self.dictionary[indexPath.row];
	cell.wordLabel.text = model.word;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}


#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	AIP_WordModel *model = self.dictionary[indexPath.row];
	CGFloat height = [AIP_WordTableViewCell calculateHeightWithWord:model.word];
	return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	AIP_WordModel *model = self.dictionary[indexPath.row];
	[self.presenter selectedTableCellWithWord:model];
}


#pragma UITableViewDelegate delete rows

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return @"Удалить";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		// Отправляет презентеру запрос на удаление слова
		[self.presenter deleteWordWithText:self.dictionary[indexPath.row].word];
		// Получает измененный словарь
		self.dictionary = [self.presenter getDictionary];
		[tableView reloadData];
	}
}

#pragma ViewProtocol

/**
 Добавляет контроллер поверх контроллера словаря
 необходимо для контроллера с определениями
 
 @param viewController вью контроллер
 */
- (void)pushViewController:(UIViewController *)viewController
{
	[self.navigationController pushViewController:viewController animated:YES];
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
