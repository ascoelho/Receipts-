//
//  ReceiptViewController.m
//  Receipts++
//
//  Created by Anthony Coelho on 2016-05-26.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import "ReceiptViewController.h"
#import "Receipt.h"
#import "Tag.h"




@implementation ReceiptViewController

- (void)viewDidLoad {
    
    self.categories = [NSMutableArray new];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"Category";
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"Personal";
    }
    if (indexPath.row == 1){
        cell.textLabel.text = @"Family";
    }
    if (indexPath.row == 2){
        cell.textLabel.text = @"Business";
    }
    

    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.highlighted = NO;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        [self.categories removeObject:cell.textLabel.text];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.highlighted = YES;
        [self.categories addObject:cell.textLabel.text];
    }
    
}



- (IBAction)done:(id)sender {
    
    Receipt *receipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipt" inManagedObjectContext:self.managedObjectContext];
    receipt.amount = [NSNumber numberWithFloat:[self.amountTextField.text floatValue]];
    receipt.note = self.noteTextField.text;
    receipt.timeStamp = self.datePicker.date;
    

    for (Tag *tag in self.objects) {

        if ([tag.tagName isEqualToString:@"Personal"] && [self.categories containsObject:@"Personal"]) {
            NSMutableOrderedSet *mutableItems = (NSMutableOrderedSet *)[tag receipts].mutableCopy;
            [mutableItems addObject:receipt];
            
            tag.receipts = mutableItems;
        }
        if ([tag.tagName isEqualToString:@"Family"] && [self.categories containsObject:@"Family"]) {
            NSMutableOrderedSet *mutableItems = (NSMutableOrderedSet *)[tag receipts].mutableCopy;
            [mutableItems addObject:receipt];
            tag.receipts = mutableItems;
        }
        if ([tag.tagName isEqualToString:@"Business"] && [self.categories containsObject:@"Business"]) {
            NSMutableOrderedSet *mutableItems = (NSMutableOrderedSet *)[tag receipts].mutableCopy;
            [mutableItems addObject:receipt];
            tag.receipts = mutableItems;
        }
    }
    
    [self.managedObjectContext save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
