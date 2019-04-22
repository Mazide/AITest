//
//  FilterViewController.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterViewController.h"
#import "CollectionViewDataSource.h"

@interface FilterViewController () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UICollectionView *previewsCollectionView;

@property (strong, nonatomic) CollectionViewDataSource *collectionManager;

@end

@implementation FilterViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.previewsCollectionView.delegate = self;
    self.previewsCollectionView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.2];

    [self.output viewDidLoad];
}

#pragma mark - IBActions

- (IBAction)back:(id)sender {
    [self.output didTapBack];
}

- (IBAction)share:(id)sender {
    [self.output didTapShare];
}

#pragma mark - FilterViewInput

- (void)displayImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)displayPreviews:(NSArray<PreviewCellModel *> *)previewsCellsModels {
    self.collectionManager = [[CollectionViewDataSource alloc] initWithCellModels:previewsCellsModels];
    __auto_type registeredCellIds = [[NSMutableSet<NSString*> alloc] init];
    for (PreviewCellModel *model in previewsCellsModels) {
        if ([registeredCellIds containsObject:model.cellId]) {
            continue;
        }
        [registeredCellIds addObject:model.cellId];
        __auto_type nib = [UINib nibWithNibName:model.cellId bundle:nil];
        [self.previewsCollectionView registerNib:nib forCellWithReuseIdentifier:model.cellId];
    }
    self.previewsCollectionView.dataSource = self.collectionManager;
    [self.previewsCollectionView reloadData];
}

#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    id<CellModel> model = [self.collectionManager modelForIndexPath:indexPath];
    [self.output didSelectPreview:model];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(70, 70);
}

@end
