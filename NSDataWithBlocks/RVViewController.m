//
//  RVViewController.m
//  NSDataWithBlocks
//
//  Created by Ryan Kelly on 10/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RVViewController.h"
#import "NSData+Blocks.h"

@implementation RVViewController
@synthesize heroImage;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSURL* url = [NSURL URLWithString:@"http://images.apple.com/home/images/hero.jpg"];
    [NSData dataWithContentsOfURL:url completionBlock:^(NSData *data, NSError *error) {
        if(!error) {
            dispatch_sync(dispatch_get_main_queue(), ^(void) {
                self.heroImage.image = [UIImage imageWithData:data];
            });
        } else {
            NSLog(@"error %@", error);
        }
    }];

}

- (void)viewDidUnload
{
    [self setHeroImage:nil];
    heroImage = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
