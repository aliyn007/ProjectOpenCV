//
//  openCVWrapper.m
//  ProjectOpenCV
//
//  Created by Александр on 17.02.2022.
//

#import "openCVWrapper.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>


@implementation openCVWrapper

+ (UIImage *)toGray:(UIImage *)image {
    cv::Mat imageMat;
    UIImageToMat(image, imageMat);
    if (imageMat.channels() == 1) return image;
    cv::Mat grayMat;
    cv::cvtColor(imageMat, grayMat, cv::COLOR_BGR2GRAY);
    return MatToUIImage(grayMat);
    

    }

@end
