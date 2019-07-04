//
//  AJDWCharacterController.h
//  HPOBJC_ClimbAfternoon_27
//
//  Created by Austin West on 7/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AJDWCharacter.h"

@interface AJDWCharacterController : NSObject

// Shared Instance
+ (instancetype) sharedInstance;

// Fetch Character function
- (void)fetchCharacters:(void(^)(NSArray<AJDWCharacter *> *characters))completion;

@end

