//
//  HomeCell.m
//  02-AutoLayout iOS8实现
//
//  Created by guochaoyang on 15/9/21.
//  Copyright © 2015年 guochaoyang. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor grayColor];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(id)obj
{
    self.label.text = obj;
}
@end
