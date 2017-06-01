//
//  ShopViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/20.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ShopViewController.h"
#import "Networks.h"
#import "ShopCell.h"
#import "ShopHeadView.h"
#import "LoopScrollView.h"
#import "ShopDetailViewController.h"


typedef enum : NSUInteger {
    shopHome,//商城首页
    shopStores,//家居百货
    shopIntelligent,//智能家居
} Shop;


@interface ShopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UISearchBar *shopSearchBar;
@property (strong, nonatomic) UICollectionView *shopCollectionView;
@property (nonatomic,strong) NSMutableArray *shopArray;
@property (nonatomic,strong) NSMutableArray *storesArray;
@property (nonatomic,strong) NSMutableArray *intelligentArray;
@property (assign,nonatomic) Shop shopType;
@property (weak, nonatomic) IBOutlet UIButton *shopHomeBtn;//商城首页
@property (weak, nonatomic) IBOutlet UIButton *shopStoresBtn;//家居百货
@property (weak, nonatomic) IBOutlet UIButton *shopIntelligentBtn;//智能家居

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.shopType = shopHome;
    [self dataTest];
    [self.shopSearchBar setBackgroundImage:[UIImage new]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self settingNavigationbar];
    [self.view addSubview:self.shopCollectionView];
}

/**
 模拟数据
 */
- (void)dataTest
{
    for (int i = 0; i<15; i++) {
        [self.shopArray addObject:@1];
    }
    
    for (int i = 0; i<3; i++) {
        [self.storesArray addObject:@1];
    }
    
    for (int i = 0; i<20; i++) {
        [self.intelligentArray addObject:@1];
    }
}



- (NSMutableArray *)shopArray
{
    if (_shopArray == nil) {
        _shopArray = [NSMutableArray array];
    }
    return _shopArray;
}

- (NSMutableArray *)storesArray
{
    if (_storesArray == nil) {
        _storesArray = [NSMutableArray array];
    }
    return _storesArray;
}

- (NSMutableArray *)intelligentArray
{
    if (_intelligentArray == nil) {
        _intelligentArray = [NSMutableArray array];
    }
    return _intelligentArray;
}



/**
 *  CollectionView 流式布局
 */
-(UICollectionView *)shopCollectionView
{
    if (_shopCollectionView == nil) {
        //默认布局方式: 流式布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        _shopCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 86, kWIN_WIDTH, kWIN_HEIGHT-64-49-86) collectionViewLayout:layout];
        _shopCollectionView.bounces = NO;
        _shopCollectionView.dataSource = self;
        _shopCollectionView.delegate = self;
        _shopCollectionView.backgroundColor = [UIColor whiteColor];
        _shopCollectionView.showsHorizontalScrollIndicator = NO;
        _shopCollectionView.showsVerticalScrollIndicator = NO;
        
        //
//        [_shopCollectionView registerClass:[ShopCell class] forCellWithReuseIdentifier:NSStringFromClass([ShopCell class])];
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([ShopCell class])
                                    bundle: [NSBundle mainBundle]];
        [_shopCollectionView registerNib:nib forCellWithReuseIdentifier:NSStringFromClass([ShopCell class])];
        [_shopCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ShopHeadView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ShopHeadView class])];
    }
    return _shopCollectionView;
}



#pragma mark - CollectionView

//collectionView代理方法, 控制每个段的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 15, 10, 15);
}

//控制每个item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat cellW = (kWIN_WIDTH - 46)/2.0;
    CGFloat cellH = cellW /3.0 *2.0 + 80;

    return CGSizeMake(cellW, cellH);
}


- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}


- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}

//返回段数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//返回每个段总item(cell)的数量
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.shopType == shopHome) {
        return self.shopArray.count;
    } else if (self.shopType == shopStores) {
        return self.storesArray.count;
    } else {
        return self.intelligentArray.count;
    }
}

//返回每个item对应的cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    ShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ShopCell class]) forIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    return cell;
    
}



//代理方法, item点击执行
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShopDetailViewController *shopDetailVC = [[ShopDetailViewController alloc] init];
    shopDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shopDetailVC animated:YES];

}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (self.shopType == shopHome) {
        return CGSizeMake(kWIN_WIDTH, kWIN_WIDTH/12.0*5.0);

    } else {
        return CGSizeZero;
    }
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    if (kind == UICollectionElementKindSectionHeader) {
//        ShopHeadView *headerRV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([ShopHeadView class]) forIndexPath:indexPath];
//        
////        NSLog(@"%@",headerRV);
////        headerRV.loopscrollView.pageCount = 3;
//
////        NSArray *imageArray = @[
////                                @"http://img03.liwushuo.com/image/160222/cya7ul0v2.jpg-w720",
////                                @"http://img03.liwushuo.com/image/160225/s0zlrxo86.jpg-w720",
////                                @"http://img02.liwushuo.com/image/160204/ql9tvfhax.jpg-w720",
////                                @"http://img01.liwushuo.com/image/160219/1no7rb071.jpg-w720"];
////        
////        //LoopScrollView *loopScrollView = [[LoopScrollView alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, kWIN_WIDTH/12.0*5.0)];
////        //设置属性
////        headerRV.loopscrollView.pageCount = (int)imageArray.count;
////        headerRV.loopscrollView.autoScroll = YES;
////        headerRV.loopscrollView.showPageControl = YES;
////        headerRV.loopscrollView.frame = CGRectMake(0, 0, kWIN_WIDTH, kWIN_WIDTH/12.0*5.0);
////        [headerRV.loopscrollView setClickAction:^(UIImageView *imageView, int index) {
////            
////            NSLog(@"点击第%d张图",(int)index);
////            
////        }];
////        //设置网络图片
////        //注意: 添加网络图片之前, 需要先设置显示的页数
////        for (int i=0; i<imageArray.count; i++) {
////            [headerRV.loopscrollView setImageWithUrlString:imageArray[i] atIndex:i];
////        }
//
//        return headerRV;
//        
//    } else {
//        return nil;
//    }
//}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


/**
 *  配置导航栏
 */
- (void)settingNavigationbar
{
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setBackgroundColor:RGB(219, 0, 17)];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:RGB(219, 0, 17)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"商城";
}

- (IBAction)searchBtnClick:(UIButton *)sender {
    [self.view endEditing:YES];
}

//首页（商城）
- (IBAction)shopHomeBtnClick:(UIButton *)sender {
    self.shopStoresBtn.selected = NO;
    self.shopIntelligentBtn.selected = NO;
    sender.selected = YES;
    self.shopType = shopHome;
    [self.shopCollectionView reloadData];
}

//家居百货
- (IBAction)shopStoresBtnClick:(UIButton *)sender {
    self.shopHomeBtn.selected = NO;
    self.shopIntelligentBtn.selected = NO;
    sender.selected = YES;
    self.shopType = shopStores;
    [self.shopCollectionView reloadData];
}

//智能家居
- (IBAction)shopIntelligentBtnClick:(UIButton *)sender {
    self.shopStoresBtn.selected = NO;
    self.shopHomeBtn.selected = NO;
    sender.selected = YES;
    self.shopType = shopIntelligent;
    [self.shopCollectionView reloadData];
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
