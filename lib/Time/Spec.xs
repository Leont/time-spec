#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

typedef struct timespec* Time__Spec;

#define timespec_sec(self) (self)->tv_sec
#define timespec_nsec(self) (self)->tv_nsec
#define timespec_to_float(self) (self)->tv_sec + ((self)->tv_nsec / (double)1000000000)
#define timespec__to_bool(self) TRUE

MODULE = Time::Spec		PACKAGE = Time::Spec	PREFIX = timespec_

PROTOTYPES: DISABLE

FALLBACK: TRUE

Time::Spec timespec_new(class, struct timespec value)
CODE:
	RETVAL = safecalloc(1, sizeof(struct timespec));
	*RETVAL = value;
OUTPUT:
	RETVAL

Time::Spec timespec_new_from_pair(class, UV secs, UV nsecs)
CODE:
	RETVAL = safecalloc(1, sizeof(struct timespec));
	RETVAL->tv_sec = secs;
	RETVAL->tv_nsec = nsecs;
OUTPUT:
	RETVAL

UV timespec_sec(Time::Spec self)

UV timespec_nsec(Time::Spec self)

NV timespec_to_float(Time::Spec self, ...)
OVERLOAD: 0+

bool timespec__to_bool(Time::Spec self, ...)
OVERLOAD: bool

void timespec_to_pair(Time::Spec self, OUTLIST UV sec, OUTLIST UV nsec)
CODE:
	sec = self->tv_sec;
	nsec = self->tv_nsec;
