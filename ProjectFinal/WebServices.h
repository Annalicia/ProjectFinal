//
//  WebServices.h
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject
+ (NSDictionary *)getPaymentsForUser:(NSString *)username;
+ (NSDictionary *)addPaymentsForUser:(NSString *)username andName:(NSString *)name andAmount:(NSString *)amount andDate:(NSString *)date;
+ (NSDictionary *)editPaymentsForUser:(NSString *)username andName:(NSString *)name andAmount:(NSString *)amount andDate:(NSString *)date andIdPayment:(NSString *)id;
+ (NSDictionary *)deletePayment:(NSString *)id;

+ (NSDictionary*) sendPost:(NSString*)postUrl forData:(NSString *)data andMode:(BOOL)mode;
@end
