//
//  NetworkController.h
//  Nuvies
//
//  Created by Riccardo Scanavacca on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

typedef void (^onComplete) (Movie * __nullable movie, NSString * __nullable errorMessage);

@interface NetworkController : NSObject

+ (NSURLSessionTask * _Nonnull) movieWithTitle:(NSString * __nullable)movieTitle onCompletion:(nullable onComplete)completionHandler;

+ (NSArray *_Nonnull)movieTitlesFeed;

@end
