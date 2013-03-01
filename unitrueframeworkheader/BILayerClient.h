//
//  BILayerClient.h
//  MyLocalTimeSoap
//
//  Created by xudong jin on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JavaClientService.h"
@interface BILayerClient : NSObject<IJavaClientServiceBindingResponseDelegate>
{
  IJavaClientServiceBinding *bind1;
     SEL action;
  id                context;
  id                  delegate;
}
@property(nonatomic,retain)id context;
-(BILayerClient*)initWithTarget:(id)aDelegate action:(SEL)anAction;

#pragma mark - 登录接口
//获取session编号
//参数：curSessionId，当前session编号，若第一次请求，为null值
//返回值:新的session编号
-(void)getSessionID:(NSString*)curSessionId;

//访员登录
//参数：	loginName 登录名
//passWord 密码
//companyCode 公司码
//deviceCode 设备号
//deviceType 设备类型 0：noteBook 1:android 2:IOS 3：mobile
//返回值：AgentLoginResult对象序列化后的字符串，其中result为-1时，登录失败；为0时登录成功。
-(void)agentLogin:(NSString*) loginName  passWord:(NSString*) passWord  companyCode:(NSString*)companyCode   deviceType:(NSString*) deviceType;

//访员注销
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//返回值：AgentLoginResult对象序列化后的字符串，其中result为-1时，注销失败；为0时候注销成功。
-(void)agentLoginOut:(NSString*) loginName    companyCode:(NSString*)companyCode   ;

#pragma mark - 程序接口

//获取客户端程序版本信息
//参数：  deviceType 设备类型
//resolutionType 分辨率类型 枚举值分别为：Normal, R320x480, R480x854, R800x600, R1024x768
//返回值：StringResult序列化后的字符串，其中result=-1时，无记录；result=1时，有版本记录，同时info存放版本号，版本号由主版本号和次版本号组成，中间由”.”分隔。
-(void)getClientVersionInfo:(NSString*)deviceType  resolutionType:(int) resolutionType;

//获取客户端程序大小
//参数：	deviceType 设备类型
//resolutionType 分辨率类型 枚举值分别为：Normal, R320x480, R480x854, R800x600, R1024x768
//返回值：文件实际长度，由Long型数据转成字符串
-(void)getClientProgrameFileSize:(NSString*)deviceType  resolutionType:(int) resolutionType; 

//下载客户端程序
//参数：	startPos 开始读取的位置
//endPos 结束读取的位置
//deviceType 设备类型
//resolutionType 分辨率类型 枚举值分别为：Normal, R320x480, R480x854, R800x600, R1024x768
//返回值：按指定范围读取的字节数组。
-(void)downLoadClientPrograme:(NSString*)deviceType  resolutionType:(int) resolutionType startPos:(int) startPos endPos:(int)endPos ; 

#pragma mark - 项目样本接口
//获取项目列表
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//返回值：ResultObject序列化后的字符串，若result值小于0，表示获取失败，msg中有失败原因；若result为1，表示获取成功，content字段存放项目VO组成的列表。
-(void)getProjectList:(NSString*) loginName    companyCode:(NSString*)companyCode   ;

//获取已上传样本列表
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//返回值：ResultObject序列化后的字符串，若result小于-1，表示获取失败；若result等于-1，表示没有相关已上传样本；若result为1，表示有已上传访问样本，此时，content部分存放样本列表。
-(void)getSampleList:(NSString*) loginName    companyCode:(NSString*)companyCode projectId:(NSString*)projectid   ;

//获取当前访员当前项目对应的最新任务的样本列表
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//返回值：ResultObject序列化后的字符串，若result小于-1，表示获取失败；若result等于-1，表示没有相关已上传样本；若result为1，表示有已上传访问样本，此时，content部分存放样本列表。
-(void)getNewstSampleList:(NSString*) loginName    companyCode:(NSString*)companyCode projectId:(NSString*) projectId   ;

#pragma mark - 任务下载
//获取下载任务信息
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//返回值：DownLoadResumeFileWrapper序列化后的字符串。若result小于0，获取失败，msg部分为失败原因；若result=1,获取成功，若为第一次下发，则任务版本号为-1；否则是大于0的整数，若该任务DownLoadTaskState为1，表示任务还在下载中，需要提示用户是否继续下载。否则，任务DownLoadTaskState为0，表示任务还未被下载过，ResumenFileList部分存放将要被下载的文件列表。
-(void)getDownLoadResumeFileWrapper:(NSString*) loginName    companyCode:(NSString*)companyCode  projectId:(NSString*)projectId   ;

//下载文件
//参数:		startPos	开始位置
//endPos结束位置
//guid 也即文件VO中的编号
//返回值：读取的字节数组
-(void)downLoadFile:(int) startPos endPos:(int) endPos guid:(NSString*)guid;

