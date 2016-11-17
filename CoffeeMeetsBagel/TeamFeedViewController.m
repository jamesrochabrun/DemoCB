//
//  TeamFeedViewController.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "TeamFeedViewController.h"
#import "CBCoredataStack.h"
#import "CBTeamMember.h"
#import "CustomToolbar.h"


@interface TeamFeedViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) CustomToolbar *toolBar;

@end

@implementation TeamFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor redColor];
    _toolBar = [CustomToolbar new];
    [_toolBar.coffeeButton setSelected:YES];
    [self.view addSubview:_toolBar];
    
    
    CBCoredataStack *coreDataStack = [CBCoredataStack defaultStack];
    CBTeamMember *tm = [NSEntityDescription insertNewObjectForEntityForName:@"CBTeamMember" inManagedObjectContext:coreDataStack.managedObjectContext];
    tm.firstName = @"carlos";
    tm.lastName = @"salum";
    tm.bio = @"ahuevonado";
    tm.teamID = 13636;
    
    [coreDataStack saveContext];
    
    [self fetch];
}


- (void)fetch {
    
    
    CBCoredataStack *coreDataStack = [CBCoredataStack  defaultStack];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CBTeamMember"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isFavorite == %d", YES];
//    [fetchRequest setPredicate:predicate];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:coreDataStack.managedObjectContext sectionNameKeyPath:@"sectionName" cacheName:nil];
    
      _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:coreDataStack.managedObjectContext sectionNameKeyPath:@"sectionName" cacheName:nil];
    
    //_fetchedResultsController.delegate = self;
    
    [self.fetchedResultsController performFetch:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
