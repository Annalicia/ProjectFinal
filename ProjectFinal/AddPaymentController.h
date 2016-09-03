//
//  AddPaymentController.h
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Declarations.h"

@interface AddPaymentController : UIViewController

@property NSString *idPayment;
@property NSString *namePayment;
@property NSString *amountPayment;
@property NSString *datePayment;

@property (strong, nonatomic) IBOutlet UITextField *nameEdit;
@property (strong, nonatomic) IBOutlet UITextField *amountEdit;
@property (strong, nonatomic) IBOutlet UITextField *dateEdit;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;
@property (strong, nonatomic) IBOutlet UIButton *deleteBtn;

- (IBAction)formAdd:(id)sender;
- (IBAction)deletePayment:(id)sender;

@end
