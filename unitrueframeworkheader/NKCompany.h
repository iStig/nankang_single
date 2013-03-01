//
//  NKCompany.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VOEnums.h"
#import "CJSONSerializer.h"
#import "JSONRepresentation.h"
@interface NKCompany : NSObject<JSONRepresentation>
{
   NSString* address;
   NSString* areaCode;
   NSString* callerNo;
   NSString* capiClientId;
   NSString* contactPerson;
   NSString* contactPhone;
   NSString* countryCode;
   NSString* databaseServer;
   NSString* fAXNo;
   NSData* licence;
   NSString* name;
   NSString* password;
   enum EnumProjectStatus prop;
   NSString* propsText;
   NSString* sMSNo;
   int status;
   NSString* statusText;
   NSString* virtualCenterNo;
  NSString*Id;//公司码
}
@property (nonatomic, retain)NSString* Id;
@property (nonatomic, retain)NSString* address;
@property (nonatomic, retain)NSString* areaCode;
@property (nonatomic, retain)NSString* callerNo;
@property (nonatomic, retain)NSString* capiClientId;
@property (nonatomic, retain)NSString* contactPerson;
@property (nonatomic, retain)NSString* contactPhone;
@property (nonatomic, retain)NSString* countryCode;
@property (nonatomic, retain)NSString* databaseServer;
@property (nonatomic, retain)NSString* fAXNo;
@property (nonatomic, retain)NSData* licence;
@property (nonatomic, retain)NSString* name;
@property (nonatomic, retain)NSString* password;
@property (nonatomic, assign)enum EnumProjectStatus prop;
@property (nonatomic, retain)NSString* propsText;
@property (nonatomic, retain)NSString* sMSNo;
@property (nonatomic, assign)int status;
@property (nonatomic, retain)NSString* statusText;
@property (nonatomic, retain)NSString* virtualCenterNo;
- (NKCompany*)initWithJsonDictionary:(NSDictionary*)dic;
@end
