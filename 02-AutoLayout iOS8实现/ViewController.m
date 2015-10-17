//
//  ViewController.m
//  02-AutoLayout iOS8实现
//
//  Created by guochaoyang on 15/9/21.
//  Copyright © 2015年 guochaoyang. All rights reserved.
//

#import "ViewController.h"
#import "HomeCell.h"

@interface ViewController ()
@property (nonatomic,retain)NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CGFloat height = [UIScreen mainScreen].bounds.size.height;
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    self.view.backgroundColor = [UIColor grayColor];
    self.tableView.backgroundColor = [UIColor redColor];
    
    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.top -= 64;
    self.tableView.contentInset = contentInset;
    
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.dataArray = [NSMutableArray arrayWithObjects:@"如果你的table view超过了几十行",
                      @"你会发现自动布局约束的",
                      @"解决方式在第一次加载table view的时候会迅速地卡住主线程",
                      @"12244",
                      @"真实的行高值会被计算出来（通过tableView:heightForRowAtIndexPath:方法），估算的行高就会被替换掉",
                      @"因为，在第一次加载过程中，每一行都会调用tableView:heightForRowAtIndexPath:方法（为了计算滚动条的尺寸）iOS7中，你可以（也绝对应该）",@"使用table view的estimatedRowHeight属性。这样会为还不在屏幕范围内的cell提供一个临时估算的行高值。然后，当这些cell即将要滚入屏幕范围内的时候，真实的行高值会被计算出来（通过tableView:heightForRowAtIndexPath:方法），估算的行高就会被替换掉。",
                      @"一般来说，行高估算值不需要太精确——它只是被用来修正tableView中滚动条的大小的，当你在屏幕上滑动cell的时候，即便估算值不准确，tableView还是能很好地调节滚动条。",
                      @"）一个接近于“平均”行高的常量值即可。只有行高变化很极端的时候（比如相差一个数量级）",
                      @"非常不幸，你需要给行高做一些缓存（这是苹果的工程师们给出的改进建议）。大体的思路是，第一次计算时让自动布局引擎解析约束条件，然后将计算出的行高缓存起来，以后所有对该cell的高度的请求都返回缓存值。",
                      @"当然，关键还要确保任何会导致cell高度变化的情况发生时你都清除了缓存的行高——这通常发生在cell的内容变化时或其他重大事件发生时",
                      @"当你dequeue重用一个cell的时候，该类型cell的布局约束已经添加好了，可以直接使用。注意，由于固有内容尺寸的不同，具有相同布局约束的cell仍然可能具有不同的高度！不要混淆了布局（不同的约束）和由不同内容尺寸而计算出（通过相同的布局约束来计算）的不同视图frame这两个概念，它们根本是完全不同的两个东西", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    HomeCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell fillData:self.dataArray[indexPath.row]];
    return cell;
}


@end
