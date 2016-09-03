//
//  ViewController.m
//  ProjectFinal
//
//  Created by Annalicia Ostos on 01/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import "HomeController.h"
#import "AddPaymentController.h"
#import "ObjectMapper.h"
#import "cellPayment.h"

@interface HomeController ()

@property ObjectResponse *object;
@property Payment *mainObject;
@property NSString *type;
@property boolean_t *paid;

@property NSString *stIdSelected;
@property NSString *stNameSelected;
@property NSString *stAmountSelected;
@property NSString *stDateSelected;

@property Payment *paymentDetail;
@property NSArray *searchResult;


@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
- (void)initController {

    NSString *name = userID;
    mjsonPayments = [WebServices getPaymentsForUser:name];

    self.object = [Parser parseGeoObject];
    self.type = self.object.type;
    
    _searchResult = (NSArray *)self.object.payments;
    
}

/**********************************************************************************************/
#pragma mark - Table methods and delegates
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _searchResult.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    
        _paymentDetail = [_searchResult objectAtIndex:indexPath.row];
        
        cellPayment *cell = [tableView dequeueReusableCellWithIdentifier:@"cellPayment"];
        
        if (cell == nil) {
            [tableView registerNib:[UINib nibWithNibName:@"cellPayment" bundle:nil] forCellReuseIdentifier:@"cellPayment"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellPayment"];
        }
        
        
        if(_searchResult.count >0){
        
            cell.amountLbl.text = _paymentDetail.amount;
            cell.descriptionLbl.text = _paymentDetail.title;
            cell.dateLbl.text = _paymentDetail.date;
            
        }
    return cell;
    
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Payment *paymentDetailS = [_searchResult objectAtIndex:indexPath.row];
    
    self.stIdSelected = paymentDetailS.id;
    self.stNameSelected = paymentDetailS.title;
    self.stAmountSelected  = paymentDetailS.amount;
    self.stDateSelected  = paymentDetailS.date;
    [self performSegueWithIdentifier:@"AddPayment" sender:self];
}

- (IBAction)addPayment:(id)sender {
    [self performSegueWithIdentifier:@"AddPayment" sender:self];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.destinationViewController isKindOfClass:[AddPaymentController class]]) {
        
        AddPaymentController *addPaymentCont     = [segue destinationViewController];
        addPaymentCont.idPayment  = self.stIdSelected;
        addPaymentCont.namePayment        = self.stNameSelected;
        addPaymentCont.amountPayment  = self.stAmountSelected;
        addPaymentCont.datePayment       = self.stDateSelected;
        
    }
    
}


@end
