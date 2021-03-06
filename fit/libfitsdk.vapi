/*
 * Written by hand. Twice.
 * Don't break this file, or I will break your kneecaps.
 * In short, that means don't fuck with the included FIT SDK without taking a
 * close look at the API exposed here. Any changes to structs or enums will
 * need to be duplicated in the vapi file to avoid memory issues and other bad
 * things.
 *
 * PS: Yes, I know this API is terrible. Don't ask, and be grateful that you
 * are spared the rant that used to go here.
 */

namespace Fit {
	[CCode (cheader_filename = "sdk/fit_convert.h")]
	namespace Convert {
		[CCode (cname="int", cprefix = "FIT_CONVERT_", has_type_id = false)]
		public enum Result {
			CONTINUE,
			MESSAGE_AVAILABLE,
			ERROR,
			END_OF_FILE,
			PROTOCOL_VERSION_NOT_SUPPORTED,
			DATA_TYPE_NOT_SUPPORTED
		}

		[CCode (cname = "FIT_CONVERT_STATE")]
		public struct State {
			// Private
		}

		[CCode (cname = "FitConvert_Init")]
		public void init(ref Fit.Convert.State state, bool read_file_header);

		[CCode (cname = "FitConvert_Read")]
		public Fit.Convert.Result read(ref Fit.Convert.State state, void * data, uint32 size);

		[CCode (cname = "FitConvert_GetMessageNumber")]
		public Fit.Message.Number get_message_number(ref Fit.Convert.State state);

		[CCode (cname = "FitConvert_GetMessageData")]
		public void * get_message_data(ref Fit.Convert.State state);

		[CCode (cname = "FitConvert_RestoreFields")]
		public void restore_fields(ref Fit.Convert.State state, void * mesg_data);
	}

