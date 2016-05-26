//
//  ReceiptViewController.h
//  Receipts++
//
//  Created by Anthony Coelho on 2016-05-26.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receipt.h"



@interface ReceiptViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) NSMutableArray *categories;
@property (strong, nonatomic) NSArray *objects;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
