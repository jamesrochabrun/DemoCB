//
//  UICollectionView+Addition.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "UICollectionView+Addition.h"
#import "CommonUI.h"

@implementation UICollectionView (Addition)

+ (UICollectionView *)collectionViewWithLayout:(UICollectionViewLayout *)layout inView:(UIView *)view delegate:(id)delegate {
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.delegate = delegate;
    collectionView.dataSource = delegate;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.alwaysBounceHorizontal = NO;
    collectionView.allowsSelection = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    [view addSubview:collectionView];
    return collectionView;
}

+ (UICollectionView *)collectionViewInView:(UIView *)view direction:(UICollectionViewScrollDirection)direction withItemSize:(CGSize)itemSize delegate:(id)delegate {
    
    CGFloat w = itemSize.width;
    //This grid is by 3 cells in a row so that means that the amount of spaces between them are 2
    CGFloat innerSpaceBetweenCellsInRow = 2.0;
    CGFloat dynamicItemSize = (w - innerSpaceBetweenCellsInRow * kGeomMinimunInterItemSpacing) / 3;

    UICollectionViewFlowLayout *cvLayout = [[UICollectionViewFlowLayout alloc] init];
    cvLayout.itemSize = CGSizeMake(dynamicItemSize, dynamicItemSize);
    cvLayout.scrollDirection = direction;
    cvLayout.minimumInteritemSpacing = kGeomMinimunInterItemSpacing;
    cvLayout.minimumLineSpacing = kGeomSpaceCellPadding;
    return [UICollectionView collectionViewWithLayout:cvLayout inView:view delegate:delegate];
}

@end
