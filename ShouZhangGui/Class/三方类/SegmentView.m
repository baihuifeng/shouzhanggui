//
//  SegmentView.m
//  testH
//
//  Created by 葬花桥 on 2016/10/20.
//  Copyright © 2016年 葬花桥. All rights reserved.
//

#import "SegmentView.h"

@implementation SegmentView

- (id)initWithItmes:(NSArray *)itmesArr WithFrame:(CGRect)frame LabelType:(radiuLabelType)radiuLabelType{
    if (self = [super init]) {
        
        
        if (radiuLabelType == radiuLabelTypeBottom) {
            self.frame = frame;
        } else {
            if (frame.size.width < (int)itmesArr.count*85) {
                CGRect framF = frame;
                framF.size.width = (int)itmesArr.count *85;
                self.frame = framF;
                frame = framF;
            } else {
                self.frame = frame;
            }
        }
        _backgroundLabel.clipsToBounds = YES;
        

        _radiuLabelType = radiuLabelType;
        _backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _backgroundLabel.backgroundColor = [UIColor clearColor];
        
        
        [self addSubview:_backgroundLabel];
        
        self.radiuView = [[LeftLabelView alloc] initWithRadiuLabelType:_radiuLabelType WithFrame:CGRectMake(CGRectGetMinX(_backgroundLabel.frame), CGRectGetMinY(_backgroundLabel.frame), self.frame.size.width/(int)itmesArr.count, self.frame.size.height)];
        [self addSubview:self.radiuView];

        NSMutableArray *buttonArr = [[NSMutableArray alloc] init];
        for (int i = 0; i<itmesArr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(0+self.frame.size.width/(int)itmesArr.count*i, 0, self.frame.size.width/(int)itmesArr.count, self.frame.size.height);
            [btn setTitle:itmesArr[i] forState:UIControlStateNormal];
            btn.tag = i;
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
//            btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
            [btn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
            [btn setTintColor:[UIColor clearColor]];
            [self addSubview:btn];
            btn.backgroundColor = [UIColor clearColor];
            [btn addTarget:self action:@selector(selectedView:) forControlEvents:UIControlEventTouchUpInside];
            [buttonArr addObject:btn];
        }
        _itmeArr = buttonArr;
        
        
        NSMutableArray *lineMutableArr = [[NSMutableArray alloc] init];
        for (int i = 0; i<_itmeArr.count-1; i++) {
            UIButton *button = _itmeArr[i];
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button.frame), 0, 0.5, self.frame.size.height)];
            view.backgroundColor = [UIColor blackColor];
            view.tag = i+1000;
            view.hidden = YES;
            [self addSubview:view];
            [lineMutableArr addObject:view];
        }
        _lineArr = lineMutableArr;
        
        
 
    }
    return self;
}


- (void)setIsShowLine:(BOOL)isShowLine {
    _isShowLine = isShowLine;
    for (UIView *view in _lineArr) {
        view.hidden = _isShowLine;
    }
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    for (UIView *view in _lineArr) {
        view.backgroundColor = lineColor;
    }
}

- (void)setLineHeight:(CGFloat)lineHeight {
    _lineHeight = lineHeight;
    for (UIView *view in _lineArr) {
        CGRect viewFram = view.frame;
        viewFram.origin.y = (view.frame.size.height-lineHeight)/2;
        viewFram.size.height = lineHeight;
        view.frame = viewFram;
    }

}

- (void)selectedView:(UIButton *)sender {
    
    if (sender.selected == YES) {
        return;
    }
    if (sender.selected) {
        self.selectIndex = NSNotFound;
    } else {
        self.selectIndex = sender.tag;
    }
    [self buttonSelectedIndex];
}
- (void)setSelectIndex:(NSInteger)selectIndex {
    
    _selectIndex = selectIndex;
    [self resetNoneSelectStatus];
    [self buttonSelectedIndex];
    if (selectIndex != NSNotFound)
    {
        UIButton* btn = [self.itmeArr objectAtIndex:selectIndex];
        btn.selected = YES;
    }
}
- (void)resetNoneSelectStatus
{
    for (UIButton* btn in self.itmeArr)
    {
        btn.selected = NO;
    }
}
- (void)buttonSelectedIndex {
    UIButton *button = _itmeArr[_selectIndex];
    if (_radiuLabelType == radiuLabelTypeLeft || _radiuLabelType == radiuLabelTypeRight) {
        if (_selectIndex == 0) {
            [UIView animateWithDuration:_timer animations:^{
                CGRect rect = self.radiuView.frame;
                rect.origin.x = _selectIndex*self.radiuView.frame.size.width;
                self.radiuView.frame = rect;
                self.radiuView.radiuType = radiuLabelTypeLeft;
                self.radiuView.radiusF = _radiuRadius;
            }];
        } else if (_selectIndex == (int)_itmeArr.count-1) {
            [UIView animateWithDuration:_timer animations:^{
                CGRect rect = self.radiuView.frame;
                rect.origin.x = _selectIndex*self.radiuView.frame.size.width;
                self.radiuView.frame = rect;
                self.radiuView.radiuType = radiuLabelTypeRight;
                self.radiuView.radiusF = _radiuRadius;
            }];
        } else {
            [UIView animateWithDuration:_timer animations:^{
                CGRect rect = self.radiuView.frame;
                rect.origin.x = _selectIndex*self.radiuView.frame.size.width;
                self.radiuView.frame = rect;
                self.radiuView.radiuType = radiuLabelTypeNone;
                self.radiuView.radiusF = _radiuRadius;
            }];
        }
    } else if (_radiuLabelType == radiuLabelTypeNone){
        _backgroundLabel.layer.cornerRadius = 0;
        [UIView animateWithDuration:_timer animations:^{
            CGRect rect = self.radiuView.frame;
            rect.origin.x = _selectIndex*self.radiuView.frame.size.width;
            self.radiuView.frame = rect;
        }];
    } else if (_radiuLabelType == radiuLabelTypeBottom){
        _backgroundLabel.layer.cornerRadius = 0;
        [UIView animateWithDuration:_timer animations:^{
            CGRect rect = self.radiuView.frame;
            rect.origin.x = _selectIndex*self.radiuView.frame.size.width;
            self.radiuView.frame = rect;
        }];
    } else {
        [UIView animateWithDuration:_timer animations:^{
            
            CGRect rect = self.radiuView.frame;
            rect.origin.x = CGRectGetMinX(button.frame)+_interval;
            rect.size.width = self.radiuView.frame.size.width - _interval;
            self.radiuView.frame = rect;

        }];
        
    
    }
    [self.delegate index:_selectIndex];
  
}

