//
//  cellPaymentTableViewCell.h
//  ProjectFinal
//
//  Created by Annalicia Ostos on 01/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellPayment : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *amountLbl;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (strong, nonatomic) IBOutlet UILabel *dateLbl;

@end