//发送任务下载完成状态信息
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//deviceType 设备类型
//taskId	项目编号
//返回值：无。
-(void)sendCompleteUpLoadTaskInfo:(NSString*) loginName    companyCode:(NSString*)companyCode   projectId:(NSString*) projectId deviceType:(NSString*) deviceType taskid:(NSString*) taskid;

#pragma mark - 任务上传

//获取上传任务记录信息
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//deviceType 设备类型
//sessionId 从服务器获取的sessionId
//返回值：UpLoadResumeFileWrapper对象序列化后的字符串，若result 为-1，表示获取失败，msg部分为错误提示；若result为1，标识获取成功，然后根据当前已上传任务状态UpnLoadTaskState(0:准备中 1：上传中 2：上传完成 3：无效)；判断是否上传完成，ResumenFileList为文件列表集合。
-(void)getUpLoadResumeFileWrapper:(NSString*) loginName    companyCode:(NSString*)companyCode  projectId:(NSString*) projectId sessionId:(NSString*) sessionId;

//第一次上传或者重新上传，发送开始上传任务信息。
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//deviceType 设备类型
//fileList 序列化后的文件列表(CAPIResumeFileListVO列表)
//sessionId 从服务器获取的sessionId
//返回值：无。
-(void)sendBeginUpLoadTaskInfo:(NSString*) loginName    companyCode:(NSString*)companyCode  projectId:(NSString*) projectId deviceType:(NSString*) deviceType fileList:(NSString*) fileList sessionId:(NSString*) sessionId;

//单个文件开始上传
//参数：fileName 文件名
//fileLength 文件总长度
//guid ResumeFileListVO编号
//keepOn 是否续传 为true时，当服务器上面存在同名文件，则进行续传
//sessionId session编号
//返回值：。
-(void)beginUpLoad:(NSString*) fileName    fileLength:(long)fileLength guid:(NSString*) guid  keepOn:(Boolean) keepOn  sessionId:(NSString*) sessionId;

//上传文件内容
//参数：	bytes 上传的字节数组
//guid 也即文件VO中的编号
//sessionId 当前一次下载过程的sessionId,在开始下载时从服务器获取。
//返回值：guid
-(void)upLoad:(NSData*) bytes  guid:(NSString*)guid sessionId:(NSString*)sessionId;

#pragma mark - 客户端设备接口

//查询注册情况
//参数：	clientCode 客户端硬件设备号。
//返回值：整型状态--- -1：获取失败
//0：未注册
//1：已审核
//2：未审核
//3：取消注册
//4：注册设备已过期  
//只有当状态为1时才允许登录。
-(void)getRegisterClient;

//创建注册申请
//参数：	clientCode 客户端硬件设备号
//clientName 客户端名称
//companyCode 公司码 可以为空
//无返回值
-(void)createRegisterClient :(NSString*)clientName companyCode:(NSString*)companyCode;

#pragma mark - 实时监控接口
//获取终端是否需要监测状态信息
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//deviceType 设备类型
//返回值：结果字符串,若为”success”则需要发送监控图片和答题路径，若为”fail”为不需要发送监控图片和答题路径。
-(NSString*)getInspectStatus:(NSString*) loginName    companyCode:(NSString*)companyCode   deviceType:(NSString*) deviceType ;

//发送GPS监测信息
//参数：	loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//deviceType 设备类型
//gps	gps信息，中间用|分隔开，前面是纬度，后面是经度。
//返回值：字符串信息若为”success”，则更新成功，否则，更新失败。
//•	发送答题路径信息
-(void)sendInfo:(NSString*) loginName    companyCode:(NSString*)companyCode   deviceType:(NSString*) deviceType  projectId:(NSString*) projectId  gps:(NSString*) gps ;

//发送答题路径信息
//参数：	agentId 访员编号
//loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//deviceType 设备类型
//projectCode 项目代号
//content 内容
//返回值：字符串信息若为”更新成功”，则更新成功，否则，更新失败。
-(void)sendTrackInfo:(NSString*)agentId  loginName:(NSString*) loginName    companyCode:(NSString*)companyCode   content:(NSString*) content  projectId:(NSString*) projectId  projectCode:(NSString*) projectCode ;

//发送监控图片
//参数：	contents 图片二进制内容
//agentId 访员编号
//loginName 登录名
//companyCode 公司码
//deviceCode 设备号
//projectId 项目编号
//fileName 图片文件名
//startPos 开始位置
//fileLength 文件长度
//返回值：字符串信息若为”success”，则更新成功，否则，更新失败。
-(void)sendInspectImage:(NSString*)agentId  loginName:(NSString*) loginName    companyCode:(NSString*)companyCode   contents:(NSData*) contents  projectId:(NSString*) projectId  fileName:(NSString*) fileName  startPos:(int) startPos fileLength:(int) fileLength;
@end
