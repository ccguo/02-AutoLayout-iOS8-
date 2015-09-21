//
//  HomeCell.h
//  02-AutoLayout iOS8实现
//
//  Created by guochaoyang on 15/9/21.
//  Copyright © 2015年 guochaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;

- (void)fillData:(id)obj;

@end
