//
//  TTMasterViewController.m
//  Tableview2
//
//  Created by Kiran B on 17/1/13.
//  Copyright (c) 2013 Kiran B. All rights reserved.
//

#import "TTMasterViewController.h"

#import "TTDetailViewController.h"
#import "TTModel.h"


@interface TTMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation TTMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [_objects release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    //[_objects addObject:[NSDate date]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"]];
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        //        [json enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,BOOL *stop){

//        [json enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//            NSDictionary *dict = obj;
//            
//        TTModel *newModel = [[TTModel alloc] initWithTitle:@"title" fullDescription:@"full description" imageUrlString:@"http://www.brighthand.com/assets/22213.jpg"];
//            
//        [_objects addObject:newModel];
//
//        }];
        
//        for (int i = 0; i < 20; i++) {
//            TTModel *newModel = [[TTModel alloc] initWithTitle:[NSString stringWithFormat:@"title %d",i] fullDescription:@"full description" imageUrlString:@"http://www.brighthand.com/assets/22213.jpg"];
//            [_objects addObject:newModel];
//        }

        TTModel *newModel = [[TTModel alloc] initWithTitle:[NSString stringWithFormat:@"title"] fullDescription:@"full description" imageUrlString:@"http://www.brighthand.com/assets/22213.jpg"];
        [_objects addObject:newModel];
        
        TTModel *newModel2 = [[TTModel alloc] initWithTitle:[NSString stringWithFormat:@"title 2"] fullDescription:@"full description" imageUrlString:@"http://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Apple_Computer_Logo_rainbow.svg/500px-Apple_Computer_Logo_rainbow.svg.png"];
        [_objects addObject:newModel2];
        
        TTModel *newModel3 = [[TTModel alloc] initWithTitle:[NSString stringWithFormat:@"title 3"] fullDescription:@"full description" imageUrlString:@"http://fc01.deviantart.net/fs70/f/2012/317/1/4/delicious_red_apple_by_fureox-d5kxjm0.png"];
        [_objects addObject:newModel3];
        
        TTModel *newModel4 = [[TTModel alloc] initWithTitle:[NSString stringWithFormat:@"title 4"] fullDescription:@"full description" imageUrlString:@"http://porcelainfacespa.com/blog/wp-content/uploads/2012/05/apples.jpg"];
        [_objects addObject:newModel4];
        
        TTModel *newModel5 = [[TTModel alloc] initWithTitle:[NSString stringWithFormat:@"title 5"] fullDescription:@"full description" imageUrlString:@"http://us.123rf.com/400wm/400/400/chudtsankov/chudtsankov1208/chudtsankov120800002/14670247-cartoon-red-apple.jpg"];
        [_objects addObject:newModel5];
        
        TTModel *newModel6 = [[TTModel alloc] initWithTitle:[NSString stringWithFormat:@"title 6"] fullDescription:@"full description" imageUrlString:@"http://innovatrs.com/files/2013/01/Apple-Logo_51.jpg"];
        [_objects addObject:newModel6];
        
        
        TTModel *newModel7 = [[TTModel alloc] initWithTitle:[NSString stringWithFormat:@"title 7"] fullDescription:@"full description" imageUrlString:@"http://www.intelligentspeculator.net/wp-content/uploads/2012/01/aapl.jpg"];
        [_objects addObject:newModel7];
        
        
        [self performSelectorOnMainThread:@selector(parseData:) withObject:data waitUntilDone:YES];
                        
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)parseData:(NSData *)inData 
{
    [self.tableView reloadData];
}
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    TTModel *object = _objects[indexPath.row];
    cell.textLabel.text = [object title];
    cell.imageView.image = nil;

    if(nil != [_objects[indexPath.row] image])
    {
        cell.imageView.image = [_objects[indexPath.row] image];
    }
    else
    {

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{
                           NSURL *imageURL = [NSURL URLWithString:[_objects[indexPath.row] imageUrlString]];
                           __block NSData *imageData;
                           
                          // dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                               
                               imageData = [NSData dataWithContentsOfURL:imageURL];
                               [_objects[indexPath.row] setImage:[UIImage imageWithData:imageData]];
                               
                               NSLog(@"index path = %d image url = %@", indexPath.row,imageURL);
                               
                               dispatch_sync(dispatch_get_main_queue(), ^{
                                   {
                                       cell.imageView.image = [_objects[indexPath.row] image];
                                       [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];

                                   }
                               });
                               
                           // });
                        });
    }
    
    return cell;
}

//-(void)test:(NSIndexPath *)inIndexp
//{
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:inIndexp];
//    
//    [self.tableView reloadRowsAtIndexPaths:@[inIndexp] withRowAnimation:YES];
//
//
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[TTDetailViewController alloc] initWithNibName:@"TTDetailViewController" bundle:nil] autorelease];
    }
    NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
