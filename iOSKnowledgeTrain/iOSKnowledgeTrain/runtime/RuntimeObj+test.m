//
//  RuntimeObj+test.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/15.
//  Copyright © 2019 work. All rights reserved.
//

#import "RuntimeObj+test.h"
#import <objc/runtime.h>

@implementation RuntimeObj (test)


-(void)printname{
    NSLog(@"abc");
}


-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, "NAME", name, OBJC_ASSOCIATION_COPY);

}


-(NSString *)name{
    return objc_getAssociatedObject(self, "NAME");
}



- (void)transformDict:(NSDictionary *)dict {
    Class cla = self.class;
    // count:成员变量个数
    unsigned int outCount = 0;
    // 获取成员变量数组
    Ivar *ivars = class_copyIvarList(cla, &outCount);
    // 遍历所有成员变量
    for (int i = 0; i < outCount; i++) {
        // 获取成员变量
        Ivar ivar = ivars[i];
        // 获取成员变量名字
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 成员变量名转为属性名（去掉下划线 _ ）
        key = [key substringFromIndex:1];
        // 取出字典的值
        id value = dict[key];
        // 如果模型属性数量大于字典键值对数理，模型属性会被赋值为nil而报错
        if (value == nil) continue;
        // 利用KVC将字典中的值设置到模型上
        [self setValue:value forKeyPath:key];
    }
    //需要释放指针，因为ARC不适用C函数
    free(ivars);
}


@end
