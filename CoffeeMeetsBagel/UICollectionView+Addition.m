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


@end
