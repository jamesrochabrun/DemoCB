//
//  DetailInfoView.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "DetailInfoView.h"
#import "UILabel+Addition.h"
#import "Common.h"
#import "CommonUI.h"
#import "CBTeamMember.h"
#import "UIFont+Additions.h"


@implementation DetailInfoView
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _titleLabel = [UILabel labelWithText:@"" withFont:[UIFont regularFont:kGeomH2Size] inView:self];
        _nameLabel = [UILabel labelWithText:@"" withFont:[UIFont regularFont:kGeomH1Size] inView:self];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat fixedWidth = width(self) * 0.8;
    CGSize newSize = [_titleLabel sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = _titleLabel.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    newFrame.origin.x = (width(self) - fixedWidth) /2;
    newFrame.origin.y = (height(self) - newFrame.size.height * 2) /2;
    _titleLabel.frame = newFrame;
    
    newSize = [_nameLabel sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    newFrame = _nameLabel.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    newFrame.origin.x = (width(self) - fixedWidth) /2;
    newFrame.origin.y = CGRectGetMaxY(_titleLabel.frame) + kGeomPaddingSmall;
    _nameLabel.frame = newFrame;
}

- (void)setTeamMember:(CBTeamMember *)teamMember {
    
    _teamMember = teamMember;
    
    __weak DetailInfoView *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.titleLabel.text = _teamMember.title;
        weakSelf.nameLabel.text = [NSString stringWithFormat:@"%@ %@", _teamMember.firstName, _teamMember.lastName];
    });
    
}

@end
