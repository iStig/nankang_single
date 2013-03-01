#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class tns3_ArrayOfanyType;
@interface tns3_ArrayOfanyType : NSObject {
	
/* elements */
	NSMutableArray *anyType;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns3_ArrayOfanyType *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
- (void)addAnyType:(NSString *)toAdd;
@property (readonly) NSMutableArray * anyType;
/* attributes */
- (NSDictionary *)attributes;
@end
