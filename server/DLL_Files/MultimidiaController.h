// Contains declarations of virtual multimidia functions
#pragma once

#ifdef MULTIMIDIACONTROLLER_EXPORTS
#define MULTIMIDIACONTROLLER_API __declspec(dllexport)
#else
#define MULTIMIDIACONTROLLER_API __declspec(dllimport)
#endif

extern "C" MULTIMIDIACONTROLLER_API void play();
extern "C" MULTIMIDIACONTROLLER_API void stop();
extern "C" MULTIMIDIACONTROLLER_API void volume_up();
extern "C" MULTIMIDIACONTROLLER_API void volume_down();
extern "C" MULTIMIDIACONTROLLER_API void next_track();
extern "C" MULTIMIDIACONTROLLER_API void previous_track();