//
//  JATPerson.m
//  SwapiObjc
//
//  Created by Jeremy Taylor on 12/3/20.
//

#import "JATPerson.h"

@implementation JATPerson

static NSString * const nameKey = @"name";
static NSString * const birthYearKey = @"birth_year";
static NSString * const genderKey = @"gender";


- (instancetype)initWithPersonName:(NSString *)name birthYear:(NSString *)birthYear gender:(NSString *)gender
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _birthYear = birthYear;
        _gender = gender;
    }
    return self;
}


@end

@implementation JATPerson (JSONConvertabile)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[nameKey];
    NSString *birthYear = dictionary[birthYearKey];
    NSString * gender = dictionary[genderKey];
    
    return [self initWithPersonName:name birthYear:birthYear gender:gender];
}

@end
