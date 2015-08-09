//
//  EventController.h
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventController : NSObject

@property (strong, nonatomic, readonly) NSArray *events;
@property (strong, nonatomic, readonly) NSArray *favoritedEvents;

@property (strong, nonatomic, readonly) NSArray *workshops;
@property (strong, nonatomic, readonly) NSArray *favoritedWorkshops;

- (void)setFavorite:(Event *)event;
- (void)removeFavorite:(Event *)event;
- (void)scheduleLocalNotificationsForEvent:(Event *)event;
- (void)createCalendarEventFromEvent:(Event *)event;

@end
