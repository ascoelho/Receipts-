//
//  Tag+CoreDataProperties.h
//  Receipts++
//
//  Created by Anthony Coelho on 2016-05-26.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tag.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tag (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *tagName;
@property (nullable, nonatomic, retain) NSOrderedSet<Receipt *> *receipts;

@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)insertObject:(Receipt *)value inReceiptsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromReceiptsAtIndex:(NSUInteger)idx;
- (void)insertReceipts:(NSArray<Receipt *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeReceiptsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInReceiptsAtIndex:(NSUInteger)idx withObject:(Receipt *)value;
- (void)replaceReceiptsAtIndexes:(NSIndexSet *)indexes withReceipts:(NSArray<Receipt *> *)values;
- (void)addReceiptsObject:(Receipt *)value;
- (void)removeReceiptsObject:(Receipt *)value;
- (void)addReceipts:(NSOrderedSet<Receipt *> *)values;
- (void)removeReceipts:(NSOrderedSet<Receipt *> *)values;

@end

NS_ASSUME_NONNULL_END
