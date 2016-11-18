//
//  UICollectionView+Addition.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Addition)
+ (UICollectionView *)collectionViewWithLayout:(UICollectionViewLayout *)layout inView:(UIView *)view delegate:(id)delegate;
@end
