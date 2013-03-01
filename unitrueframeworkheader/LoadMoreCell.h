

#import <Foundation/Foundation.h>


@interface LoadMoreCell : UITableViewCell {
    UILabel*                    label;
    UIActivityIndicatorView*    spinner;
}

@property(nonatomic, readonly) UIActivityIndicatorView* spinner;

@end
