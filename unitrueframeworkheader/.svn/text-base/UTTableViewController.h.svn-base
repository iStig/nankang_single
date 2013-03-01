//
//  UTTableViewController.h
//  CstWeibo
//
//  Created by xudong jin on 12-4-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"UTBaseViewController.h"
#import "PullRefreshTableView.h"
@interface UTTableViewController : UTBaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    PullRefreshTableView        *tableView;
    BOOL _reloading;
        BOOL _fobbidenPullRefresh;

}
-(void)getItemsWhenPullDownTableView;
- (void)doneLoadingTableViewData;
@end
