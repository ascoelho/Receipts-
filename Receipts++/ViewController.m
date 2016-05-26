//
//  ViewController.m
//  Receipts++
//
//  Created by Anthony Coelho on 2016-05-26.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import "ViewController.h"
#import "ReceiptViewController.h"
#import "Tag.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self fetch];
    
    NSMutableArray *mutableObjects = (NSMutableArray *)self.objects.mutableCopy;

    if (self.objects.count == 0) {
    
        Tag *tag1 = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.managedObjectContext];
        tag1.tagName = @"Personal";
        [mutableObjects addObject:tag1];
        
        Tag *tag2 = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.managedObjectContext];
        tag2.tagName = @"Family";
        [mutableObjects addObject:tag2];
        
        Tag *tag3 = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.managedObjectContext];
        tag3.tagName = @"Business";
        [mutableObjects addObject:tag3];

    }

    self.objects = mutableObjects;

    
}

- (void)viewWillAppear:(BOOL)animated {

    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetch {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tag"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        // Handle the error.
    }
    
    self.objects = fetchedObjects;

    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
    if ([[segue identifier] isEqualToString:@"showVC"]) {
        
        ReceiptViewController *receiptVC = (ReceiptViewController *)[segue destinationViewController];
        receiptVC.managedObjectContext = self.managedObjectContext;
        receiptVC.objects = self.objects;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [(Tag *)self.objects[section] tagName];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.objects.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [(Tag *)self.objects[section] receipts].count;;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Tag *tag = (Tag *)self.objects[indexPath.section];
    
    Receipt *receipt = tag.receipts[indexPath.row];
    
    cell.textLabel.text = receipt.note;
    
    return cell;
    
}


@end
