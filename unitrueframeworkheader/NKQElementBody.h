//
//  NKQElementBody.h
//  UnitrueFramework
//
//  Created by xudong jin on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKQElementBody : NSObject
{

   NSString* ElementBodyId;
   NSString* FilePath;
   NSData* FileContent;
   int MediaCategory;
   NSString* QuestionId;
   NSString* QuestionnaireId;
   NSString* ReferenceBLOBId;
   int SequenceNo;
   NSString* Title;
}

@property (nonatomic, retain)NSString* ElementBodyId;
@property (nonatomic, retain)NSString* FilePath;
@property (nonatomic, retain)NSData* FileContent;
@property (nonatomic, assign)int MediaCategory;
@property (nonatomic, retain)NSString* QuestionId;
@property (nonatomic, retain)NSString* QuestionnaireId;
@property (nonatomic, retain)NSString* ReferenceBLOBId;
@property (nonatomic, assign)int SequenceNo;
@property (nonatomic, retain)NSString* Title;
- (NKQElementBody*)initWithJsonDictionary:(NSDictionary*)dic;
@end
