//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Douglas Barreto on 12/29/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@property (strong, nonatomic) UITableView *taskTable;
@property (strong, nonatomic) UITextField *taskField;
@property (strong, nonatomic) UIButton *insertButton;

@property (strong, nonatomic) NSMutableArray *tasks;


-(void)addTask:(id)sender;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
