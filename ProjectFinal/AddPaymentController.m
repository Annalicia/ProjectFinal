//
//  AddPaymentController.m
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import "AddPaymentController.h"
#import "HomeController.h"

@interface AddPaymentController ()
@property ObjectResponse *object;
@end

@implementation AddPaymentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(_idPayment){
        _deleteBtn.hidden = false;
    }
    
    self.nameEdit.text        = self.namePayment;
    self.amountEdit.text    = self.amountPayment;
    self.dateEdit.text   = self.datePayment;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)formAdd:(id)sender {
    
    NSString *username = @"annalicia";
    _namePayment = self.nameEdit.text;
    _amountPayment = self.amountEdit.text;
    _datePayment = self.dateEdit.text;
    
    if(self.idPayment){
    
         print(NSLog(@"Editar"));
        mjsonPayments = [WebServices editPaymentsForUser:username andName:_namePayment andAmount:_amountPayment andDate:_datePayment andIdPayment:_idPayment];
        self.object = [Parser parseGeoObject];
    
    
    }else if(!self.idPayment){
    
        mjsonPayments = [WebServices addPaymentsForUser:username andName:_namePayment andAmount:_amountPayment andDate:_datePayment];
        self.object = [Parser parseGeoObject];
    
    }else{
        print(NSLog(@"Error"));
    }
    
    if([self.object.type isEqual: @"success"]){
        print(NSLog(@"Entro"));
        [self performSegueWithIdentifier:@"AddSuccess" sender:self];
        
    }
}

- (IBAction)deletePayment:(id)sender {
    
        print(NSLog(@"delete %@", _idPayment));
    
    mjsonPayments = [WebServices deletePayment:_idPayment];
    self.object = [Parser parseGeoObject];

    if([self.object.type isEqual: @"success"]){
        print(NSLog(@"delete"));
        [self performSegueWithIdentifier:@"AddSuccess" sender:self];
        
    }

    
}
@end
