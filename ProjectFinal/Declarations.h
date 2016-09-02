//
//  Declarations.h
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"
#import "ObjectMapper.h"
#import "ObjectResponse.h"
//#import "Coord.h"
//#import "MainObject.h"
#import "Parser.h"

//Debug
#define nDebugEnable        1
#define print(x)            if(nDebugEnable){(x);}

extern NSDictionary         *mjsonPayments;
@interface Declarations : NSObject

@end
