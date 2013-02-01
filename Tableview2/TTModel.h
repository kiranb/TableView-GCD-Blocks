//
//  TTModel.h
//  Tableview2
//
//  Created by Kiran B on 17/1/13.
//  Copyright (c) 2013 Kiran B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTModel : NSObject
{
    NSString *imageUrlString_;
    NSString *title_;
    NSString *fullDescription_;
    UIImage  *image_;
}

@property (nonatomic,retain) NSString *imageUrlString;
@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *fullDescription;
@property (nonatomic,retain) UIImage  *image;

-(id)initWithTitle:(NSString *)intitle fullDescription:(NSString *)infullDescription imageUrlString:(NSString *)inImageUrlString;

@end
