//
//  ViewController.m
//  loopPlayADdemo
//
//  Created by sidetang on 2017/5/16.
//  Copyright © 2017年 sidetang. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *placeHolderView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *imageNames = @[@"h1",
                            @"h2",
                            @"h3",
                            @"h4",
                            ];
    
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGSize placeSize = self.placeHolderView.bounds.size;
    NSLog(@"\nscreensize w = %f h = %f \n placeSize w = %f h = %f",screensize.width,screensize.height,placeSize.width,placeSize.height);
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, placeSize.width, placeSize.height) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
//    cycleScrollView.delegate = self;
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor];
//    [self.placeHolderView addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    
    //=========================================
    NSMutableArray<UIImage*> *imageArray = [NSMutableArray new];
    
    UIView* v1 = [self loadNibWithName];
    v1.backgroundColor = [UIColor redColor];
    UIImage *image = [self uiview2uiimageWithView:v1];
    [imageArray addObject:image];
    
    UIView* v2 = [self loadNibWithName];
    v2.backgroundColor = [UIColor greenColor];
    image = [self uiview2uiimageWithView:v2];
    [imageArray addObject:image];
    
    UIView* v3 = [self loadNibWithName];
    v3.backgroundColor = [UIColor orangeColor];
    image = [self uiview2uiimageWithView:v3];
    [imageArray addObject:image];
    
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screensize.width, v3.bounds.size.height) shouldInfiniteLoop:YES imageNamesGroup:imageArray];
    //    cycleScrollView2.delegate = self;
    cycleScrollView2.bannerImageViewContentMode = UIViewContentModeTopLeft;
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentLeft;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor];
    [self.placeHolderView addSubview:cycleScrollView2];
    cycleScrollView2.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView*)loadNibWithName
{
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"textView" owner:self options:nil] objectAtIndex:0];
    view.frame = self.placeHolderView.bounds;
    return view;
}

-(UIImage *)uiview2uiimageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
