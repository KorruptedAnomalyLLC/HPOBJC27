//
//  AJDWCharacter.h
//  HPOBJC_ClimbAfternoon_27
//
//  Created by Austin West on 7/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AJDWCharacter : NSObject

// PROPERTIES of your CLASS
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *wand;
@property (nonatomic, copy, readonly) NSString *house;
@property (nonatomic, copy, readonly) NSString *bloodStatus;
@property (nonatomic, readonly) BOOL deathEater;

// Initializer
- (instancetype) initWithName: (NSString *) name
                         wand: (NSString *) wand
                        house:(NSString *) house
                  bloodStatus:(NSString *) bloodStatus
                   deathEater:(BOOL)deathEater;
@end

// EXTENSION ON CHARACTER
@interface AJDWCharacter (JSONConvertable)
// CONVENIENCE init that takes in a dictionary
- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
