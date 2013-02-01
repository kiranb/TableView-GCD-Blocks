//
//  TTDetailViewController.h
//  Tableview2
//
//  Created by Kiran B on 17/1/13.
//  Copyright (c) 2013 Kiran B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
