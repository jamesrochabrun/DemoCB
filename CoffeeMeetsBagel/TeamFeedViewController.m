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


@interface TeamFeedViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate>
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
        
    GridLayout *gridLayout = [GridLayout new];
    _gridCollectionView = [UICollectionView collectionViewWithLayout:gridLayout inView:self.view delegate:self];
    [_gridCollectionView registerClass:[GridCollectionViewCell class] forCellWithReuseIdentifier:kReuseIdentifierGridCell];

    //[self getDataFromJsonAndSaveInCoreData];
    [self fetchDataFromCoreData];
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
    
    //_fetchedResultsController.delegate = self;
    
    [self.fetchedResultsController performFetch:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
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


@end