- (void)setTimer:(NSTimeInterval)timer {
    _timer = timer;
}


- (void)setInterval:(CGFloat)interval {
    _interval = interval;
    if (_radiuLabelType == radiuLabelTypeLeftWithRight) {
        UIButton *button = _itmeArr[_selectIndex];
        CGRect rect = self.radiuView.frame;
        rect.origin.x = CGRectGetMinX(button.frame)+_interval;
        rect.size.width = self.radiuView.frame.size.width - 2*_interval;
        self.radiuView.frame = rect;
        CGRect rightRect = self.radiuView.rightRadiuLabel.frame;
        rightRect.size.width = self.radiuView.rightRadiuLabel.frame.size.width - 2*_interval;
        self.radiuView.rightRadiuLabel.frame = rightRect;
    }

    [self buttonSelectedIndex];
    self.radiuView.intervalF = interval;
}



- (void)setRadiuLabelType:(radiuLabelType)radiuLabelType {
    _radiuLabelType = radiuLabelType;
    self.radiuView.radiuType = radiuLabelType;
}



//滑块的弧度
- (void)setBackcornerRadius:(CGFloat)BackcornerRadius {
    _BackcornerRadius = BackcornerRadius;
    
    _backgroundLabel.layer.cornerRadius = BackcornerRadius > _backgroundLabel.frame.size.height/2 ? _backgroundLabel.frame.size.height/2 : BackcornerRadius;

}

- (void)setRadiuRadius:(CGFloat)radiuRadius {
    _radiuRadius = radiuRadius;
    self.radiuView.radiusF = _radiuRadius;

    
}

- (void)setDefaultColor:(UIColor *)defaultColor {
    _defaultColor = defaultColor;
    
    for (UIButton *buttonDefault in _itmeArr) {
        [buttonDefault setTitleColor:defaultColor forState:UIControlStateNormal];
    }

}
- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
    for (UIButton *buttonDefault in _itmeArr) {
        [buttonDefault setTitleColor:selectedColor forState:UIControlStateSelected];
    }

}


- (void)setLabelBackgroundColor:(UIColor *)labelBackgroundColor {
    _labelBackgroundColor = labelBackgroundColor;
    _backgroundLabel.backgroundColor = labelBackgroundColor;
}


- (void)setcolorWithBackgroundColor:(UIColor *)backgroundColor radiuLabelBackgroudColor:(UIColor *)radiuColor defaultColor:(UIColor *)defaultColor selectedColor:(UIColor *)selectedColor {
    self.labelBackgroundColor = backgroundColor;
    self.radiuLabelColor = radiuColor;
    self.defaultColor = defaultColor;
    self.selectedColor = selectedColor;
}

@end

@implementation LeftLabelView

- (id)initWithRadiuLabelType:(radiuLabelType)radiuLabelType WithFrame:(CGRect)frame {
    if (self = [super init]) {
        self.frame = frame;
        
        _leftRadiuLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/2, frame.size.height)];

        [self addSubview:_leftRadiuLabel];
        _rightRadiuLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftRadiuLabel.frame)-frame.size.width/4, 0, frame.size.width/2+frame.size.width/4, frame.size.height)];
        _leftRadiuLabel.backgroundColor = [UIColor colorWithRed:248/255.0 green:165/255.0 blue:26/255.0 alpha:1.0];
        _rightRadiuLabel.backgroundColor = [UIColor colorWithRed:248/255.0 green:165/255.0 blue:26/255.0 alpha:1.0];
        [self addSubview:_rightRadiuLabel];
        self.radiuType = radiuLabelType;
    }
    return self;
}


