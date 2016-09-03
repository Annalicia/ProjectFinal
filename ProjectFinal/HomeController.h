//
//  ViewController.h
//  ProjectFinal
//
//  Created by Annalicia Ostos on 01/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellPayment.h"
#import "WebServices.h"
#import "Declarations.h"
#import "ObjectMapper.h"

@interface HomeController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tablePayment;
@property (strong, nonatomic) IBOutlet UINavigationItem *btnAddPaymen;
- (IBAction)addPayment:(id)sender;

@end

