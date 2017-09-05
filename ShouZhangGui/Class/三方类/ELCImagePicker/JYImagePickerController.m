//
//  JYImagePickerController.m
//  JInGuanJia
//
//  Created by liu.qingwei on 15/7/20.
//  Copyright (c) 2015年 liuqw. All rights reserved.
//

#import "JYImagePickerController.h"
#import "ELCImagePickerController.h"

#import <AssetsLibrary/ALAsset.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetsGroup.h>
#import <AssetsLibrary/ALAssetRepresentation.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"

@interface JYImagePickerController () <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, ELCImagePickerControllerDelegate>
@property (nonatomic, strong) FinishPickSingleImageBlock finishSinglePickImageBlock;
@property (nonatomic, strong) FinishPickMutliImageBlock finishMutliPickImageBlock;
@property (nonatomic, assign) BOOL mutliPick;

@property (nonatomic, assign) NSInteger maxImageCount;

@end

@implementation JYImagePickerController

+ (JYImagePickerController*)sharedInstance
{
    @synchronized(self)
    {
        static JYImagePickerController *instance = nil;
        if (instance == nil)
        {
            instance = [[self alloc] init];
            instance.maxImageCount = 20000;
        }
        return instance;
    }
}

+ (void)showSinglePickerInView:(UIView*)view block:(FinishPickSingleImageBlock)block
{
    JYImagePickerController *instance = [JYImagePickerController sharedInstance];
    instance.finishSinglePickImageBlock = block;
    instance.mutliPick = NO;
	
    UIActionSheet* actionSheet = [[UIActionSheet alloc]initWithTitle:nil
                                                            delegate:instance
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:@"拍照"
                                                   otherButtonTitles:@"从相册中选取", nil];
    
    [actionSheet showInView:view];
}

+ (void)showMutliPickerInView:(UIView*)view block:(FinishPickMutliImageBlock)block
{
    JYImagePickerController *instance = [JYImagePickerController sharedInstance];
    instance.finishMutliPickImageBlock = block;
    instance.mutliPick = YES;
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc]initWithTitle:nil
                                                            delegate:instance
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:@"拍照"
                                                   otherButtonTitles:@"从相册中选取", nil];
    
    [actionSheet showInView:view];
}

+ (void) showMutliPickerInView:(UIView *)view maxImageCount:(NSInteger)max block:(FinishPickMutliImageBlock)block
{
    JYImagePickerController *instance = [JYImagePickerController sharedInstance];
    instance.finishMutliPickImageBlock = block;
    instance.mutliPick = YES;
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc]initWithTitle:nil
                                                            delegate:instance
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:@"拍照"
                                                   otherButtonTitles:@"从相册中选取", nil];
    instance.maxImageCount = max;
    [actionSheet showInView:view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self actionOnOpenLocalCamera];
    }
    
    if (buttonIndex == 1)
    {
        [self actionOnOpenLocalPhotoLibrary];
    }
}


- (void) actionOnOpenLocalPhotoLibrary
{
    UIViewController *controller = nil;
    if (self.mutliPick == NO)
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        controller = imagePicker;
    }
    else
    {
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
        elcPicker.maximumImagesCount = self.maxImageCount; //Set the maximum number of images to select to 200
        elcPicker.returnsOriginalImage = YES; //Only return the fullScreenImage, not the fullResolutionImage
        elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
        elcPicker.onOrder = YES; //For multiple image selection, display and return order of selected images
        elcPicker.mediaTypes = @[@"kUTTypeImage",@"kUTTypeMovie"]; //Supports image and movie types
        elcPicker.imagePickerDelegate = self;
        controller = elcPicker;
    }
    
    if (controller == nil) return;
    
    UIViewController *rootController =  [UIApplication sharedApplication].delegate.window.rootViewController;
//    if ([rootController isKindOfClass:[UINavigationController class]])
//    {
        [((UINavigationController*)rootController)presentViewController:controller animated:YES completion:nil];
//    }
}

- (void) actionOnOpenLocalCamera
{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        UIViewController *rootController =  [UIApplication sharedApplication].delegate.window.rootViewController;
//        if ([rootController isKindOfClass:[UINavigationController class]])
//        {
            [((UINavigationController*)rootController)presentViewController:imagePicker animated:YES completion:nil];
//        }
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)
    {
        ALAssetRepresentation *representation = [myasset defaultRepresentation];
        NSString *fileName = [representation filename];
        NSLog(@"fileName : %@",fileName);
    };
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if (self.finishSinglePickImageBlock)
    {
        self.finishSinglePickImageBlock(originalImage);
    }
    if (self.finishMutliPickImageBlock)
    {
        self.finishMutliPickImageBlock(@[originalImage]);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:[info count]];
    for (NSDictionary *dict in info) {
        if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto)
        {
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                [images addObject:image];
            }
        }
    }
    
    if (self.finishMutliPickImageBlock)
    {
        self.finishMutliPickImageBlock(images);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



@end
