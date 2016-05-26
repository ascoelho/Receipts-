//
//  ViewController.h
//  Receipts++
//
//  Created by Anthony Coelho on 2016-05-26.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSArray *objects;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

