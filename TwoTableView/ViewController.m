//
//  ViewController.m
//  TwoTableView
//
//  Created by TuFa on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"


#define KSCreenWith [UIScreen mainScreen].bounds.size.width
#define KSCreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableV1;
    UITableView *tableV2;
    
    NSInteger tableV2_row;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatTableView];
    NSLog(@"----");
    //选中tableV1的第一行
    [self tableView:tableV1 didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [tableV1 selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

-(void)creatTableView{
    
    tableV1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, KSCreenWith/2, KSCreenHeight-20) style:UITableViewStylePlain];
    tableV1.delegate = self;
    tableV1.dataSource = self;
    [self.view addSubview:tableV1];
    
    tableV2 = [[UITableView alloc]initWithFrame:CGRectMake(KSCreenWith/2, 20, KSCreenWith/2, KSCreenHeight-20) style:UITableViewStylePlain];
    tableV2.backgroundColor = [UIColor orangeColor];
    tableV2.delegate = self;
    tableV2.dataSource = self;
    [self.view addSubview:tableV2];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (tableView == tableV1) {
        
        return 20;
    }else{
        return tableV2_row;
    }
    
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //表1
    if (tableView == tableV1) {
        
        static NSString *cellId = @"identify";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"表1_第%ld行",(long)indexPath.row];
    return cell;
    }
    
    //表2
    static NSString *cellId2 = @"cell";
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellId2];
    
    if (!cell2) {
        
        cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId2];
    }
    cell2.backgroundColor = [UIColor orangeColor];
    cell2.textLabel.text = [NSString stringWithFormat:@"表2_第%ld行",(long)indexPath.row];
    return cell2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    tableV2_row = 1+arc4random_uniform(15);//随机数1-15行
    [tableV2 reloadData];
}


@end
