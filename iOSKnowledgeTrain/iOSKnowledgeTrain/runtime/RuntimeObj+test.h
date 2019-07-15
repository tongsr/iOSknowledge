//
//  RuntimeObj+test.h
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/15.
//  Copyright © 2019 work. All rights reserved.
//

#import "RuntimeObj.h"

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeObj (test)
@property(nonatomic,strong)NSString *name;
-(void)printname;
- (void)transformDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
