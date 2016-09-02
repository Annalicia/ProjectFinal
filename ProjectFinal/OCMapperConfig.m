//
//  OCMapperConfig.m
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//
#import "Declarations.h"
#import "OCMapperConfig.h"
#import "OCMapper.h"

@implementation OCMapperConfig
+ (void)configure{
    
    InCodeMappingProvider *inCodeMappingProvider = [[InCodeMappingProvider alloc] init];
    CommonLoggingProvider *commonLoggingProvider = [[CommonLoggingProvider alloc] initWithLogLevel:LogLevelError];
    
    [[ObjectMapper sharedInstance] setMappingProvider:inCodeMappingProvider];
    [[ObjectMapper sharedInstance] setLoggingProvider:commonLoggingProvider];
    
    /******************* Customized objects **********************/
    
}
@end
