include(posix/px4_impl_posix)

# Get $QC_SOC_TARGET from environment if existing.
if (DEFINED ENV{QC_SOC_TARGET})
	set(QC_SOC_TARGET $ENV{QC_SOC_TARGET})
else()
	set(QC_SOC_TARGET "APQ8074")
endif()

set(CMAKE_TOOLCHAIN_FILE ${PX4_SOURCE_DIR}/cmake/cmake_hexagon/toolchain/Toolchain-arm-linux-gnueabihf.cmake)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PX4_SOURCE_DIR}/cmake/cmake_hexagon")

set(config_generate_parameters_scope ALL)

# Get $QC_SOC_TARGET from environment if existing.
if (DEFINED ENV{QC_SOC_TARGET})
	set(QC_SOC_TARGET $ENV{QC_SOC_TARGET})
else()
	set(QC_SOC_TARGET "APQ8074")
endif()

set(CONFIG_SHMEM "1")

set(config_module_list
	drivers/device
	drivers/blinkm
	drivers/pwm_out_sim
	drivers/rgbled
	drivers/led
	drivers/boards/sitl
	drivers/qshell/posix

	systemcmds/param
	systemcmds/mixer
	systemcmds/ver
	systemcmds/topic_listener

	modules/mavlink

	modules/attitude_estimator_q
	modules/position_estimator_inav
	modules/local_position_estimator
	modules/ekf2

	modules/mc_pos_control
	modules/mc_att_control

	modules/param
	modules/systemlib
	modules/systemlib/mixer
	modules/uORB
	modules/muorb/krait
	modules/sensors
	modules/dataman
	modules/sdlog2
	modules/logger
	modules/simulator
	modules/commander
	modules/navigator
    modules/hello_sky
    modules/attitude_monitor

	lib/controllib
	lib/mathlib
	lib/mathlib/math/filter
	lib/conversion
	lib/ecl
	lib/geo
	lib/geo_lookup
	lib/terrain_estimation
	lib/runway_takeoff
	lib/tailsitter_recovery
	lib/version
	lib/DriverFramework/framework

	platforms/common
	platforms/posix/px4_layer
	platforms/posix/work_queue

	examples/px4_simple_app

	)
