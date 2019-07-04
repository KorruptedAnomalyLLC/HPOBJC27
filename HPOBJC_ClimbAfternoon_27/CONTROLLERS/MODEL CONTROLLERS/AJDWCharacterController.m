//
//  AJDWCharacterController.m
//  HPOBJC_ClimbAfternoon_27
//
//  Created by Austin West on 7/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "AJDWCharacterController.h"
NS_ASSUME_NONNULL_BEGIN

@implementation AJDWCharacterController

static NSString * const baseURLString = @"https://www.potterapi.com/v1/";
static NSString * const characterString = @"characters";
static NSString * const apieKeyString = @"key";
static NSString * const apiKeyValue = @"$2a$10$yuEVIrB8CTLywFUQlbQnFuLutxdAW7Qt0LIz/pRuNr/lIVbs1S.2m";

// Shared instance implementation
+ (instancetype)sharedInstance
{
    
    // Make sure and instance of AJDWCharacterController does not already exist
    static AJDWCharacterController *sharedInstance = nil;
    // Dispatch the creation to a group, run it once, keep the token
    static dispatch_once_t onceToken;
    // Checks the token, if it exists, return out
    dispatch_once(&onceToken, ^{
        // Init the shared instance
        sharedInstance = [AJDWCharacterController new];
    });
    // Return the shared instance
    return sharedInstance;
}

// Fetch function implementation
- (void)fetchCharacters:(void (^)(NSArray<AJDWCharacter *> *_Nullable))completion
{
    // Contructing url
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *characterURL = [baseURL URLByAppendingPathComponent:characterString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:characterURL resolvingAgainstBaseURL:true];
    
    // Add query items to url
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:apieKeyString value:apiKeyValue];
    
    urlComponents.queryItems = @[apiKey];
    
    // Final url
    NSURL *finalURL = urlComponents.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
          // Handle the error
          if (error) {
              NSLog(@"There was an issue with the URL: %@, %@", [error localizedDescription], error);
              completion(nil);
              return;
          }
          // Handle the data
          if (data) {
              // Serialize the json
              NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
              
              // Handle the error
              if (!topLevelDictionary)
              {
                  NSLog(@"Error patsing the JSON : %@, %@", [error localizedDescription], error);
                  completion(nil);
                  return;
              }
              
              // Temporary array
              NSMutableArray *charactersArray = [NSMutableArray new];
              
              // Loop through the dictionaries found
              for (NSDictionary *characterDictionary in topLevelDictionary)
              {
                  // Init the character from the dictionary found
                  AJDWCharacter *character = [[AJDWCharacter alloc]initWithDictionary:characterDictionary];
                  // Append the init character to the temp array
                  [charactersArray addObject:character];
                  // Complete with the tempo array
                  completion(charactersArray);
              }
          }
      }]resume ];
}

@end

NS_ASSUME_NONNULL_END
