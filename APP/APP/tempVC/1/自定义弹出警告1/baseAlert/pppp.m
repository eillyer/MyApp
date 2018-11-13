//
//  pppp.m
//  APP
//
//  Created by eillyer on 2018/10/27.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "pppp.h"

@implementation pppp

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(pppp *)CustomView{
    //我们这里需要把这个xib加载出来而这个xib的所拥有者就是当前的对象`instantiateWithOwner:`这个方法就是对此xib文件进行拥有者关联，关联这个xib是属于哪一个类的我们当然这是self
    pppp *View = [[UINib nibWithNibName:@"pppp" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
    return View;
}

@end
