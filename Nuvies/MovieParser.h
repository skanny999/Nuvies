//
//  MovieParser.h
//  Nuvies
//
//  Created by Riccardo Scanavacca on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface MovieParser : NSObject

+(Movie * _Nonnull) movieFromDataDictionary: (NSDictionary * _Nonnull) dataDictionary;

@end
