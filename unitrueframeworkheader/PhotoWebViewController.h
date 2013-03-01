
#import <UIKit/UIKit.h>


@interface PhotoWebViewController : UIViewController<UIWebViewDelegate> {
	UIWebView *webView;
}

- (void)loadImage:(NSString *)imageUrl;

- (void)loadHtml:(NSString *)html;

@end
