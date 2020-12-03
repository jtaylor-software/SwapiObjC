//
//  JATPersonController.m
//  SwapiObjc
//
//  Created by Jeremy Taylor on 12/3/20.
//

#import "JATPersonController.h"

@implementation JATPersonController

+ (void)fetchPersonForSearchTerm:(NSString *)searchTerm completion:(void (^)(JATPerson *))completion
{
    static NSString * const baseURLString =  @"https://swapi.dev/api/";
    static NSString * const peopleURLString = @"people";
    static NSString * const searchQueryString = @"search";
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *peopleURL = [baseURL URLByAppendingPathComponent:peopleURLString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:peopleURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:searchQueryString value:searchTerm];
        
        urlComponents.queryItems = @[queryItem];
        
        NSURL *finalURL = urlComponents.URL;
    
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error no data returned from task");
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        if (!topLevelJSON)
                {
                    NSLog(@"Error parsing the JSON: %@", error);
                    return completion(nil);
                }
        
        NSArray<NSDictionary *> *secondLevelJSON = topLevelJSON[@"results"];
        
        NSMutableArray *arrayOfChar = [NSMutableArray new];
                
        for (NSDictionary *currentDictionary in secondLevelJSON)
        {
            JATPerson *person = [[JATPerson alloc] initWithDictionary:currentDictionary];
            [arrayOfChar addObject:person];
        }
        
        NSLog(@"%@", arrayOfChar);
        
        JATPerson *character = arrayOfChar.firstObject;
        
        completion(character);
        
    }] resume];
}

@end
