//
//  DestinationDetails.m
//  Navigation Controller
//
//  Created by Luis de Jesus Martin Castillo on 24/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "DestinationDetails.h"

@interface DestinationDetails ()

@end

@implementation DestinationDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initController{
    _lblTitle.text = _destinationTitle;
    _lblDescription.text = _destinationDescription;
    _imgDestination.image = [UIImage imageNamed:_destinationPhoto];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
