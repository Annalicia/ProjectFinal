//
//  WebServices.m
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import "WebServices.h"
#import "Declarations.h"

#define nURLMain            @"http://project.testintagono.com/api/payments/"

#define nGET        0
#define nPOST       1

@implementation WebServices
//Customize Methods
+ (NSDictionary *)getPaymentsForUser:(NSString *)username {
    
    NSMutableDictionary *diData = [[NSMutableDictionary alloc] init];
    NSString  *stData           = [diData JSONRepresentation];
    
    NSString *stURL = [nURLMain stringByAppendingString:userID];
    
    return [self sendPost:stURL forData:stData andMode:nGET];
}

+ (NSDictionary *)addPaymentsForUser:(NSString *)username andName:(NSString *)name andAmount:(NSString *)amount andDate:(NSString *)date {
    
    NSMutableDictionary *diData = [[NSMutableDictionary alloc] init];
    NSString  *stData           = [diData JSONRepresentation];
    
    NSString *stURL = [nURLMain stringByAppendingString:userID];
    stURL           = [stURL stringByAppendingString:@"/add?date="];
    stURL           = [stURL stringByAppendingString:date];
    stURL           = [stURL stringByAppendingString:@"&title="];
    stURL           = [stURL stringByAppendingString:name];
    stURL           = [stURL stringByAppendingString:@"&amount="];
    stURL           = [stURL stringByAppendingString:amount];
    
    
    return [self sendPost:stURL forData:stData andMode:nGET];
}

+ (NSDictionary *)editPaymentsForUser:(NSString *)username andName:(NSString *)name andAmount:(NSString *)amount andDate:(NSString *)date andIdPayment:(NSString *)id{
    
    NSMutableDictionary *diData = [[NSMutableDictionary alloc] init];
    NSString  *stData           = [diData JSONRepresentation];
    
    NSString *stURL = [nURLMain stringByAppendingString:userID];
    stURL           = [stURL stringByAppendingString:@"/edit?date="];
    stURL           = [stURL stringByAppendingString:date];
    stURL           = [stURL stringByAppendingString:@"&title="];
    stURL           = [stURL stringByAppendingString:name];
    stURL           = [stURL stringByAppendingString:@"&amount="];
    stURL           = [stURL stringByAppendingString:amount];
    stURL           = [stURL stringByAppendingString:@"&id="];
    stURL           = [stURL stringByAppendingString:id];
    
    
    return [self sendPost:stURL forData:stData andMode:nGET];
}

+ (NSDictionary *)deletePayment:(NSString *)id{

    NSMutableDictionary *diData = [[NSMutableDictionary alloc] init];
    NSString  *stData           = [diData JSONRepresentation];
    
    NSString *stURL = [nURLMain stringByAppendingString:userID];
    stURL           = [stURL stringByAppendingString:@"/delete?id="];
    stURL           = [stURL stringByAppendingString:id];
    
    return [self sendPost:stURL forData:stData andMode:nGET];

}


//

/**********************************************************************************************/
#pragma mark - json common method
/**********************************************************************************************/
+ (NSDictionary*) sendPost:(NSString*)postUrl forData:(NSString *)data andMode:(BOOL)mode {
    @try {
        NSString *post;
        if (mode) {
            //Post method
            post = [[NSString alloc] initWithFormat:@"data=%@", data];
        }
        else {
            //Get method
            post = [[NSString alloc] initWithFormat:@""];
        }
        print(NSLog(@"post parameters: %@",post))
        post                    = [post stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        NSURL *url              = [NSURL URLWithString:postUrl];
        print(NSLog(@"URL post  = %@", url))
        NSData *postData        = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength    = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        if (mode) {
            [request setHTTPMethod:@"POST"];
        }
        else {
            [request setHTTPMethod:@"GET"];
        }
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"UAG_1.0" forHTTPHeaderField:@"User-Agent"];
        [request setHTTPBody:postData];
        [NSURLRequest requestWithURL:url];
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        //Check response
        print(NSLog(@"[response statusCode] %d",(int)[response statusCode]))
        print(NSLog(@"[response] %@",response))
        
        if ([response statusCode] >=200 && [response statusCode] <308) {
            //get json response
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
            print(NSLog(@"response received %@",jsonResponse))
            
            //return response
            return jsonResponse;
        }
        else { if (error) {print(NSLog(@"Error response")) return nil; } else {print(NSLog(@"Conect Fail"))return nil;}
            return nil;
        }
    }
    @catch (NSException * e) {print(NSLog(@"Exception")) return nil;}
}

@end
