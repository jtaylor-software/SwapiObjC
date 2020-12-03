//
//  JATPersonController.h
//  SwapiObjc
//
//  Created by Jeremy Taylor on 12/3/20.
//

#import <Foundation/Foundation.h>
#import "JATPerson.h"


@interface JATPersonController : NSObject

+ (void)fetchPersonForSearchTerm:(NSString *)searchTerm completion: (void (^) (JATPerson *person))completion;
@end


