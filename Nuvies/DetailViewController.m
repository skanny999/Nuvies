//
//  DetailViewController.m
//  Nuvies
//
//  Created by Riccardo Scanavacca on 04/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import "DetailViewController.h"
#import "Movies.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadDetailView) name:@"downloaded" object:nil];
    
    self.movie = [[Movies alloc]initWithMovieTitle:self.movieTitle];
    self.navigationController.title = self.movieTitle;
    
}



-(void)loadDetailView {
    

    self.country.text = self.movie.country;
    self.director.text = self.movie.director;
    self.actors.text = self.movie.actors;
    self.genre.text = self.movie.genre;
    
    self.metascore.text = self.movie.metascore;
    self.plot.text = self.movie.plot;
    
    [self viewWillAppear:YES];
    [self.presentedViewController setNeedsFocusUpdate];

    NSLog(@"load page called");
    
}





@end
