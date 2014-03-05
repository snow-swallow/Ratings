//
//  IclassViewController.m
//  Ratings
//
//  Created by timelyxyz on 14-2-26.
//
//

#import "IclassViewController.h"

@interface IclassViewController ()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end

@implementation IclassViewController
@synthesize webView = _webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://edu.iclass.com"]]];
    
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
