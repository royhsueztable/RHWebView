//
//  RHViewController.m
//  RHWebView
//
//  Created by Roy Hsu on 2014/8/15.
//
//

#import "RHViewController.h"

@interface RHViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation RHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setup];
}

- (void)setup
{
//    [self loadContentRemotely];
    
    [self loadContentLocally];
}

- (void)loadContentRemotely
{
    NSURL *url = [NSURL URLWithString:@"http://appleday.cc"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

- (void)loadContentLocally
{
    NSString *localPageHTML = [[NSBundle mainBundle] pathForResource:@"LocalPage" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:localPageHTML encoding:NSUTF8StringEncoding error:nil];
    
    htmlString = [self appendingJavaScript:htmlString];
    
    [self.webView loadHTMLString:htmlString baseURL:nil];
}

- (NSString *)appendingJavaScript:(NSString *)htmlString
{
    NSString *javaScript = @"<script>alert(\"This is an alert!!\");</script>";
    
    return [htmlString stringByAppendingString:javaScript];
}

@end
