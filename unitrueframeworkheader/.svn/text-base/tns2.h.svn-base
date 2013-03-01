#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class tns2_ResultObject;
#import "tns3.h"
@interface tns2_ResultObject : NSObject {
	
/* elements */
	tns3_ArrayOfanyType * content;
	NSString * info;
	NSString * msg;
	NSNumber * result;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns2_ResultObject *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns3_ArrayOfanyType * content;
@property (retain) NSString * info;
@property (retain) NSString * msg;
@property (retain) NSNumber * result;
/* attributes */
- (NSDictionary *)attributes;
@end
