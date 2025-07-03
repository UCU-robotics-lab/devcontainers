

# // TODO: add all GZ_SIM environment variables

# See https://gazebosim.org/api/sim/8/resources.html


# // GZ_SIM_RESOURCE_PATH  Colon separated paths used to locate  resources such as worlds and models.    
export GZ_SIM_RESOURCE_PATH=$IGN_GAZEBO_RESOURCE_PATH:$GZ_SIM_RESOURCE_PATH
export GZ_SIM_RESOURCE_PATH=/workspaces/Husky_Odyssey/src/odysseus_husky/worlds:$GZ_SIM_RESOURCE_PATH
export GZ_SIM_RESOURCE_PATH=/workspaces/Husky_Odyssey/src/odysseus_husky/urdf/meshes:$GZ_SIM_RESOURCE_PATH
export GZ_SIM_RESOURCE_PATH=/workspaces/Husky_Odyssey/src/odysseus_husky/urdf:$GZ_SIM_RESOURCE_PATH
export GZ_SIM_RESOURCE_PATH=/workspaces/Husky_Odyssey/ros2_ws/install:$GZ_SIM_RESOURCE_PATH
export GZ_SIM_RESOURCE_PATH=/opt/ros/jazzy/share:$GZ_SIM_RESOURCE_PATH
export GZ_SIM_RESOURCE_PATH=/opt/ros/jazzy/opt/gz_sim_vendor/share/gz/gz-sim8:$GZ_SIM_RESOURCE_PATH
export GZ_SIM_RESOURCE_PATH=/opt/ros/jazzy/opt/gz_sim_vendor/share/gz/gz-sim8/worlds:$GZ_SIM_RESOURCE_PATH

# //  GZ_SIM_SYSTEM_PLUGIN_PATH    Colon separated paths used to locate system plugins.                
export GZ_SIM_SYSTEM_PLUGIN_PATH=/workspaces/Husky_Odyssey/build:$GZ_SIM_SYSTEM_PLUGIN_PATH
export GZ_SIM_SYSTEM_PLUGIN_PATH=/workspaces/Husky_Odyssey/ros2_ws/install:$GZ_SIM_SYSTEM_PLUGIN_PATH
export GZ_SIM_SYSTEM_PLUGIN_PATH=/workspaces/Husky_Odyssey/ros2_ws/install/odysseus_husky/share/odysseus_husky/plugins:$GZ_SIM_SYSTEM_PLUGIN_PATH
export GZ_SIM_SYSTEM_PLUGIN_PATH=/opt/ros/jazzy/lib:$GZ_SIM_SYSTEM_PLUGIN_PATH
export GZ_SIM_SYSTEM_PLUGIN_PATH=/opt/ros/jazzy/opt:$GZ_SIM_SYSTEM_PLUGIN_PATH
export GZ_SIM_SYSTEM_PLUGIN_PATH=/opt/ros/jazzy/opt/gz_sim_vendor/lib:$GZ_SIM_SYSTEM_PLUGIN_PATH

unset IGN_GAZEBO_RESOURCE_PATH
unset IGN_GAZEBO_MODEL_PATH

# Materials, textures, shaders (media)
# -- exactly this variable is insufficient, required shaders are not there!
# export GZ_RENDERING_RESOURCE_PATH=/opt/ros/jazzy/opt/gz_sim_vendor/share/gz/gz-sim8/media

# //  GZ_SIM_SERVER_CONFIG_PATH    Path to server configuration file.             

# //  GZ_GUI_PLUGIN_PATH           Colon separated paths used to locate GUI         
# // plugins.                                                                       
# //  GZ_GUI_RESOURCE_PATH    Colon separated paths used to locate GUI              
# // resources such as configuration files.       