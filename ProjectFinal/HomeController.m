//
//  ViewController.m
//  ProjectFinal
//
//  Created by Annalicia Ostos on 01/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()

@property ObjectResponse *object;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadView{

    NSString *name = @"annalicia";
    
    mjsonPayments = [WebServices getPaymentsForUser:name];
    
    self.object = [Parser parseGeoObject];
    
}

/**********************************************************************************************/
#pragma mark - Table methods and delegates
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellPayment *cell = (cellPayment *)[tableView dequeueReusableCellWithIdentifier:@"cellPayment"];
    
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellPayment" bundle:nil] forCellReuseIdentifier:@"cellPayment"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellPayment"];
    }
    //Fill cell with info from arrays
    //cell.nameCell.text       = self.hotelNames[indexPath.row];
    //cell.imageCell.image   = [UIImage imageNamed:self.hotelImgs[indexPath.row]];*/
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //self.titleTable.text = self.hotelNames[indexPath.row];
}

@end
