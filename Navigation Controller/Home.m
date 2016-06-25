//
//  ViewController.m
//  Navigation Controller
//
//  Created by Luis de Jesus Martin Castillo on 24/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Home.h"
#import "cellHome.h"
#import "DestinationDetails.h"

@interface Home ()
    @property NSMutableArray *destinationTitles;
    @property NSMutableArray *destinationImgs;
    @property NSMutableArray *destinationDescriptions;
    @property NSString *titleSelected;
    @property NSString *descriptionSelected;
    @property NSString *photoSelected;
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

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    //Reassure that cell its in its place (WaGo)
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
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
    
    _titleSelected = _destinationTitles[indexPath.row];
    _descriptionSelected = _destinationDescriptions[indexPath.row];
    _photoSelected = _destinationImgs[indexPath.row];
    
    [self performSegueWithIdentifier:@"DestinationDetails" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.destinationViewController isKindOfClass:[DestinationDetails class]]){
        
        DestinationDetails *destination = [segue destinationViewController];
        
        destination.destinationTitle = _titleSelected;
        destination.destinationDescription = _descriptionSelected;
        destination.destinationPhoto = _photoSelected;
        
    }
}

@end
