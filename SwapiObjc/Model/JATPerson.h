//
//  JATPerson.h
//  SwapiObjc
//
//  Created by Jeremy Taylor on 12/3/20.
//

#import <Foundation/Foundation.h>



@interface JATPerson : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *birthYear;
@property (nonatomic, copy) NSString *gender;

- (instancetype)initWithPersonName: (NSString *)name
                            birthYear: (NSString *)birthYear
                            gender: (NSString *)gender;

@end

@interface JATPerson (JSONConvertabile)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

