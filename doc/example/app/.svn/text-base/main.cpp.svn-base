#include <pthread.h>
#include <boost/thread/mutex.hpp>

#include "foo/foo.h"
#include "bar/bar.h"

typedef boost::mutex Mutex;
typedef Mutex::scoped_lock Lock;

int main()
{
    Foo();
    Bar();
    pthread_setconcurrency(10);

    Mutex mutex;
    Lock lock(mutex);
}
