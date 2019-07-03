//
//  ViewController.m
//  quickSort
//
//  Created by Wcting on 2019/6/10.
//  Copyright © 2019年 EJIAJX_wct. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)NSMutableArray *arrSort;/**<wct20190610  quickSort arr*/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrSort = [NSMutableArray arrayWithArray: @[@"6",@"1",@"2",@"7",@"9",@"3",@"4",@"10",@"8",@"5"]];
    
    [self quickSort:self.arrSort startIndex:0 endIndex:(int)(self.arrSort.count - 1)];
    NSLog(@"%@",self.arrSort);
    
}

- (void)quickSort:(NSMutableArray *)arr startIndex:(int)startIndex endIndex:(int)endIndex
{
    if (endIndex <= startIndex) return;
    int i = startIndex;
    int j = endIndex;
    id key = arr[startIndex];
    while (true)
    {
        /*从右向左找比key小的值*/
        while ([arr[j] intValue] >= [key intValue])//判断条件要加等号，重复数字也能排
        {
            if (j == startIndex){
                break;
            }
            j--;
            
        }
        if (i >= j){
            break;
        }
        /*交换i,j对应的值*/
        id temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
        
        /*从左向右找比key大的值*/
        while ([arr[i] intValue] <= [key intValue])
        {
            if (i == endIndex){
                break;
            }
            i ++;
        }

        if (i >= j){
            break;
        }

        /*交换i,j对应的值*/
        id tempj = arr[i];
        arr[i] = arr[j];
        arr[j] = tempj;
    }

    //递归继续排左右两边对象
    [self quickSort:arr startIndex:startIndex endIndex:j - 1];
    [self quickSort:arr startIndex:j + 1 endIndex:endIndex];

}

@end