	[CCode (cname="int", cprefix = "FIT_FILE_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum File {
		INVALID = null,
		DEVICE = 1,
		SETTINGS = 2,
		SPORT = 3,
		ACTIVITY = 4,
		WORKOUT = 5,
		COURSE = 6,
		SCHEDULES = 7,
		WEIGHT = 9,
		TOTALS = 10,
		GOALS = 11,
		BLOOD_PRESSURE = 14,
		MONITORING = 15,
		ACTIVITY_SUMMARY = 20,
		MONITORING_DAILY = 28
	}

	[CCode (cname="int", cprefix = "FIT_DISPLAY_MEASURE_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum DisplayMeasure {
		INVALID = null,
		METRIC,
		STATUTE
	}

	[CCode (cname="int", cprefix = "FIT_DISPLAY_HEART_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum DisplayHeart {
		INVALID = null,
		BPM,
		MAX,
		RESERVE
	}

	[CCode (cname="int", cprefix = "FIT_DISPLAY_POWER_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum DisplayPower {
		INVALID = null,
		WATTS,
		PERCENT_FTP
	}

	[CCode (cname="int", cprefix = "FIT_SPORT_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum Sport {
		INVALID = null,
		GENERIC,
		RUNNING,
		CYCLING,
		TRANSITION,
		FITNESS_EQUIPMENT,
		SWIMMING,
		BASKETBALL,
		SOCCER,
		TENNIS,
		AMERICAN_FOOTBALL,
		TRAINING,
		ALL = 254
	}

	[CCode (cname="int", cprefix = "FIT_SUB_SPORT_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum SubSport {
		INVALID = null,
		GENERIC,
		TREADMILL,
		STREET,
		TRAIL,
		TRACK,
		SPIN,
		INDOOR_CYCLING,
		ROAD,
		MOUNTAIN,
		DOWNHILL,
		RECUMBENT,
		CYCLOCROSS,
		HAND_CYCLING,
		TRACK_CYCLING,
		INDOOR_ROWING,
		ELLIPTICAL,
		STAIR_CLIMBING,
		LAP_SWIMMING,
		OPEN_WATER,
		FLEXIBILITY_TRAINING,
		STRENGTH_TRAINING,
		ALL = 254
	}

	[CCode (cname="int", cprefix = "FIT_ACTIVITY_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum Activity {
		INVALID = null,
		MANUAL,
		AUTO_MULTI_SPORT
	}

	[CCode (cname="int", cprefix = "FIT_INTENSITY_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum Intensity {
		INVALID = null,
		ACTIVE,
		REST,
		WARMUP,
		COOLDOWN
	}

	[CCode (cname="int", cprefix = "FIT_SESSION_TRIGGER_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum SessionTrigger {
		INVALID = null,
		ACTIVITY_END,
		MANUAL,
		AUTO_MULTI_SPORT,
		FITNESS_EQUIPMENT
	}

	[CCode (cname="int", cprefix = "FIT_AUTOLAP_TRIGGER_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum AutolapTrigger {
		INVALID = null,
		TIME,
		DISTANCE,
		POSITION_START,
		POSITION_LAP,
		POSITION_WAYPOINT,
		POSITION_MARKED,
		OFF
	}

	[CCode (cname="int", cprefix = "FIT_LAP_TRIGGER_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum LapTrigger {
		INVALID = null,
		MANUAL,
		TIME,
		DISTANCE,
		POSITION_START,
		POSITION_LAP,
		POSITION_WAYPOINT,
		POSITION_MARKED,
		SESSION_END,
		FITNESS_EQUIPMENT
	}

	[CCode (cname="int", cprefix = "FIT_EVENT_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum Event {
		INVALID = null,
		TIMER = 0,
		WORKOUT = 3,
		WORKOUT_STEP = 4,
		POWER_DOWN = 5,
		POWER_UP = 6,
		OFF_COURSE = 7,
		SESSION = 8,
		LAP = 9,
		COURSE_POINT = 10,
		BATTERY = 11,
		VIRTUAL_PARTNER_PACE = 12,
		HR_HIGH_ALERT = 13,
		HR_LOW_ALERT = 14,
		SPEED_HIGH_ALERT = 15,
		SPEED_LOW_ALERT = 16,
		CAD_HIGH_ALERT = 17,
		CAD_LOW_ALERT = 18,
		POWER_HIGH_ALERT = 19,
		POWER_LOW_ALERT = 20,
		RECOVERY_HR = 21,
		BATTERY_LOW = 22,
		TIME_DURATION_ALERT = 23,
		DISTANCE_DURATION_ALERT = 24,
		CALORIE_DURATION_ALERT = 25,
		ACTIVITY = 26,
		FITNESS_EQUIPMENT = 27,
		LENGTH = 28,
		CALIBRATION = 36
	}

	[CCode (cname="int", cprefix = "FIT_EVENT_TYPE_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum EventType {
		INVALID = null,
		START,
		STOP,
		CONSECUTIVE_DEPRECIATED,
		MARKER,
		STOP_ALL,
		BEGIN_DEPRECIATED,
		END_DEPRECIATED,
		END_ALL_DEPRECIATED,
		STOP_DISABLE,
		STOP_DISABLE_ALL
	}

	[CCode (cname="int", cprefix = "FIT_TIMER_TRIGGER_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum TimerTrigger {
		INVALID = null,
		MANUAL,
		AUTO,
		FITNESS_EQUIPMENT
	}

	[CCode (cname="int", cprefix = "FIT_FITNESS_EQUIPMENT_STATE_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum FitnessEquipmentState {
		INVALID = null,
		READY,
		IN_USE,
		PAUSED,
		UNKNOWN
	}

	[CCode (cname="int", cprefix = "FIT_MANUFACTURER_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum Manufacturer {
		INVALID = null,
		GARMIN = 1,
		GARMIN_FR405_ANTFS = 2,
		ZEPHYR = 3,
		DAYTON = 4,
		IDT = 5,
		SRM = 6,
		QUARQ = 7,
		IBIKE = 8,
		SARIS = 9,
		SPARK_HK = 10,
		TANITA = 11,
		ECHOWELL = 12,
		DYNASTREAM_OEM = 13,
		NAUTILUS = 14,
		DYNASTREAM = 15,
		TIMEX = 16,
		METRIGEAR = 17,
		XELIC = 18,
		BEURER = 19,
		CARDIOSPORT = 20,
		A_AND_D = 21,
		HMM = 22,
		SUUNTO = 23,
		THITA_ELEKTRONIK = 24,
		GPULSE = 25,
		CLEAN_MOBILE = 26,
		PEDAL_BRAIN = 27,
		PEAKSWARE = 28,
		SAXONAR = 29,
		LEMOND_FITNESS = 30,
		DEXCOM = 31,
		WAHOO_FITNESS = 32,
		OCTANE_FITNESS = 33,
		ARCHINOETICS = 34,
		THE_HURT_BOX = 35,
		CITIZEN_SYSTEMS = 36,
		MAGELLAN = 37,
		OSYNCE = 38,
		HOLUX = 39,
		CONCEPT2 = 40,
		ONE_GIANT_LEAP = 42,
		ACE_SENSOR = 43,
		BRIM_BROTHERS = 44,
		XPLOVA = 45,
		PERCEPTION_DIGITAL = 46,
		BF1SYSTEMS = 47,
		PIONEER = 48,
		SPANTEC = 49,
		METALOGICS = 50,
		4IIIIS = 51,
		SEIKO_EPSON = 52,
		SEIKO_EPSON_OEM = 53,
		IFOR_POWELL = 54,
		MAXWELL_GUIDER = 55,
		STAR_TRAC = 56,
		BREAKAWAY = 57,
		ALATECH_TECHNOLOGY_LTD = 58,
		MIO_TECHNOLOGY_EUROPE = 59,
		ROTOR = 60,
		GEONAUTE = 61,
		ID_BIKE = 62,
		SPECIALIZED = 63,
		WTEK = 64,
		PHYSICAL_ENTERPRISES = 65,
		NORTH_POLE_ENGINEERING = 66,
		BKOOL = 67,
		CATEYE = 68,
		STAGES_CYCLING = 69,
		SIGMASPORT = 70,
		DEVELOPMENT = 255,
		ACTIGRAPHCORP = 5759
	}

	[CCode (cname="int", cprefix = "FIT_DEVICE_TYPE_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum DeviceType {
		INVALID = null,
		ANTFS = 1,
		BIKE_POWER = 11,
		ENVIRONMENT_SENSOR_LEGACY = 12,
		MULTI_SPORT_SPEED_DISTANCE = 15,
		CONTROL = 16,
		FITNESS_EQUIPMENT = 17,
		BLOOD_PRESSURE = 18,
		GEOCACHE_NODE = 19,
		LIGHT_ELECTRIC_VEHICLE = 20,
		ENV_SENSOR = 25,
		WEIGHT_SCALE = 119,
		HEART_RATE = 120,
		BIKE_SPEED_CADENCE = 121,
		BIKE_CADENCE = 122,
		BIKE_SPEED = 123,
		STRIDE_SPEED_DISTANCE = 124
	}

	[CCode (cname="int", cprefix = "FIT_BATTERY_STATUS_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum BatteryStatus {
		INVALID = null,
		NEW = 1,
		GOOD = 2,
		OK = 3,
		LOW = 4,
		CRITICAL = 5
	}

	[CCode (cname="int", cprefix = "FIT_SWIM_STROKE_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum SwimStroke {
		INVALID = null,
		FREESTYLE,
		BACKSTROKE,
		BREASTSTROKE,
		BUTTERFLY,
		DRILL,
		MIXED,
		IM
	}

	[CCode (cname="int", cprefix = "FIT_ACTIVITY_TYPE_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum ActivityType {
		INVALID = null,
		GENERIC = 0,
		RUNNING = 1,
		CYCLING = 2,
		TRANSITION = 3,
		FITNESS_EQUIPMENT = 4,
		SWIMMING = 5,
		WALKING = 6,
		ALL = 254
	}

	[CCode (cname="int", cprefix = "FIT_ACTIVITY_SUBTYPE_", cheader_filename = "sdk/fit_example.h", has_type_id = false)]
	public enum ActivitySubtype {
		INVALID = null,
		GENERIC = 0,
		TREADMILL = 1,
		STREET = 2,
		TRAIL = 3,
		TRACK = 4,
		SPIN = 5,
		INDOOR_CYCLING = 6,
		ROAD = 7,
		MOUNTAIN = 8,
		DOWNHILL = 9,
		RECUMBENT = 10,
		CYCLOCROSS = 11,
		HAND_CYCLING = 12,
		TRACK_CYCLING = 13,
		INDOOR_ROWING = 14,
		ELLIPTICAL = 15,
		STAIR_CLIMBING = 16,
		LAP_SWIMMING = 17,
		OPEN_WATER = 18,
		ALL = 254
	}

	[CCode (cheader_filename = "sdk/fit_example.h")]
	namespace Message {
		[CCode (cname="int", cprefix = "FIT_MESG_NUM_", has_type_id = false)]
		public enum Number {
			INVALID = null,
			FILE_ID,
			CAPABILITIES,
			DEVICE_SETTINGS,
			USER_PROFILE,
			HRM_PROFILE,
			SDM_PROFILE,
			BIKE_PROFILE,
			ZONES_TARGET,
			HR_ZONE,
			POWER_ZONE,
			MET_ZONE,
			SPORT,
			GOAL,
			SESSION,
			LAP,
			RECORD,
			EVENT,
			DEVICE_INFO,
			WORKOUT,
			WORKOUT_STEP,
			SCHEDULE,
			WEIGHT_SCALE,
			COURSE,
			COURSE_POINT,
			TOTALS,
			ACTIVITY,
			SOFTWARE,
			FILE_CAPABILITIES,
			MESG_CAPABILITIES,
			FIELD_CAPABILITIES,
			FILE_CREATOR,
			BLOOD_PRESSURE,
			SPEED_ZONE,
			MONITORING,
			HRV,
			LENGTH,
			MONITORING_INFO,
			PAD,
			SLAVE_DEVICE,
			CADENCE_ZONE,
			MFG_RANGE_MIN,
			MFG_RANGE_MAX
		}

		[CCode (cname = "FIT_FILE_ID_MESG")]
		public struct FileID {
			uint32 serial_number; // 
			uint32 time_created; // Only set for files that are can be created/erased. // was FIT_DATE_TIME
			Fit.Manufacturer manufacturer; // 
			uint16 product; // 
			uint16 number; // Only set for files that are not created/erased.
			Fit.File type; // 
		}

		[CCode (cname = "FIT_FILE_CREATOR_MESG")]
		public struct FileCreator {
			uint16 software_version; // 
			uint8 hardware_version; // 
		}

		[CCode (cname = "FIT_ACTIVITY_MESG")]
		public struct Activity {
			uint32 timestamp; //  // was FIT_DATE_TIME
			uint32 total_timer_time; // 1000 * s,Exclude pauses
			uint32 local_timestamp; // timestamp epoch expressed in local time, used to convert activity timestamps to local time  // was FIT_LOCAL_DATE_TIME
			uint16 num_sessions; // 
			Fit.Activity type; // 
			Fit.Event event; // 
			Fit.EventType event_type; // 
			uint8 event_group; // 
		}

		[CCode (cname = "FIT_SESSION_MESG")]
		public struct Session {
			uint32 timestamp; // s,Sesson end time. // was FIT_DATE_TIME
			uint32 start_time; //  // was FIT_DATE_TIME
			int32 start_position_lat; // semicircles,
			int32 start_position_long; // semicircles,
			uint32 total_elapsed_time; // 1000 * s,Time (includes pauses)
			uint32 total_timer_time; // 1000 * s,Timer Time (excludes pauses)
			uint32 total_distance; // 100 * m,
			uint32 total_cycles; // cycles,
			int32 nec_lat; // semicircles,
			int32 nec_long; // semicircles,
			int32 swc_lat; // semicircles,
			int32 swc_long; // semicircles,
			uint32 avg_stroke_count; // 10 * strokes/lap,
			uint32 total_work; // J,
			uint32 total_moving_time; // 1000 * s,
			uint32 time_in_hr_zone[]; // 1000 * s,
			uint32 time_in_speed_zone[]; // 1000 * s,
			uint32 time_in_cadence_zone[]; // 1000 * s,
			uint32 time_in_power_zone[]; // 1000 * s,
			uint32 avg_lap_time; // 1000 * s,
			uint16 message_index; // Selected bit is set for the current session. // was FIT_MESSAGE_INDEX
			uint16 total_calories; // kcal,
			uint16 total_fat_calories; // kcal,
			uint16 avg_speed; // 1000 * m/s,total_distance / total_timer_time
			uint16 max_speed; // 1000 * m/s,
			uint16 avg_power; // watts,total_power / total_timer_time if non_zero_avg_power otherwise total_power / total_elapsed_time
			uint16 max_power; // watts,
			uint16 total_ascent; // m,
			uint16 total_descent; // m,
			uint16 first_lap_index; // 
			uint16 num_laps; // 
			uint16 normalized_power; // watts,
			uint16 training_stress_score; // 10 * tss,
			uint16 intensity_factor; // 1000 * if,
			uint16 left_right_balance; // // was FIT_LEFT_RIGHT_BALANCE_100// was FIT_LEFT_RIGHT_BALANCE
			uint16 avg_stroke_distance; // 100 * m,
			uint16 pool_length; // 100 * m,
			uint16 num_active_lengths; // lengths,# of active lengths of swim pool
			uint16 avg_altitude; // 5 * m + 500,
			uint16 max_altitude; // 5 * m + 500,
			int16 avg_grade; // 100 * %,
			int16 avg_pos_grade; // 100 * %,
			int16 avg_neg_grade; // 100 * %,
			int16 max_pos_grade; // 100 * %,
			int16 max_neg_grade; // 100 * %,
			int16 avg_pos_vertical_speed; // 1000 * m/s,
			int16 avg_neg_vertical_speed; // 1000 * m/s,
			int16 max_pos_vertical_speed; // 1000 * m/s,
			int16 max_neg_vertical_speed; // 1000 * m/s,
			uint16 best_lap_index; // 
			uint16 min_altitude; // 5 * m + 500,
			Fit.Event event; // session
			Fit.EventType event_type; // stop
			Fit.Sport sport; // 
			Fit.SubSport sub_sport; // 
			uint8 avg_heart_rate; // bpm,average heart rate (excludes pause time)
			uint8 max_heart_rate; // bpm,
			uint8 avg_cadence; // rpm,total_cycles / total_timer_time if non_zero_avg_cadence otherwise total_cycles / total_elapsed_time
			uint8 max_cadence; // rpm,
			uint8 total_training_effect; // 
			uint8 event_group; // 
			Fit.SessionTrigger trigger; // 
			Fit.SwimStroke swim_stroke; // swim_stroke,
			Fit.DisplayMeasure pool_length_unit; // 
			uint8 gps_accuracy; // m,
			int8 avg_temperature; // C,
			int8 max_temperature; // C,
			uint8 min_heart_rate; // bpm,
		}

		[CCode (cname = "FIT_LAP_MESG")]
		public struct Lap {
			uint32 timestamp; // s,Lap end time. // was FIT_DATE_TIME
			uint32 start_time; //  // was FIT_DATE_TIME
			int32 start_position_lat; // semicircles,
			int32 start_position_long; // semicircles,
			int32 end_position_lat; // semicircles,
			int32 end_position_long; // semicircles,
			uint32 total_elapsed_time; // 1000 * s,Time (includes pauses)
			uint32 total_timer_time; // 1000 * s,Timer Time (excludes pauses)
			uint32 total_distance; // 100 * m,
			uint32 total_cycles; // cycles,
			uint32 total_work; // J,
			uint32 total_moving_time; // 1000 * s,
			uint32 time_in_hr_zone[]; // 1000 * s,
			uint32 time_in_speed_zone[]; // 1000 * s,
			uint32 time_in_cadence_zone[]; // 1000 * s,
			uint32 time_in_power_zone[]; // 1000 * s,
			uint16 message_index; //  // was FIT_MESSAGE_INDEX
			uint16 total_calories; // kcal,
			uint16 total_fat_calories; // kcal,If New Leaf
			uint16 avg_speed; // 1000 * m/s,
			uint16 max_speed; // 1000 * m/s,
			uint16 avg_power; // watts,total_power / total_timer_time if non_zero_avg_power otherwise total_power / total_elapsed_time
			uint16 max_power; // watts,
			uint16 total_ascent; // m,
			uint16 total_descent; // m,
			uint16 num_lengths; // lengths,# of lengths of swim pool
			uint16 normalized_power; // watts,
			uint16 left_right_balance; // // was FIT_LEFT_RIGHT_BALANCE_100// was FIT_LEFT_RIGHT_BALANCE
			uint16 first_length_index; // 
			uint16 avg_stroke_distance; // 100 * m,
			uint16 num_active_lengths; // lengths,# of active lengths of swim pool
			uint16 avg_altitude; // 5 * m + 500,
			uint16 max_altitude; // 5 * m + 500,
			int16 avg_grade; // 100 * %,
			int16 avg_pos_grade; // 100 * %,
			int16 avg_neg_grade; // 100 * %,
			int16 max_pos_grade; // 100 * %,
			int16 max_neg_grade; // 100 * %,
			int16 avg_pos_vertical_speed; // 1000 * m/s,
			int16 avg_neg_vertical_speed; // 1000 * m/s,
			int16 max_pos_vertical_speed; // 1000 * m/s,
			int16 max_neg_vertical_speed; // 1000 * m/s,
			uint16 repetition_num; // 
			uint16 min_altitude; // 5 * m + 500,
			uint16 wkt_step_index; //  // was FIT_MESSAGE_INDEX
			Fit.Event event; // 
			Fit.EventType event_type; // 
			uint8 avg_heart_rate; // bpm,
			uint8 max_heart_rate; // bpm,
			uint8 avg_cadence; // rpm,total_cycles / total_timer_time if non_zero_avg_cadence otherwise total_cycles / total_elapsed_time
			uint8 max_cadence; // rpm,
			Fit.Intensity intensity; // 
			Fit.LapTrigger lap_trigger; // 
			Fit.Sport sport; // 
			uint8 event_group; // 
			Fit.SwimStroke swim_stroke; // 
			Fit.SubSport sub_sport; // 
			uint8 gps_accuracy; // m,
			int8 avg_temperature; // C,
			int8 max_temperature; // C,
			uint8 min_heart_rate; // bpm,
		}

		[CCode (cname = "FIT_RECORD_MESG")]
		public struct Record {
			uint32 timestamp; // s, // was FIT_DATE_TIME
			int32 position_lat; // semicircles,
			int32 position_long; // semicircles,
			uint32 distance; // 100 * m,
			int32 time_from_course; // 1000 * s,
			uint32 total_cycles; // cycles,
			uint32 accumulated_power; // watts,
			uint16 altitude; // 5 * m + 500,
			uint16 speed; // 1000 * m/s,
			uint16 power; // watts,
			int16 grade; // 100 * %,
			uint16 compressed_accumulated_power; // 
			int16 vertical_speed; // 1000 * m/s,
			uint16 calories; // kcal,
			uint16 cadence256; // 256 * rpm,Log cadence and fractional cadence for backwards compatability
			uint8 heart_rate; // bpm,
			uint8 cadence; // rpm,
			int8 compressed_speed_distance[]; // 
			uint8 resistance; // Relative. 0 is none  254 is Max.
			uint8 cycle_length; // 100 * m,
			int8 temperature; // C,
			uint8 speed_1s[]; // 16 * m/s,Speed at 1s intervals.  Timestamp field indicates time of last array element.
			uint8 cycles; // 
			uint8 left_right_balance; // // was FIT_LEFT_RIGHT_BALANCE
			uint8 gps_accuracy; // m,
			uint8 left_torque_effectiveness; // 2 * percent,
			uint8 right_torque_effectiveness; // 2 * percent,
			uint8 left_pedal_smoothness; // 2 * percent,
			uint8 right_pedal_smoothness; // 2 * percent,
			uint8 combined_pedal_smoothness; // 2 * percent,
		}

		[CCode (cname = "FIT_EVENT_MESG")]
		public struct Event {
			uint32 timestamp; // s, // was FIT_DATE_TIME
			uint32 data; // 
			uint16 data16; // 
			Fit.Event event; // 
			Fit.EventType event_type; // 
			uint8 event_group; // 
		}

		[CCode (cname = "FIT_DEVICE_INFO_MESG")]
		public struct DeviceInfo {
			uint32 timestamp; // s, // was FIT_DATE_TIME
			uint32 serial_number; // 
			uint32 cum_operating_time; // s,Reset by new battery or charge.
			Fit.Manufacturer manufacturer; // 
			uint16 product; // 
			uint16 software_version; // 
			uint16 battery_voltage; // 256 * V,
			uint8 device_index; // // was FIT_DEVICE_INDEX
			Fit.DeviceType device_type; // 
			uint8 hardware_version; // 
			Fit.BatteryStatus battery_status; // 
		}
	}
}