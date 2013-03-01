

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import "Photo.h"
#import "PhotoImageView.h"

#import "PhotoWebViewController.h"

@interface PhotoViewController : UIViewController <UIScrollViewDelegate, 
		UIActionSheetDelegate, MFMailComposeViewControllerDelegate, PhotoImageViewDelegate> {
	PhotoImageView *photoImageView;
	
	UIBarButtonItem *_actionButton;
	
	BOOL _rotating;
	BOOL _barsHidden;
	
	BOOL _storedOldStyles;
	UIStatusBarStyle _oldStatusBarSyle;
	UIBarStyle _oldNavBarStyle;
	BOOL _oldNavBarTranslucent;
	UIColor* _oldNavBarTintColor;	
	UIBarStyle _oldToolBarStyle;
	BOOL _oldToolBarTranslucent;
	UIColor* _oldToolBarTintColor;	
	BOOL _oldToolBarHidden;
	
}

- (void)showImage:(Photo *)photo;

@end
