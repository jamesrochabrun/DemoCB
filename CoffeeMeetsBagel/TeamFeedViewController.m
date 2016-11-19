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
#import "GridLayout.h"
#import "GridCollectionViewCell.h"
#import "DetailViewController.h"


@interface TeamFeedViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate, CustomToolBarDelegate, NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) CustomToolbar *toolBar;
@property (nonatomic, strong) UICollectionView *gridCollectionView;
@property (nonatomic) GridLayout *gridLayout;
@property BOOL shouldReloadCollectionView;


@end

@implementation TeamFeedViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.fetchedResultsController performFetch:nil];

    _toolBar = [CustomToolbar new];
    [_toolBar.coffeeButton setSelected:YES];
    _shouldReloadCollectionView = NO;
    _toolBar.del = self;
    [self.view addSubview:_toolBar];
        
    _gridLayout = [GridLayout new];
    _gridCollectionView = [UICollectionView collectionViewWithLayout:_gridLayout inView:self.view delegate:self];
    [_gridCollectionView registerClass:[GridCollectionViewCell class] forCellWithReuseIdentifier:kReuseIdentifierGridCell];

    //[self getDataFromJsonAndSaveInCoreData];
    //[self fetchDataFromCoreData];
    
//        NSArray *fontFamilies = [UIFont familyNames];
//    
//        for (int i = 0; i < [fontFamilies count]; i++)
//        {
//            NSString *fontFamily = [fontFamilies objectAtIndex:i];
//            NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
//            NSLog (@"%@: %@", fontFamily, fontNames);
//        }
    
    
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
    [_gridLayout invalidateLayout];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.fetchedResultsController performFetch:nil];
    [self.gridCollectionView reloadData];

}

- (NSFetchRequest *)entrylistfetchRequest {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CBTeamMember"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]];
    return  fetchRequest;
}

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    CBCoredataStack *coreDataStack = [CBCoredataStack  defaultStack];
    NSFetchRequest *fetchRequest = [self entrylistfetchRequest];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:coreDataStack.managedObjectContext sectionNameKeyPath:@"sectionName" cacheName:nil];
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.fetchedResultsController.sections.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifierGridCell forIndexPath:indexPath];
    CBTeamMember *teamMember = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell configureCellWithTeamData:teamMember];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    CBTeamMember *teamMember = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSLog(@"the name is %@", teamMember.firstName);
    [self showExpandedProfile:teamMember];
}

- (void)showExpandedProfile:(CBTeamMember *)teamMember {
    
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.teamMember = teamMember;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)goToHome {
    
    if (!_shouldReloadCollectionView) {
        return;
    }
    [self fetchCoffeeOrBagelsAndReloadData:NO];
    _shouldReloadCollectionView = NO;
}

- (void)goToFavorites {
    [self fetchCoffeeOrBagelsAndReloadData:YES];
    _shouldReloadCollectionView = YES;
}

- (void)fetchCoffeeOrBagelsAndReloadData:(BOOL)isBagel {
    
    CBCoredataStack *coreDataStack = [CBCoredataStack  defaultStack];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CBTeamMember"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]];
    
    if (isBagel) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isBagel == %d", YES];
        [fetchRequest setPredicate:predicate];
    }
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:coreDataStack.managedObjectContext sectionNameKeyPath:@"sectionName" cacheName:nil];
    
    [self.fetchedResultsController performFetch:nil];
    __weak TeamFeedViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
    [weakSelf.gridCollectionView reloadData];
    });
}

@end

