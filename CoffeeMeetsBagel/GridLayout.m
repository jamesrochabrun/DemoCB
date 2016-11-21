//
//  GridLayout.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "GridLayout.h"
#import "Common.h"
#import "CommonUI.h"

@implementation GridLayout

- (instancetype)init {
    self = [super init];
    if (self)
    {
        self.minimumLineSpacing = kGeomMinimunInterCellSpacing;
        self.minimumInteritemSpacing = kGeomMinimunInterCellSpacing;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.headerReferenceSize = CGSizeMake(width(self.collectionView), ((IS_IPHONE)? kGeomHeaderViewHeight:kGeomHeaderViewHeightIpad));
    }
    return self;
}

- (CGSize)itemSize {
    
    NSInteger numberOfColumns = 3;
    CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) - (kGeomMinimunInterCellSpacing * (numberOfColumns - 1))) / numberOfColumns;
    return CGSizeMake(itemWidth, itemWidth);
}

@end
