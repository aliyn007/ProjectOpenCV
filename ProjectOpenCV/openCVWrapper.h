//
//  openCVWrapper.h
//  ProjectOpenCV
//
//  Created by Александр on 17.02.2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface openCVWrapper : NSObject

+ (UIImage *)toGray:(UIImage *)image;

@end
NS_ASSUME_NONNULL_END
