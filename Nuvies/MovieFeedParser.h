//
//  MovieFeedParser.h
//  Nuvies
//
//  Created by Riccardo Scanavacca on 06/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieFeedParser : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong, readonly) NSMutableArray * _Nonnull movieList;

- (instancetype _Nonnull) initWithURL:(NSURL * _Nonnull)url;
- (void) parse;


@end
