//
//  ITS_UserListTableViewController.m
//  GitHubb
//
//  Created by Bernardo Ribeiro on 16/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_UserListTableViewController.h"



@interface ITS_UserListTableViewController ()

@end

@implementation ITS_UserListTableViewController
int const currentPageConst = 46;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set github logo
    UIImage *logo = [UIImage imageNamed:@"github-logo"];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:logo];
    self.navigationItem.titleView = logoView;   
  
    //add a shadow to navbar
    self.navigationController.navigationBar.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.navigationController.navigationBar.layer.shadowRadius = 3.0f;
    self.navigationController.navigationBar.layer.shadowOpacity = 1.0f;
    self.navigationController.navigationBar.layer.masksToBounds=NO;
    
    //tableview config
    [self.tableView setBounces:NO];
    [self.tableView setTableFooterView:[UIView new]];

    //Spinner methods
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.spinner.center = [self.view center];
    [self.view addSubview:self.spinner];
    
    //viewmodel and request setup
    self.viewModel = [[ITS_UserListViewModel alloc] init];
    self.currentPage = -currentPageConst;
    
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
    self.currentPage +=currentPageConst;
    [self.viewModel fetchUsersWithPage:self.currentPage completion:^(NSArray * _Nonnull userArray, NSString * _Nonnull error) {
        if(userArray){
            self.userArray = [[NSArray alloc] initWithArray:userArray];
        }
        
        //if there is an error
        if(error){
            self.currentPage -=currentPageConst; //if something goes wrong you need to pretend it didn't happen
            [self showAlert:error];
        }else{
            [self.tableView reloadData];
        }
        [self spinnerAnimate];
    }];
}

- (void)showAlert:(NSString *)alertMsg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network problem" message:alertMsg preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                        }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.userArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"userListCell";
    NSString *nibID = @"ITS_UserListTableViewCell";
    [self.tableView registerNib:[UINib nibWithNibName:nibID bundle:nil] forCellReuseIdentifier:cellID];
    ITS_UserListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.user = [self.userArray objectAtIndex:indexPath.row];
    cell.userNameLabel.text = cell.user.userLoginName;
    NSString *urlString = cell.user.userAvatarUrl;
    if(urlString){
        [cell.userImageView setImageWithURL:[[NSURL alloc] initWithString:urlString]];
    }
    

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 128.0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
        //alternate row colors
        if(indexPath.row % 2 != 0){
            [cell.contentView setAlpha:0.9];
        }else{
             [cell.contentView setAlpha:1];
        }
        int lastElement = (int) [self.userArray count]-1;
        if(indexPath.row == lastElement){
            [self fetchData];
        }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:NSBundle.mainBundle];
    ITS_ProfileViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"userProfile"];
    User *tempUser = [self.userArray objectAtIndex:indexPath.row];
    vc.stringUrl = tempUser.userUrl;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
