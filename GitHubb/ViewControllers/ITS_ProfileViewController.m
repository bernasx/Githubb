//
//  ITS_ProfileViewController.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 17/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_ProfileViewController.h"

@interface ITS_ProfileViewController ()

@end

@implementation ITS_ProfileViewController
int const currentProfilePageConst = 1;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //remove navbar shadow
    self.navigationController.navigationBar.layer.shadowOpacity = 0.0f;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    //round the top view's edges
    [self.topContainerView.layer setBorderWidth:0];
    [self.topContainerView setClipsToBounds:YES];
    [self.topContainerView.layer setCornerRadius:30];
    [self.topContainerView.layer setMaskedCorners:kCALayerMaxXMaxYCorner | kCALayerMinXMaxYCorner];
    
    //round imageview corners
    [self.profilePicImageView setClipsToBounds:YES];
    [self.profilePicImageView.layer setCornerRadius:20];
    
    //Spinner methods
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.spinner.center = [self.view center];
    [self.view addSubview:self.spinner];
    
    //viewmodel and request setup
    self.viewModel = [[ITS_UserProfileViewModel alloc] init];
    self.currentRepoPage = 0;
    [self fetchUserData];
}

-(void)spinnerAnimate{
    if([self.spinner isAnimating]){
        [self.spinner stopAnimating];
        [self.spinner setHidden:YES];
    }else{
        [self.spinner setHidden:NO];
        [self.spinner startAnimating];
    }
}

- (void)fetchUserData{
    [self spinnerAnimate];
    [self.viewModel fetchUserWithUrl:self.stringUrl completion:^(User * _Nonnull user, NSString * _Nonnull error) {
        //if there is an error
        if(error){
            [self showAlert:error];
        }else{
            self.user = user;
            [self configView];
            [self fetchRepoData];
        }
        [self spinnerAnimate];
    }];
}

- (void)fetchRepoData{
    [self spinnerAnimate];
    self.currentRepoPage += currentProfilePageConst;
    [self.viewModel fetchReposWithUrl:self.user.userReposUrl withPage:self.currentRepoPage completion:^(NSArray * _Nonnull repoArray, NSString * _Nonnull error) {
        
        
        if(repoArray){
            self.repoArray = [[NSArray alloc] initWithArray:repoArray];
        }else{
            self.currentRepoPage -=currentProfilePageConst;
            return;
        }
            //if there is an error
        if(error){
            self.currentRepoPage -=currentProfilePageConst; //if something goes wrong you need to pretend it didn't happen
            [self showAlert:error];
        }else{
            [self.repoCollectionView reloadData];
        }
        [self spinnerAnimate];
    }];
}


-(void)configView{
    self.nameLabel.text = self.user.userLoginName;
    NSString *urlString = self.user.userAvatarUrl;
    
    if(urlString){
        [self.profilePicImageView setImageWithURL:[[NSURL alloc] initWithString:urlString]];
    }
    
    if(![self.user.userName isKindOfClass:[NSNull class]]){
       self.infoLabel.text = [self.infoLabel.text stringByAppendingFormat:@"• %@ \n",self.user.userName];
    }
    if(![self.user.userLocation isKindOfClass:[NSNull class]]){
       self.infoLabel.text = [self.infoLabel.text stringByAppendingFormat:@"• %@ \n",self.user.userLocation];
    }
    if(![self.user.userEmail isKindOfClass:[NSNull class]]){
         self.infoLabel.text = [self.infoLabel.text stringByAppendingFormat:@"• %@ \n",self.user.userEmail];
    }
}

- (void)showAlert:(NSString *)alertMsg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network problem" message:alertMsg preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                        }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UICollectionView Delegate and Data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.repoArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellID = @"repoCollectionCell";
    NSString *nibID = @"ITS_RepoCollectionViewCell";
    UINib *nib = [UINib nibWithNibName:nibID bundle:NSBundle.mainBundle];
    [self.repoCollectionView registerNib:nib forCellWithReuseIdentifier:cellID];
    ITS_RepoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.repo = [self.repoArray objectAtIndex:indexPath.row];
    cell.repoNameLabel.text = cell.repo.repoName;
    if(![cell.repo.repoDescription isKindOfClass:[NSNull class]]){
        cell.repoDescriptionLabel.text = cell.repo.repoDescription;
    }
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    int lastElement = (int) [self.repoArray count]-1;
    if(indexPath.row == lastElement){
        [self fetchRepoData];
    }
}


@end
