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
#import "CBAvatarView.h"
#import "Common.h"



@implementation GridCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        _avatarView = [CBAvatarView new];
        _avatarView.userInteractionEnabled = NO;
        [self addSubview:_avatarView];

    }
    return self;
}

- (void)configureCellWithTeamData:(CBTeamMember *)teamMember {

    _avatarView.teamMember = teamMember;
    
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = _avatarView.frame;
    frame.size.height = height(self);
    frame.size.width = width(self);
    frame.origin.x = 0;
    frame.origin.y = 0;
    _avatarView.frame = frame;
}


@end
