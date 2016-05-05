//
//  MoviesTableViewController.m
//  Nuvies
//
//  Created by Riccardo Scanavacca on 04/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "MoviesTableViewController.h"
#import "DetailViewController.h"

@interface MoviesTableViewController ()

@end

@implementation MoviesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieList = [NSMutableArray array];
    NSURL *rssURL = [NSURL URLWithString:@"http://www.fandango.com/rss/newmovies.rss"];
    NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:rssURL];
    [parser setDelegate:self];
    [parser parse];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
//    [request setURL:[NSURL URLWithString:@"http://www.omdbapi.com/?t=Code+of+Honor+&y=2016&plot=full&r=json"]];
//    
//    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSError *err;
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
//            
//            NSLog(@"%@", json);
//            
//        });
//    }];
//    
//    [task resume];
//

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.movieList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.movieList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *movieTitle = [self.movieList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"MovieDetails" sender:movieTitle];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"MovieDetails"]) {
        
        NSString *selectedMovie = (NSString *) sender;
        DetailViewController *destinationViewController = (DetailViewController *) segue.destinationViewController;
        
        if (selectedMovie && destinationViewController) {
            destinationViewController.movieTitle = selectedMovie;
        } else {
            NSLog(@"Cannot perform segue");
        }
    }
    
    
}


#pragma mark - Parse RSS data


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;
    
    if ([self.element isEqualToString:@"title"]) {
        self.filmTitle = [NSMutableString string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([self.element isEqualToString:@"title"]) {
        if(![self.filmTitle isEqualToString:@"New Movies"]) {
            [self.movieList addObject:self.filmTitle];
        }
    }
    
    self.filmTitle = nil;
    self.element = nil;
    
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (!self.element) return;
    
    if ([self.element isEqualToString:@"title"]) {
        self.filmTitle = string;
        
    }
}




//-(NSURLSession *) getURLSession {
//    static NSURLSession *session = nil;
//    static dispatch_once_t onceToken;
//    
//    dispatch_once( &onceToken, ^{
//        
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//        session = [NSURLSession sessionWithConfiguration:configuration];
//        
//    });
//    
//    return session;
//}











@end
