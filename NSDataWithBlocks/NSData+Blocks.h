//
//  NSData+Blocks.h
//
//  Created by Ryan Kelly on 10/31/11.
//  Copyright 2011 Remote Vision, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Blocks)

+ (void) dataWithContentsOfURL:(NSURL *)url completionBlock:(void (^)(NSData *data, NSError *error)) block;

@end
