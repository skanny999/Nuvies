//
//  MovieParser.m
//  Nuvies
//
//  Created by Riccardo Scanavacca on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "MovieParser.h"


@implementation MovieParser

+(Movie * _Nonnull) movieFromDataDictionary: (NSDictionary * _Nonnull) dataDictionary{
    
    Movie *movie = [[Movie alloc]init];
    
    NSString *title = (NSString *) [dataDictionary valueForKey:@"Title"];
    if (title) {
        movie.title = title;
    } else {
        movie.title = @"N/A";
    }
    
    NSString *actors = (NSString *) [dataDictionary valueForKey:@"Actors"];
    if (actors) {
        movie.actors = actors;
    } else {
        movie.actors = @"N/A";
    }
    
    NSString *country = (NSString *) [dataDictionary valueForKey:@"Country"];
    if (country) {
        movie.country = country;
    } else {
        movie.country = @"N/A";
    }
    
    NSString *director = (NSString *) [dataDictionary valueForKey:@"Director"];
    if (director) {
        movie.director = director;
    } else {
        movie.director = @"N/A";
    }
    
    NSString *genre = (NSString *) [dataDictionary valueForKey:@"Genre"];
    if (genre) {
        movie.genre = genre;
    } else {
        movie.genre =  @"N/A";
    }
    
    NSString *plot = (NSString *) [dataDictionary valueForKey:@"Plot"];
    if (plot) {
        movie.plot = plot;
    } else {
        movie.plot =  @"N/A";
    }
    
    NSString *metascore = (NSString *) [dataDictionary valueForKey:@"Metascore"];
    if (metascore) {
        movie.metascore = metascore;
    } else {
        movie.metascore =  @"N/A";
    }

    return movie;
    
}




@end
