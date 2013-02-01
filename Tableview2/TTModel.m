//
//  TTModel.m
//  Tableview2
//
//  Created by Kiran B on 17/1/13.
//  Copyright (c) 2013 Kiran B. All rights reserved.
//

#import "TTModel.h"

@implementation TTModel

@synthesize fullDescription = fullDescription_;
@synthesize imageUrlString = imageUrlString_;
@synthesize title = title_;
@synthesize image = image_;

-(id)initWithTitle:(NSString *)intitle fullDescription:(NSString *)infullDescription imageUrlString:(NSString *)inImageUrlString
{
    if([super init])
    {
        self.title = intitle;
        self.fullDescription = infullDescription;
        self.imageUrlString = inImageUrlString;
        self.image = nil;
    }
    return self;
}

@end
