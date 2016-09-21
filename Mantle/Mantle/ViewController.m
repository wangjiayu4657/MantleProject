//
//  ViewController.m
//  Mantle
//
//  Created by fangjs on 16/9/21.
//  Copyright © 2016年 fangjs. All rights reserved.

// MTLModel
// MTLModel是所有Model的父类，提供了一些默认的行为来处理对象的初始化和归档操作，同时可以获取到对象所有属性的键值集合

// MTLJSONAdapter
// 用于在MTLModel对象和JSON字典之间进行相互转换，相当于是一个适配器

// MTLJSONSerializing
// 需要与JSON字典进行相互转换的MTLModel的子类都需要实现该协议，以方便MTLJSONApadter对象进行转换

// 原文链接：http:www.jianshu.com/p/8a1c78fa1bc2

 

#import "ViewController.h"

@interface ViewController ()

/**数据模型*/
@property (strong , nonatomic)  DBMovie *movie;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}


- (void) downloadContent {
    [[AFHTTPSessionManager manager] POST:@"https://api.douban.com/v2/movie/4212172" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.movie = [MTLJSONAdapter modelOfClass:[DBMovie class] fromJSONDictionary:responseObject error:nil];
        NSLog(@"movie = %@",self.movie);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (IBAction)startDownload:(id)sender {
    [self downloadContent];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"movie = %@",self.movie);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
