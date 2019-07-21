//
//  ViewController.m
//  iOSKnowledgeTrain
//
//  Created by work on 2019/7/15.
//  Copyright © 2019 work. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeVC.h"
#import "RunloopVC.h"
#import "ButtonAreaVC.h"
#import "NSThreadVC.h"
#import "CoreGraphicVC.h"
#import "CoreAnimationVC.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
- (IBAction)goRuntime:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)goRunloop:(id)sender;
- (IBAction)goButtonArea:(id)sender;

@property(nonatomic,strong)NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.array=[NSArray arrayWithObjects:@"runtime",@"runloop",@"buttonArea",@"NSThread",@"kvo",@"CoreGraphic",@"coreAnimation", nil];
    [self.tableview reloadData];
}


- (IBAction)goRuntime:(id)sender {
    RuntimeVC *vc = [[RuntimeVC alloc]initWithNibName:@"RuntimeVC" bundle:nil];
    vc.title=@"runtime";
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)goRunloop:(id)sender {
    RunloopVC *vc = [[RunloopVC alloc]initWithNibName:@"RunloopVC" bundle:nil];
    vc.title=@"Runloop";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goButtonArea:(id)sender {
    ButtonAreaVC *vc = [[ButtonAreaVC alloc]initWithNibName:@"ButtonAreaVC" bundle:nil];
    vc.title=@"ButtonArea";
    [self.navigationController pushViewController:vc animated:YES];
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    NSString *title = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text=title;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self goRuntime:nil];
            break;
        case 1:
            [self goRunloop:nil];
            break;
        case 2:
            [self goButtonArea:nil];
            break;
        case 3:
            [self goNSThread];
            break;
        case 4:
            [self goKvoKvc];
            break;
        case 5:
            [self goCoreGraphicVC];
            break;
        case 6:
            [self goCoreAnimation];
            break;
        default:
            break;
    }
}



-(void)goNSThread{
    NSThreadVC *vc = [[NSThreadVC alloc]initWithNibName:@"NSThreadVC" bundle:nil];
    vc.title=@"NSThread";
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)goKvoKvc{
    
}

    
    
    
-(void)goCoreGraphicVC{
    CoreGraphicVC *vc = [[CoreGraphicVC alloc]initWithNibName:@"CoreGraphicVC" bundle:nil];
    vc.title=@"CoreGraphic";
    [self.navigationController pushViewController:vc animated:YES];
}
 
    
    
    
-(void)goCoreAnimation{
    CoreAnimationVC *vc = [[CoreAnimationVC alloc]initWithNibName:@"CoreAnimationVC" bundle:nil];
    vc.title=@"CoreAnimation";
    [self.navigationController pushViewController:vc animated:YES];
}
@end
