#!/bin/bash
#********************************************************************************
#* Copyright (C) 2017-2021 German Aerospace Center (DLR). 
#* Eclipse ADORe, Automated Driving Open Research https://eclipse.org/adore
#*
#* This program and the accompanying materials are made available under the 
#* terms of the Eclipse Public License 2.0 which is available at
#* http://www.eclipse.org/legal/epl-2.0.
#*
#* SPDX-License-Identifier: EPL-2.0 
#*
#* Contributors: 
#*   Daniel Heß
#********************************************************************************
rosrun topic_tools transform '/vehicle0/odom' '/vehicle0/odom/position_only' 'geometry_msgs/Point' 'geometry_msgs.msg.Point(x=m.pose.pose.position.x, y=m.pose.pose.position.y, z=1)' --import geometry_msgs nav_msgs &
rosrun adore_if_ros plot_scalar_node '/vehicle0/odom/position_only' '2' 'LineColor=1,0,0;LineWidth=5' __name:=plot_odom &
rosrun topic_tools transform '/vehicle0/SIM/state' '/vehicle0/SIM/state/position_only' 'geometry_msgs/Point' 'geometry_msgs.msg.Point(x=m.pose.pose.position.x, y=m.pose.pose.position.y, z=1)' --import geometry_msgs nav_msgs &
rosrun adore_if_ros plot_scalar_node '/vehicle0/SIM/state/position_only' '2' 'LineColor=0,0,1;LineWidth=5' __name:=plot_sim_state &
rosrun topic_tools transform '/vehicle0/localization' '/vehicle0/localization/position_only' 'geometry_msgs/Point' 'geometry_msgs.msg.Point(x=m.pose.pose.position.x, y=m.pose.pose.position.y, z=1)' --import geometry_msgs nav_msgs &
rosrun adore_if_ros plot_scalar_node '/vehicle0/localization/position_only' '2' 'LineColor=0,0.7,0;LineWidth=5' __name:=plot_localization_state &