- (void)setIntervalF:(CGFloat)intervalF {
    _intervalF = intervalF;
    CGRect leftRect = _leftRadiuLabel.frame;
    leftRect.origin.y += intervalF;
    leftRect.size.height -= 2*intervalF;
    _leftRadiuLabel.frame = leftRect;
    CGRect rightRect = _rightRadiuLabel.frame;
    rightRect.origin.y += intervalF;
    rightRect.size.height -= 2*intervalF;
    _rightRadiuLabel.frame = rightRect; 
}

- (void)setRadiuType:(radiuLabelType)radiuType {
    _radiuType = radiuType;
}
- (void)setHeightRadius {
    if (_radiuType == radiuLabelTypeBottom && _radiusHeight != 0) {
        CGRect framRect = self.frame;
        framRect.origin.y = self.superview.frame.size.height-_radiusHeight;
        framRect.size.height = _radiusHeight;
        self.frame = framRect;
        CGRect leftRect = _leftRadiuLabel.frame;
        leftRect.origin.y = self.frame.size.height-_radiusHeight;
        leftRect.size.height = _radiusHeight;
        _leftRadiuLabel.frame = leftRect;
        CGRect rightRect = _rightRadiuLabel.frame;
        rightRect.origin.y = self.frame.size.height-_radiusHeight;
        rightRect.size.height = _radiusHeight;
        _rightRadiuLabel.frame = rightRect;
    } else {
        CGRect framRect = self.frame;
        framRect.origin.y = self.superview.frame.size.height-2;
        framRect.size.height = 2;
//        framRect.origin.x = 0;
        self.frame = framRect;
        CGRect leftRect = _leftRadiuLabel.frame;
        leftRect.origin.y = self.frame.size.height-2;
        leftRect.size.height = 2;
        _leftRadiuLabel.frame = leftRect;
        CGRect rightRect = _rightRadiuLabel.frame;
        rightRect.origin.y = self.frame.size.height-2;
        rightRect.size.height = 2;
        _rightRadiuLabel.frame = rightRect;
    }
    _leftRadiuLabel.clipsToBounds = YES;
    _rightRadiuLabel.clipsToBounds = YES;
    _leftRadiuLabel.layer.cornerRadius =_isRadius == YES ? _radiusHeight == 0 ? 1 : _radiusHeight/2 : 0;
    _rightRadiuLabel.layer.cornerRadius = _isRadius == YES ? _radiusHeight == 0 ? 1 : _radiusHeight/2 : 0;
}

- (void)setIsRadius:(BOOL)isRadius {
    _isRadius = isRadius;
    if (_radiuType == radiuLabelTypeBottom) {
        [self setHeightRadius];
    }

}

- (void)setRadiusHeight:(CGFloat)radiusHeight {
    _radiusHeight = radiusHeight;
    if (_radiuType == radiuLabelTypeBottom) {
        [self setHeightRadius];
    }
}

- (void)setRadiusWidth:(CGFloat)radiusWidth {
    _radiusWidth = radiusWidth;
    if (_radiuType == radiuLabelTypeBottom) {
        [self setHeightRadius];
    }
}

- (void)setRadiusColor:(UIColor *)radiusColor {
    _radiusColor = radiusColor;
    _leftRadiuLabel.backgroundColor = radiusColor;
    _rightRadiuLabel.backgroundColor = radiusColor;
}


//弧度
- (void)setRadiusF:(CGFloat)radiusF {
    _leftRadiuLabel.clipsToBounds = YES;
    _rightRadiuLabel.clipsToBounds = YES;
    if (_radiuType == radiuLabelTypeNone) {
        _leftRadiuLabel.layer.cornerRadius = 0;
        _rightRadiuLabel.layer.cornerRadius = 0;
    } else if (_radiuType == radiuLabelTypeLeft) {
        _rightRadiuLabel.layer.cornerRadius = 0;
        _leftRadiuLabel.layer.cornerRadius = radiusF > _leftRadiuLabel.frame.size.height/2 ? _leftRadiuLabel.frame.size.height/2 : radiusF;
    } else if (_radiuType == radiuLabelTypeRight) {
        _leftRadiuLabel.layer.cornerRadius = 0;
        _rightRadiuLabel.layer.cornerRadius = radiusF > _rightRadiuLabel.frame.size.height/2 ? _rightRadiuLabel.frame.size.height/2 : radiusF;
    } else if (_radiuType == radiuLabelTypeLeftWithRight){
        _leftRadiuLabel.layer.cornerRadius = radiusF > _leftRadiuLabel.frame.size.height/2 ? _leftRadiuLabel.frame.size.height/2 : radiusF;
        _rightRadiuLabel.layer.cornerRadius = radiusF > _rightRadiuLabel.frame.size.height/2 ? _rightRadiuLabel.frame.size.height/2 : radiusF;
    } else {
        [self setHeightRadius];
    }
}

@end
