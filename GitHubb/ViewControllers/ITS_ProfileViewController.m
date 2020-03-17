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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //round the top view's edges
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
    [self fetchData];
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

- (void)fetchData{
    [self spinnerAnimate];
    [self.viewModel fetchUserWithUrl:self.stringUrl completion:^(User * _Nonnull user, NSString * _Nonnull error) {
        //if there is an error
        if(error){
            [self showAlert:error];
        }else{
            self.user = user;
            [self configView];
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


@end
