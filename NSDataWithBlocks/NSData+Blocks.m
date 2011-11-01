//
//  NSData+Blocks.m
//
//  Created by Ryan Kelly on 10/31/11.
//  Copyright 2011 Remote Vision, Inc. All rights reserved.
//

#import "NSData+Blocks.h"

@implementation NSData (Blocks)


+ (void) dataWithContentsOfURL:(NSURL *)url completionBlock:(void (^)(NSData *data, NSError *error)) block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        if(data) {
            block(data, nil);
        } else {
            NSError *error = [NSError errorWithDomain:@"ContentDownloadError" 
                                                 code:1 
                                             userInfo:[NSDictionary dictionaryWithObject:@"Content at URL is unavailable" 
                                                                                  forKey:NSLocalizedDescriptionKey]];
            block(nil, error);
        }
        
    });
}

@end
