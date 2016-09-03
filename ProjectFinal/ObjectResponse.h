//
//  ObjectResponse.h
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentsResponse.h"
#import "Payment.h"

@interface ObjectResponse : NSObject

@property (nonatomic, strong) PaymentsResponse *payments;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *msg;

@end
