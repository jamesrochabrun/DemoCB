//
//  GridCollectionViewCell.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "GridCollectionViewCell.h"
#import "CBTeamMember.h"
#import "UIImageView+AFNetworking.h"


@implementation GridCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [UIImageView new];
        _imageView.clipsToBounds = YES;
    }
    return self;
}

- (void)configureCellWithTeamData:(CBTeamMember *)teamMember {
    
    NSURL *urlStr = [NSURL URLWithString:teamMember.avatar];
    [_imageView setImageWithURL:urlStr placeholderImage:[UIImage imageNamed:@""]];
    __weak GridCollectionViewCell *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.backgroundView = _imageView;
    });
}

@end
