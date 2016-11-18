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
#import "UICollectionView+Addition.h"
#import "Common.h"
#import "CommonUI.h"
#import "CBAPI.h"

@interface TeamFeedViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) CustomToolbar *toolBar;
@property (nonatomic, strong) UICollectionView *gridCollectionView;


@end

@implementation TeamFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor redColor];
    _toolBar = [CustomToolbar new];
    [_toolBar.coffeeButton setSelected:YES];
    [self.view addSubview:_toolBar];
    
    _gridCollectionView = [UICollectionView collectionViewInView:self.view direction:UICollectionViewScrollDirectionVertical withItemSize:self.view.frame.size delegate:self];
    [_gridCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kReuseIdentifierGridCell];

    [self fetchDataFromCoreData];
    [self getDataFromJsonAndSaveInCoreData];
}

- (void)getDataFromJsonAndSaveInCoreData {
    
    [CBAPI getDataFromPathWithSucces:^(id responseObject) {
        CBCoredataStack *coreDataStack = [CBCoredataStack defaultStack];
        for (NSDictionary *memberData in responseObject) {
            [CBTeamMember memberFromDict:memberData inCoreDataStack:coreDataStack];
        }
        [coreDataStack saveContext];
    }];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect frame = _gridCollectionView.frame;
    frame.origin.x = 0;
    frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
    frame.size.height = CGRectGetMinY(_toolBar.frame) - frame.origin.y;
    frame.size.width = width(self.view);
    _gridCollectionView.frame = frame;
}


- (void)fetchDataFromCoreData {
    
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifierGridCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
