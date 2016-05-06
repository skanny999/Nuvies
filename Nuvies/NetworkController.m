//
//  NetworkController.m
//  Nuvies
//
//  Created by Riccardo Scanavacca on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "NetworkController.h"
#import "Movie.h"
#import "MovieParser.h"
#import "MovieFeedParser.h"

@implementation NetworkController


+(NSURLSessionTask * _Nonnull) movieWithTitle:(NSString *)movieTitle onCompletion:(nullable onComplete)completionHandler{
    
    NSString *encodedMovieTitle = [self stringByAddingPercentEncodingForFormData:movieTitle];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"http://www.omdbapi.com/?t=%@+&y=&plot=full&r=json",encodedMovieTitle]];
    NSLog(@"%@", url);
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                Movie *movie = [MovieParser movieFromDataDictionary:json];
                completionHandler(movie, nil);
            } else {
                completionHandler(nil, @"Data is Corrupt");
            }
        } else {
            completionHandler(nil, @"Problem connecting with the server");
        }
        
    }];
    
    [task resume];
    
    return task;
    
}


+ (NSArray *_Nonnull)movieTitlesFeed {
    
    NSURL *rssURL = [NSURL URLWithString:@"http://www.fandango.com/rss/newmovies.rss"];
    MovieFeedParser *movieFeedParser = [[MovieFeedParser alloc]initWithURL:rssURL];
    [movieFeedParser parse];
    return movieFeedParser.movieList;
    
}

// Encode movie title for url

+ (nullable NSString *)stringByAddingPercentEncodingForFormData: (nonnull NSString *)movieTitle {
    NSString *unreserved = @"*-._";
    NSMutableCharacterSet *allowed = [NSMutableCharacterSet alphanumericCharacterSet];
    [allowed addCharactersInString:unreserved];
    
    [allowed addCharactersInString:@" "];
    
    NSString *encoded = [movieTitle stringByAddingPercentEncodingWithAllowedCharacters:allowed];
    
    encoded = [encoded stringByReplacingOccurrencesOfString:@" "
                                                 withString:@"+"];
    return encoded;
}


@end
