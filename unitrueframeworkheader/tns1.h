#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class tns1_UpLoadReadyInfo;
@interface tns1_UpLoadReadyInfo : NSObject {
	
/* elements */
	NSString * Guid;
	NSString * SavedFileName;
	NSNumber * TransferedSize;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_UpLoadReadyInfo *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * Guid;
@property (retain) NSString * SavedFileName;
@property (retain) NSNumber * TransferedSize;
/* attributes */
- (NSDictionary *)attributes;
@end
