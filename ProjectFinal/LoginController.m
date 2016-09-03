//
//  LoginController.m
//  ProjectFinal
//
//  Created by Annalicia Ostos on 02/09/16.
//  Copyright © 2016 Codelko. All rights reserved.
//

#import "LoginController.h"
#import <DigitsKit/DigitsKit.h>



@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    DGTAuthenticateButton *authButton;
    
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            
            userID = session.userID;
            NSLog(@"Authentication error: %@", session.userID);

            // TODO: associate the session userID with your user model
            
            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
            
            [self performSegueWithIdentifier:@"LoginSuccess" sender:self];
            //HomeController *homeController = [[HomeController alloc] init];

            //[self.navigationController presentViewController:homeController animated:YES completion:nil];

            
            
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];

    authButton.center = self.view.center;
    [self.view addSubview:authButton];

    // Do any additional setup after loading the view.
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
