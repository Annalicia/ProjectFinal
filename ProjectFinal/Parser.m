//
//  Parser.m
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import "Parser.h"

@implementation Parser

+ (ObjectResponse *)parseGeoObject {
    //check for valid value
    if(mjsonPayments != nil) {
        // Using ObjectMapper Directly
        ObjectResponse *customizedObject = [[ObjectMapper sharedInstance] objectFromSource:mjsonPayments toInstanceOfClass:[ObjectResponse class]];
        return customizedObject;
    }
    return nil;
}

@end
