//
//  ViewController.m
//  Navigation Controller
//
//  Created by Luis de Jesus Martin Castillo on 24/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Home.h"
#import "cellHome.h"

@interface Home ()
    @property NSMutableArray *destinationTitles;
    @property NSMutableArray *destinationImgs;
    @property NSMutableArray *destinationDescriptions;
@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table

-(void)initController{
    
    _destinationTitles = [[NSMutableArray alloc] initWithObjects:@"Cancún",@"Vallarta",@"Ibiza",@"Islandia",@"Marruecos",nil];
    
    _destinationImgs = [[NSMutableArray alloc] initWithObjects:@"dest01.png",@"dest02.png",@"dest03.png",@"dest04.png",@"dest05.png", nil];
    
    _destinationDescriptions = [[NSMutableArray alloc] initWithObjects:@"Un destino de lujo que todos quieren",@"Un destino de lujo que todos quieren",@"Un destino de lujo que todos quieren",@"Un destino de lujo que todos quieren",@"Un destino de lujo que todos quieren", nil];
    
}

#pragma  mark - Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_destinationTitles count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 190;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cellHome *cell = (cellHome*)[tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    
    if (cell == nil) {
        
        [tableView registerNib:[UINib nibWithNibName:@"cellHome" bundle:nil] forCellReuseIdentifier:@"cellHome"];
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    }
    
    cell.lblDestination.text = _destinationTitles[indexPath.row];
    cell.lblDesription.text = _destinationDescriptions[indexPath.row];
    cell.imgDestination.image = [UIImage imageNamed:_destinationImgs[indexPath.row]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*
    Details *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Details"];
    
    vc.gName = _games[indexPath.row];
    vc.consoles = [_gamesConsole[indexPath.row] integerValue];
    [self presentViewController:vc animated:YES completion:nil];
    */
}

@end
