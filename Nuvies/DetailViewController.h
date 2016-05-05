//
//  DetailViewController.h
//  Nuvies
//
//  Created by Riccardo Scanavacca on 04/05/2016.
//  Copyright © 2016 Riccardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UILabel *director;
@property (weak, nonatomic) IBOutlet UILabel *actors;
@property (weak, nonatomic) IBOutlet UILabel *genre;
@property (weak, nonatomic) IBOutlet UILabel *metascore;
@property (weak, nonatomic) IBOutlet UILabel *plot;
@property (nonatomic, strong) Movies * _Nonnull movie;

@property (nonatomic, strong) NSString *movieTitle;

@end
