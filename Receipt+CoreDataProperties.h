//
//  Receipt+CoreDataProperties.h
//  Receipts++
//
//  Created by Anthony Coelho on 2016-05-26.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Receipt.h"

NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *amount;
@property (nullable, nonatomic, retain) NSString *note;
@property (nullable, nonatomic, retain) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSOrderedSet<Tag *> *tags;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)insertObject:(Tag *)value inTagsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromTagsAtIndex:(NSUInteger)idx;
- (void)insertTags:(NSArray<Tag *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeTagsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTagsAtIndex:(NSUInteger)idx withObject:(Tag *)value;
- (void)replaceTagsAtIndexes:(NSIndexSet *)indexes withTags:(NSArray<Tag *> *)values;
- (void)addTagsObject:(Tag *)value;
- (void)removeTagsObject:(Tag *)value;
- (void)addTags:(NSOrderedSet<Tag *> *)values;
- (void)removeTags:(NSOrderedSet<Tag *> *)values;

@end

NS_ASSUME_NONNULL_END
