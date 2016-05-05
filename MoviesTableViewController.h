//
//  MoviesTableViewController.h
//  Nuvies
//
//  Created by Riccardo Scanavacca on 04/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesTableViewController : UITableViewController <NSXMLParserDelegate>

@property (nonatomic, strong) NSString *element;
@property (nonatomic, strong) NSString *filmTitle;
@property (nonatomic, strong) NSMutableArray *movieList;

@end
