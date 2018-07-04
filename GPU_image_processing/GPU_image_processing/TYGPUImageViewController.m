//
//  TYGPUImageViewController.m
//  GPU_image_processing
//
//  Created by 汤义 on 2018/7/4.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYGPUImageViewController.h"
#import "GPUImage.h"
@interface TYGPUImageViewController ()
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation TYGPUImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    [self addWithImageProcessing];
}

- (void)initView{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 64, 300, 300)];
    imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_imageView = imageView];
}

- (void)addWithImageProcessing{
    UIImage* inputImage = [UIImage imageNamed:@"23"];
    
    //使用黑白素描滤镜
    
    GPUImageSketchFilter* disFilter = [[GPUImageSketchFilter alloc] init];
    
    //设置要渲染的区域
    
    [disFilter forceProcessingAtSize:inputImage.size];
    
    [disFilter useNextFrameForImageCapture];
    
    //获取数据源
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    
    //添加上滤镜
    
    [stillImageSource addTarget:disFilter];
    
    //开始渲染
    
    [stillImageSource processImage];
    
    //获取渲染后的图片
    
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];

    _imageView.image = newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
