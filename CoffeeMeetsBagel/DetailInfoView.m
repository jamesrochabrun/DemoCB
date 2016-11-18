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

@implementation DetailInfoView
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _titleLabel = [UILabel labelWithText:@"" withSize:10 inView:self];
        _titleLabel.textColor = [UIColor blackColor];
        _nameLabel = [UILabel labelWithText:@"" withSize:18 inView:self];
        _nameLabel.textColor = [UIColor blackColor];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = _titleLabel.frame;
    frame.size.height = kGeomLabelHeight;
    frame.size.width = width(self) * 0.65;
    frame.origin.x = (width(self) - frame.size.width) /2;
    frame.origin.y = kGeomPaddingBig;
    _titleLabel.frame = frame;
    
    frame = _nameLabel.frame;
    frame.size.height = kGeomLabelHeight;
    frame.size.width = width(self) * 0.75;
    frame.origin.x = (width(self) - frame.size.width) /2;
    frame.origin.y = CGRectGetMaxY(_titleLabel.frame) + kGeomPaddingSmall;
    _nameLabel.frame = frame;
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
